# Project4
Pod4 Project Repository


This project follows the **Git Flow** branching model to manage development and release. Below is the branching structure and usage guidelines.

## **Main Branches**  

- **`main`** – The stable branch used for production releases. Only tested and approved code is merged here.  
- **`develop`** – The main integration branch where features and bug fixes are merged before being released.

## **Supporting Branches**  

These branches help manage different aspects of the development lifecycle. They are created based on specific needs and follow a defined naming convention.

### **Feature Branches**  
- **Prefix:** `feature/`  
- **Purpose:** Used for developing new features.  
- **Base Branch:** `develop`  
- **Merge Into:** `develop`  

**Example:**  
```bash
git checkout -b feature/new-feature develop
```

### **Bugfix Branches**  
- **Prefix:** `bugfix/`  
- **Purpose:** Used for fixing bugs found in `develop`.  
- **Base Branch:** `develop`  
- **Merge Into:** `develop`  

**Example:**  
```bash
git checkout -b bugfix/fix-issue develop
```

### **Release Branches**  
- **Prefix:** `release/`  
- **Purpose:** Used to prepare a new production release by stabilizing the code and performing final testing.  
- **Base Branch:** `develop`  
- **Merge Into:** `main`, `develop`  

**Example:**  
```bash
git checkout -b release/v1.0 develop
```

### **Hotfix Branches**  
- **Prefix:** `hotfix/`  
- **Purpose:** Used to fix critical issues in `main` that need immediate patches.  
- **Base Branch:** `main`  
- **Merge Into:** `main`, `develop`  

**Example:**  
```bash
git checkout -b hotfix/urgent-fix main
```

### **Support Branches**  
- **Prefix:** `support/`  
- **Purpose:** Used for long-term maintenance of previous stable versions.  
- **Base Branch:** `main`  
- **Merge Into:** `main`  

## **Versioning**  
- No specific version tag prefix is defined. Tags can be applied manually when necessary.  

## **Hooks and Filters**  
- Git hooks are stored in the `.git/hooks` directory.  

## **Workflow Summary**  
1. **Develop new features** in `feature/` branches → Merge into `develop`.  
2. **Fix bugs** in `bugfix/` branches → Merge into `develop`.  
3. **Prepare releases** using `release/` branches → Merge into `main` and `develop`.  
4. **Fix critical production issues** using `hotfix/` branches → Merge into `main` and `develop`.  

---

This document provides a structured workflow for maintaining a clean and efficient Git repository using Git Flow.