# Master Table of Contents

> Le nombre de pages n'est pas fixé. Le contenu prévaut. Chaque partie doit être complète avant réduction éditoriale éventuelle.

## Partie 0 — Mode d'emploi de l'ouvrage
1. Préface
2. Comment lire les diagrammes
3. Convention PUBLIC_VERIFIED / REFERENCE_ARCHITECTURE / INFERRED / RUNTIME_PROVEN
4. Chronologie et versions documentaires
5. Carte générale de l'écosystème

## Partie I — Wero, EPI et la souveraineté des paiements européens
6. Pourquoi Wero existe
7. EPI : acteurs, gouvernance et périmètre public
8. Wallet, scheme, rail, clearing et settlement : ne pas confondre
9. Acteurs : consommateur, marchand, PSP, banque, acquéreur, CSM, banque centrale
10. Modèle de responsabilité et frontières de confiance
11. Roadmap fonctionnelle versionnée

## Partie II — Parcours Wero de bout en bout
12. P2P
13. Consumer-to-Business
14. E-commerce desktop
15. E-commerce mobile / app-to-app
16. POS / QR
17. NFC lorsqu'applicable et documenté
18. Refund
19. Return
20. Recall
21. Dispute
22. Recurring / subscription / consent lifecycle
23. États d'un paiement et machine d'état

## Partie III — Architecture fonctionnelle
24. Capability map
25. Domain map
26. Payment orchestration
27. Directory / alias
28. Consent / mandate
29. Fraud / risk
30. VoP
31. Reconciliation
32. Notification / webhook
33. Merchant / Acceptor
34. Consumer PSP
35. Acceptor PSP

## Partie IV — ISO 20022 de bout en bout
36. Modèle ISO 20022
37. Business Application Header
38. pacs.008
39. pacs.002
40. pacs.004
41. pacs.028
42. camt.029
43. camt.052 / camt.053 / camt.054
44. camt.056
45. pain messages lorsque pertinents
46. Identifiants, corrélation et références
47. Reason codes
48. XML annoté
49. Validation XSD et règles de scheme
50. Versioning ISO 20022

## Partie V — SCT Inst
51. Scheme SCT Inst
52. Rulebook et Implementation Guidelines
53. Cycle normal
54. Rejet
55. Timeout
56. UNKNOWN
57. Investigation
58. Duplicate protection
59. Idempotency
60. Recall / return
61. Rapprochement
62. Edge cases

## Partie VI — Rails, clearing, settlement et liquidité
63. Vue d'ensemble des rails européens
64. CSM et reachability
65. T2 / TARGET Services
66. TIPS
67. RT1
68. STET lorsque pertinent
69. Central Bank Money
70. Prefunding et positions
71. Liquidity management 24/7/365
72. Week-end et jours fériés
73. Liquidity stress scenarios
74. Multi-rail / routing decisions
75. Settlement finality

## Partie VII — Réseaux et flux
76. Cartographie réseau de référence
77. Zones de sécurité
78. Internet / mobile edge
79. DNS
80. CDN / anti-DDoS
81. WAF
82. Load balancers et reverse proxies
83. API Gateway
84. Firewalls
85. Réseau interne
86. Réseau bancaire et interconnexions
87. Dual connectivity
88. TLS / mTLS
89. PKI / certificats
90. HSM connectivity
91. Flux Nord/Sud
92. Flux Est/Ouest
93. Latency budget
94. Network failure modes
95. Matrice des flux et ports

## Partie VIII — Architecture applicative et API
96. Reference application architecture
97. API contracts
98. OAuth2 / OIDC
99. Webhooks
100. Idempotency keys
101. Correlation IDs
102. API versioning
103. Error model
104. Service boundaries
105. Payment Hub integration
106. Core Banking integration
107. Legacy integration

## Partie IX — Event-driven architecture
108. Pourquoi l'événementiel
109. Kafka / protocol contract
110. Outbox
111. Inbox
112. Delivery semantics
113. Exactly-once : limites et réalités
114. Deduplication
115. Saga / orchestration
116. Replay contrôlé
117. DLQ
118. Audit event stream

## Partie X — Data architecture
119. Transaction store
120. Ledger
121. Payment state model
122. Reconciliation store
123. Directory data
124. Fraud data
125. Audit trail
126. Encryption
127. Retention
128. Data consistency
129. Quorum / consensus
130. CAP appliqué au paiement
131. RPO=0 : définition et limites

## Partie XI — Infrastructure et plateforme
132. Datacenter reference
133. Cloud reference
134. Multi-AZ
135. Multi-region
136. Kubernetes
137. OpenShift
138. Ingress
139. Service mesh
140. Databases HA
141. Kafka HA
142. Cache
143. Storage
144. Backup / PITR
145. GitOps
146. Secrets
147. Supply chain

## Partie XII — Cybersécurité et identité
148. Threat model
149. Zero Trust
150. Customer IAM
151. Workload IAM
152. SCA
153. OAuth2/OIDC
154. TLS/mTLS
155. PKI
156. HSM
157. Key lifecycle
158. Tokenisation
159. Fraud
160. AML/CFT
161. Sanctions
162. VoP
163. Security logging
164. Incident response

## Partie XIII — Résilience opérationnelle
165. 24/7/365 engineering
166. Failure domains
167. SLA / SLO / SLI
168. BIA
169. RTO / RPO
170. Active/passive
171. Active/active
172. Cell architecture
173. Database failover
174. Messaging failover
175. DNS failure
176. PKI/HSM failure
177. CSM failure
178. Site loss
179. Region loss
180. Split brain
181. Fencing
182. Degraded modes
183. Reconciliation after incident
184. Failback
185. Chaos engineering
186. Production resilience evidence

## Partie XIV — DORA et réglementation
187. Instant Payments Regulation
188. EPC scheme governance
189. PSD2
190. PSD3 / PSR — état versionné
191. DORA
192. DORA RTS / ITS
193. ICT risk management
194. Incident reporting
195. Resilience testing
196. TLPT / TIBER-EU
197. ICT third-party risk
198. Concentration risk
199. Exit strategy
200. Register of Information
201. RGPD
202. AML/CFT
203. Sanctions
204. eIDAS2
205. Articulation NIS2/DORA lorsque applicable

## Partie XV — Exploitation / SRE
206. Operating model
207. Observability
208. OpenTelemetry
209. Logs
210. Metrics
211. Traces
212. Business observability
213. Dashboards
214. Alerting
215. Capacity planning
216. Performance
217. Latency SLOs
218. Incident management
219. Runbooks
220. Post-mortem
221. Release / rollback
222. Production readiness

## Partie XVI — Architecture d'une banque connectée à Wero
223. Reference bank architecture
224. Digital channel
225. API management
226. IAM
227. Payment orchestrator
228. Fraud
229. Payment Hub
230. Core banking
231. SCT Inst gateway
232. CSM connectivity
233. Reconciliation
234. Notification
235. Operations
236. Legacy-centric vs hybrid vs cloud-native

## Partie XVII — Architecture PSP / Acquéreur / Marchand
237. PSP architecture
238. Acceptor architecture
239. Merchant integration
240. Checkout
241. Webhook
242. Refund
243. Reconciliation merchant
244. Availability dependencies
245. Security boundaries

## Partie XVIII — Tests et preuves
246. Test strategy
247. Contract tests
248. ISO 20022 tests
249. E2E
250. Performance
251. Chaos
252. DR exercises
253. Security tests
254. Evidence model
255. Claim-evidence matrix

## Partie XIX — Interopérabilité et avenir
256. European wallet interoperability
257. Cross-border instant payments
258. One-Leg-Out
259. FX
260. Digital Euro : différences et interactions possibles
261. Digital identity
262. Future merchant services
263. Architecture européenne 2030

## Annexes
A. Glossaire
B. Acronymes
C. Catalogue ISO 20022
D. Reason codes
E. Matrice des flux
F. Checklist réseau
G. Checklist architecture
H. Checklist sécurité
I. Checklist DORA
J. Checklist PRA
K. Production Readiness Review
L. 40+ scénarios de panne
M. Modèle DCA
N. Matrice RTO/RPO
O. RACI
P. Bibliographie officielle
Q. Changelog réglementaire
R. Index
