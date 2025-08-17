# 02 — Connect to Calico Cloud

In this step, you’ll connect your Kubernetes cluster to **Calico Cloud** for centralized visibility and policy management. 🌐

---

## Steps

1. Log in to the **Calico Cloud UI**: [https://www.calicocloud.io/home](https://www.calicocloud.io/home)
2. Go to **Managed Clusters** → **Add Cluster**, and select your Kubernetes provider (EKS, GKE, AKS, or Other).
3. Copy the generated `kubectl` command provided in the UI.
4. Run the command in your terminal (ensure your `kubectl` context points to the correct cluster).

---

## Validation

Verify that the Calico components are healthy:

```bash
kubectl get -n tigera-operator tigerastatus
kubectl get -n calico-system pods
```

**Expected results:**

* `tigerastatus` reports **Available=True**
* All pods in `calico-system` are in **Running** or **Ready** state

---

✅ Once confirmed, your cluster is successfully connected to Calico Cloud. Continue to the next module to deploy applications.

---

⬅️ [Previous: 01 — Prerequisites](01-prereqs.md)  |  ➡️ [Next: 03 — Deploy Applications](03-deploy-apps.md)
