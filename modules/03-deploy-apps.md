# 03 — Deploy Applications

In this module, we’ll deploy **three apps** into their own namespaces so we can demonstrate **microsegmentation** and **observability** with Calico Cloud.

---

## 0) Create Namespaces (run first)

Apply the namespaces YAML from this repo before deploying any apps.

```bash
kubectl apply -f scripts/namespaces.yaml
```

Quick check:

```bash
kubectl get ns online-boutique yaobank bookinfo
```

---

## 1) Online Boutique (polyglot microservices) 🛍️

**What it is:** An e‑commerce demo built from multiple services (e.g., frontend, product catalog, cart, checkout, payment, adservice, recommendation, shipping, Redis). Great for service‑to‑service policy examples.

**Deploy**

```bash
kubectl apply -f apps/1-onlineboutique/
```

**Quick check**

```bash
kubectl -n online-boutique get deploy,svc,pod
kubectl -n online-boutique get pods --show-labels
```

---

## 2) YaoBank (simple 3‑tier) 🏦

**What it is:** A classic 3‑tier sample with `customer` (frontend), `summary` (API), and `database`. Useful for tier isolation and namespace‑scoped policies.

**Deploy**

```bash
kubectl apply -f apps/2-yaobank/
```

**Quick check**

```bash
kubectl -n yaobank get deploy,svc,pod
kubectl -n yaobank get pods --show-labels
```

---

## 3) Bookinfo (product page + supporting services) 📚

**What it is:** An app with `productpage` (frontend) plus `details`, `reviews`, and `ratings`. Good for demonstrating label/namespace selectors and policy order (mesh‑agnostic).

**Deploy**

```bash
kubectl apply -f apps/3-bookinfo/
```

**Quick check**

```bash
kubectl -n bookinfo get deploy,svc,pod
kubectl -n bookinfo get pods --show-labels
```

---

## Troubleshooting tip

```bash
kubectl -n <ns> get events --sort-by=.lastTimestamp | tail -n 50
kubectl -n <ns> describe pod <pod-name>
```

---

## Navigation

⬅️ [02 — Connect to Calico Cloud](./02-connect-calico-cloud.md)
➡️ [04 — Deploy NGINX Ingress Controller](./04-deploy-nginx.md)
