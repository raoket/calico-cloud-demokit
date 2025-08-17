# Microsegmentation with Calico 🔐

Traditional perimeter security is no longer enough — modern applications are dynamic, distributed, and constantly changing. Microsegmentation ensures you can enforce **Zero Trust at scale**, reducing lateral movement risks and aligning with compliance standards (PCI DSS, NIST, ISO 27001). 🚀

---

## What You’ll Learn

* How to segment workloads across namespaces using **Calico tiers** (security → platform → application → appsec).
* Enforcing **least-privilege access** between services — e.g., Online Boutique frontend → checkout, but not DB directly.
* Using **Calico Cloud’s Service Graph** and **Flow Visualizer** to identify and validate traffic flows.
* Leveraging **global policies** to stop known-bad IPs at the edge with built-in threat feeds.
* Rolling out Zero Trust step by step: start permissive, tighten rules, and validate along the way.

---

## Why It Matters

* **Security**: Reduce blast radius of an attack by isolating workloads.
* **Compliance**: Map policies directly to frameworks like PCI DSS and ISO 27001.
* **Visibility**: Get full observability into east-west traffic with Calico’s visual tools.
* **Confidence**: Prove policy enforcement live during audits.

---

📖 Learn more in the official docs: [Calico Microsegmentation](https://docs.tigera.io/use-cases/microsegmentation)

---

## Navigation

⬅️ [Back to Knowledge Hub](../README.md#knowledge-hub-)
➡️ [Observability](observability.md)
