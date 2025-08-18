<p align="center">
  <img width="382" height="125" alt="Project_Calico_logo" src="https://github.com/user-attachments/assets/1820c808-9445-447c-bdf1-d329b1a570c4" />
</p>

# Calico Cloud Demo Workshop 🚀  

Welcome to the **Calico Cloud Demo Workshop** — your hands-on guide to experiencing **enterprise-grade Kubernetes security and observability**.  

With this workshop, you’ll learn how Calico Cloud helps teams:  
- Enforce **Zero Trust microsegmentation** with fine-grained policies  
- Block **known malicious traffic** using threat intelligence feeds  
- Gain **real-time visibility** into workloads, flows, and dependencies  
- Simplify **compliance at scale** with policy tiers and audit-ready guardrails  
- Empower DevOps and Security teams to **ship faster, safer, and with confidence**  

---

## 🛠️ What You’ll Build  

By the end of this workshop, you will:  
- Connect your Kubernetes cluster to **Calico Cloud**  
- Deploy three demo applications:  
  - **Online Boutique** 🛍️ — modern e-commerce microservices app  
  - **YaoBank** 🏦 — classic 3-tier banking system  
  - **Bookinfo** 📚 — product page with supporting services  
- Expose them via the **NGINX Ingress Controller**  
- Secure traffic flows using **Calico tiers and network policies** (security → platform → application → appsec)  

This journey shows both **business value** (compliance, Zero Trust, visibility) and **technical depth** (eBPF data plane, policy hierarchy, observability).  

---

## 📖 Workshop Modules  

1. [01 — Prerequisites](modules/01-prereqs.md)  
2. [02 — Connect to Calico Cloud](modules/02-connect-calico-cloud.md)  
3. [03 — Deploy Applications](modules/03-deploy-apps.md)  
4. [04 — Deploy NGINX Ingress Controller](modules/04-deploy-nginx.md)  
5. [05 — Apply Network Policies with Calico](modules/05-tiers-and-policies.md)  

---

# Knowledge Hub 📚

After completing the modules, explore the **Knowledge Hub** for deeper context on the Calico Cloud features you just used.  
Each topic includes a short explanation and a link to the official documentation for deeper dives.  

---

## 🔐 Microsegmentation
Learn how to isolate workloads and restrict traffic flows with **fine-grained network policies**.  
[Read more →](knowledge-hub/microsegmentation.md)

---

## 👀 Observability
Visualize traffic with **Service Graph**, **Flow Visualizer**, and **Policy Board**. Gain deep insights into workloads and identify misconfigurations in real-time.  
[Read more →](knowledge-hub/observability.md)

---

## 🛡️ Threat Defense
Use Calico Cloud’s **threat feeds, DNS controls, and anomaly detection** to block malicious IPs and secure your workloads against evolving attacks.  
[Read more →](knowledge-hub/threat-defense.md)

---

## 🧭 Zero Trust with Tiers & Policies
Implement **Zero Trust security** by layering policies across tiers (security → platform → application → appsec). Ensure every workload communicates only as intended.  
[Read more →](knowledge-hub/tiers-policies.md)

---

👉 Each page contains a concise overview plus a link to the official [Tigera Docs](https://docs.tigera.io) for complete details.
