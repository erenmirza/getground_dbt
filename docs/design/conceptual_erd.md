```mermaid
---
title: Getground ERD
---
erDiagram
    CONSULTANT ||--|{ REFERRAL : sends
    CUSTOMER ||--|{ REFERRAL : receives
    CUSTOMER }|--|{ COMPANY : signs_up
    PARTNER ||--|{ CONSULTANT : employs
```