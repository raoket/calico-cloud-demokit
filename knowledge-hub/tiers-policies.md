# Zero Trust with Tiers & Policies 🧭

Modern security requires **layered defense** — a single flat policy model isn’t enough to enforce **Zero Trust** in Kubernetes. Calico Cloud introduces **policy tiers**, giving you the control to build guardrails and application-specific rules without collisions.

Tiers let you define policy intent at different levels (security, platform, application, appsec), so Dev, Ops, and Sec teams can all contribute without stepping on each other.

---

## What You’ll Learn

* How **Calico tiers** (security → platform → application → appsec) organize enforcement into logical layers.
* Using **default-deny** at each tier and then explicitly allowing required flows.
* Separating **infrastructure rules** (DNS, ingress controller) from **application policies**.
* Safely rolling out **fine-grained appsec policies** once baseline tiers are in place.
* How this model supports **Zero Trust** adoption and aligns with compliance (NIST, ISO 27001, PCI DSS).

---

## Why It Matters

* **Clarity**: Each team (SecOps, Platform, AppDev) knows where their rules live.
* **Safety**: Guardrail tiers prevent accidental lockouts or overly broad allows.
* **Compliance**: Explicit tiers map to layered controls in frameworks like PCI DSS and NIST.
* **Agility**: Developers can ship app-specific policies without weakening security.

---

📖 Learn more in the official docs: [Calico Policy Tiers](https://docs.tigera.io/calico-enterprise/latest/network-policy/policy-tiers/)

---

### Navigation

← [Threat Defense](threat-defense.md) | [Back to README](../README.md)
