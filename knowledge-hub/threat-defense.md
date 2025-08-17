# Threat Defense with Calico 🛡️

Kubernetes clusters are exposed to **ever-evolving threats** — from malicious IPs and DNS abuse to zero-day exploits. Calico Cloud provides **multi-layered defenses** to block, detect, and respond in real time. 🚨

---

## What You’ll Learn

* How to use **GlobalNetworkPolicies** with **threat intelligence feeds** (AlienVault OTX, custom feeds, and more) to automatically block traffic from **known malicious IPs**. These feeds are updated continuously, ensuring your defenses adapt to the latest attacks without manual intervention.
* Enforce **DNS policies** to restrict which domains workloads can query (prevent data exfiltration via DNS tunneling).
* Detect **suspicious anomalies** with Calico Cloud’s observability and alerting capabilities.
* Combine **Zero Trust segmentation** with **real-time threat feeds** for a layered, defense-in-depth security model.

---

## Why It Matters

* **Proactive Security**: Threat feeds stop malicious connections **before they ever reach your workloads**.
* **Compliance**: Demonstrate proactive controls for PCI DSS, HIPAA, and NIST audits by blocking known-bad IPs.
* **Reduced Risk**: Prevent DNS-based data leakage and block lateral movement from compromised pods.
* **Adaptive Defense**: With automatic updates from OTX and other sources, your policies evolve as the threat landscape changes.

---

📖 Learn more in the official docs: [Threat Defense](https://docs.tigera.io/threat)

---

⬅️ [Observability](observability.md) | ➡️ [Zero Trust with Tiers & Policies](tiers-policies.md)
