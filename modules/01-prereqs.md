# 01 — Prerequisites (Cluster Already Exists)

Before we begin, let’s confirm the environment is ready.

---

## 📦 Cluster Requirements
- Kubernetes **v1.28 – v1.31** (tested versions)  
- At least **3 worker nodes**, each with **≥ 2 vCPU** and **8 GiB RAM**  
- Outbound internet access from nodes (for pulling images and Helm charts)  

---

## 🛠 Access & Tools
You’ll need the following installed **locally** (on your workstation/CloudShell):  
- `kubectl` (configured with **cluster-admin** privileges to your target cluster)  
- `helm` (v3.9.0 or later recommended)  
- `jq` (for JSON processing in helper scripts)  

> ✅ Run `kubectl get nodes` to confirm you’re connected to the right cluster before proceeding.  

---

## 🔍 Quick Validation
Check your tools are available:

```bash
kubectl version --short
helm version
jq --version
```

Expected: versions print successfully with no errors.

---

## ▶️ Next Step
Proceed to [02 — Connect to Calico Cloud](02-connect-calico-cloud.md)  

---

### 🔗 Navigation
- **Next:** [02 — Connect to Calico Cloud](02-connect-calico-cloud.md)
