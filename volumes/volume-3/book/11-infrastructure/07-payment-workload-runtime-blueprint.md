---
status: COLLECTION_V2_REVIEWED
last_verified: 2026-09-29
truth_level: REFERENCE_ARCHITECTURE
primary_sources:
  - kubernetes-probes
  - kubernetes-topology-spread
  - kubernetes-pdb
  - openshift-4.22-network-policy
---

# Payment workload runtime blueprint — OpenShift/Kubernetes

This blueprint turns the platform principles into a concrete workload pattern. It is illustrative, not a claim about EPI internal infrastructure.

## Deployment contract

A stateless payment API should make explicit:

- replicas;
- requests/limits;
- startup/readiness/liveness;
- termination/drain behaviour;
- topology spread;
- disruption policy;
- service account;
- network policy;
- configuration/secret sources;
- observability endpoints.

Kubernetes documents distinct purposes for startup, readiness and liveness probes: startup protects slow initialisation, readiness controls traffic eligibility, and liveness is for process failure that warrants restart. A dependency outage should not automatically become a liveness failure.

## Reference Deployment

```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: payment-api
spec:
  replicas: 3
  selector:
    matchLabels:
      app: payment-api
  template:
    metadata:
      labels:
        app: payment-api
    spec:
      serviceAccountName: payment-api
      topologySpreadConstraints:
        - maxSkew: 1
          topologyKey: kubernetes.io/hostname
          whenUnsatisfiable: DoNotSchedule
          labelSelector:
            matchLabels:
              app: payment-api
      containers:
        - name: api
          image: example.invalid/payment-api:immutable-digest
          ports:
            - containerPort: 8080
          resources:
            requests:
              cpu: "500m"
              memory: "512Mi"
            limits:
              memory: "1Gi"
          startupProbe:
            httpGet:
              path: /health/startup
              port: 8080
            periodSeconds: 5
            failureThreshold: 30
          readinessProbe:
            httpGet:
              path: /health/ready
              port: 8080
            periodSeconds: 5
            timeoutSeconds: 2
          livenessProbe:
            httpGet:
              path: /health/live
              port: 8080
            periodSeconds: 10
            timeoutSeconds: 2
            failureThreshold: 3
```

Values are illustrative and must be load-tested.

## Readiness policy

Readiness can include dependencies that are mandatory to serve the endpoint correctly. It should not include every optional downstream system.

Examples:

- local configuration valid: mandatory;
- database required for this API path: potentially mandatory;
- optional analytics exporter: not mandatory;
- external notification service: normally not a reason to remove payment API traffic.

## Liveness policy

Liveness answers: "is this process irrecoverably unhealthy such that restart is useful?"

Do not tie liveness directly to:

- CSM availability;
- database failover in progress;
- Kafka temporary outage;
- external fraud API timeout.

Otherwise a dependency incident can trigger mass pod restarts and amplify the incident.

## Topology spread

Kubernetes topology spread constraints distribute replicas across labelled failure domains. They only provide the failure-domain property that the infrastructure actually exposes.

A single-node CRC can validate manifest syntax and application behaviour; it cannot prove zone resilience.

## PodDisruptionBudget

Reference:

```yaml
apiVersion: policy/v1
kind: PodDisruptionBudget
metadata:
  name: payment-api
spec:
  minAvailable: 2
  selector:
    matchLabels:
      app: payment-api
```

A PDB helps constrain supported voluntary disruptions. It is not protection against node crash, application defect, zone loss or database failure.

## Network policy

OpenShift 4.22 documents NetworkPolicy as the mechanism for restricting allowed ingress/egress to selected pods.

Reference baseline:

- default deny for application namespace;
- explicit ingress from approved gateway/router path;
- explicit egress to DNS, database, broker, IAM and required external gateways;
- no broad egress "just in case".

## Payment-specific correctness

Replica count does not provide financial correctness.

The application still needs:

- unique logical payment identity;
- durable submit claim;
- idempotency;
- transaction isolation/optimistic versioning as applicable;
- Outbox/Inbox;
- external-effect fencing;
- reconciliation.

## Runtime proof levels

| Environment | Can prove | Cannot prove |
|---|---|---|
| single-node CRC | deploy, probes, restart, config, API behaviour, basic NetworkPolicy | node/AZ/site HA |
| multi-node lab | scheduling, node loss, disruption behaviour | production scale/site DR |
| multi-zone preprod | zone distribution/failure tests | production traffic without equivalent load |
| production exercise | operational capability under approved scope | every future failure |

This distinction is mandatory for `RUNTIME_PROVEN`.
