# Git Training - Aman Sir - Branching

## Git Workflow Guide

## How to Create a New Branch?

Creating a new branch in Git is a crucial step for managing different features, fixes, or experiments. You can use the following syntax:

```bash
# Syntax:
git branch <branch_name>
```

> Note: We create a new branch named **release_{env_branch}_{feature_name}**
> Here env meance dev prod alpha
>
### Example

To create branches like `dev`, `alpha`, or `prod`, use the following commands:

```bash
git branch dev
git branch alpha
git branch prod
git branch beta
# This will create a branch named 'prod'
```

If you want to view the list of all available branches in your repository, simply run:

```bash
git branch
```

---

## Commit All Branches

After creating branches, it's common to switch between them and commit changes. Here is how you can commit changes for each branch:

```bash
git commit -m "Create branch"
git checkout dev
git commit -m "Create branch"
git checkout alpha
git commit -m "Create branch"
git checkout prod
```

These commands ensure that you commit the necessary changes to each branch. Visualizing your branch structure can help with better understanding.

![Branches Overview](https://i.imgur.com/5SBBMkW.png)

---

## Add Two Features and Commit Them

Once you have your branches set up, it's time to create feature branches. Here's how to add and commit two new features:

```bash
# Create and switch to feature1 branch
git branch feature1
git checkout feature1
git commit -m "Feature1 is complete"

# Create and switch to feature2 branch
git branch feature2
git checkout feature2
git commit -m "Feature2 is complete"
```

These steps allow you to work on individual features independently. After the work is complete, each feature will be committed separately.

![Feature Development](https://i.imgur.com/2z3RYAq.png)

---

## Create a Release Branch to Add the Final Feature

Once all features are complete, it's time to prepare for release. To do so, create a release branch where you can finalize your changes before merging them into the master branch:

```bash
# Create and switch to the release branch
git branch release
git checkout release
git commit -m "Create release branch to add new feature to master branch"

# Merge feature2 into the release branch
git merge feature2
```

This will ensure that all changes are finalized and properly merged into the release branch for testing and final adjustments.

![Release Branch](https://i.imgur.com/5Hy6wbX.png)

---

## Final Merge to Master Branch

After everything is tested and ready, it's time to merge the release branch into the master branch for the final product:

```bash
# Switch to master branch
git checkout master

# Merge the release branch into master
git merge release
```

This final step consolidates all your changes into the master branch, marking the completion of the release cycle.

![Merge to Master](https://i.imgur.com/opwbYZp.png)

---

## Conclusion

This Git branching workflow ensures a structured and efficient approach to managing code within your team. By using separate branches for features, releases, and the master branch, you keep development organized and reduce conflicts. This process allows teams to collaborate smoothly, maintain a stable codebase, and deliver reliable updates to production.

By following these best practices, you ensure consistency and streamline the development process, from feature development to final release.
