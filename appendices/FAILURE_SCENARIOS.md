# Failure Scenario Catalogue

1. Application process crash before DB commit
2. Application crash after DB commit
3. Crash after downstream settlement before local commit
4. Duplicate client request
5. 100 concurrent same-key requests
6. Webhook lost
7. Duplicate webhook
8. Out-of-order webhook
9. Kafka unavailable
10. Kafka publish ack lost
11. Consumer lag
12. DLQ growth
13. DB leader loss
14. DB network partition
15. DB storage latency
16. Split brain risk during promotion
17. DNS outage
18. DNS stale target
19. WAF failure
20. External LB target failure
21. Router pod failure
22. Router worker failure
23. Zone loss
24. Site loss
25. Region loss
26. TLS cert expiry
27. Bad truststore rollout
28. CA compromise/rotation
29. HSM unavailable
30. IAM unavailable
31. JWK refresh failure
32. Fraud service timeout
33. VoP unavailable
34. CSM connectivity loss
35. TIPS/RT1 participant connectivity degraded
36. Beneficiary PSP slow
37. Timeout before financial effect
38. Timeout after financial effect
39. Liquidity threshold breach
40. Liquidity depletion
41. Liquidity-transfer path unavailable
42. Reconciliation feed late
43. Statement/reporting mismatch
44. Merchant retry storm
45. Consumer retry storm
46. Bad deployment increases rejects
47. ISO 20022 schema/version mismatch
48. Address-format non-compliance
49. Security incident requires credential revocation
50. Third-party provider outage
51. Subcontractor outage
52. Observability outage during payment incident
53. Clock skew impacts token/message validation
54. Backup restore fails
55. Failback creates duplicate writer

For each scenario record:
- failure domain ;
- injection method ;
- expected business service ;
- expected payment state ;
- expected data state ;
- target RTO/RPO ;
- observed RTO/RPO ;
- reconciliation action ;
- evidence link ;
- remediation.
