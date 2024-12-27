# Details of Tasks

## Task 1

In this task, we need to create a login/signup page with the following requirements:

- The page should be divided into two sections:
  - The left section should take up 80% of the width.
  - The right section should take up 20% of the width.
- In the right section, there should be a card with two tab buttons at the top.
  - Clicking on these tab buttons should change the content between login and signup forms.
- Constraints:
  - No use of JavaScript, radio buttons, or any similar kind of buttons.
  - No use of any `href` tags present in the HTML.
- The implementation should be done using only CSS and HTML.

## Solution

For the solution, I used the `<details>` and `<summary>` tags available in HTML. The `<details>` tag has an `open` attribute that indicates whether the summary part is open or closed. To display the login and signup forms in full length, I used `position: absolute` on the `<summary>` tag when it is open, so that it hides the other form.

Here is the most relevant CSS used to achieve this:

```CSS
    summary {
    background-color: #1e3932;
    padding: 10px;
    cursor: pointer;
    border: 1px solid #ccc;
    border-radius: 4px 4px 0 0;
    text-align: center;
    color: white;
}

details[open] summary {
    background-color: #1e3932;
    color: white;
    border-bottom: 1px solid #fff;
}

#login-details[open],
#register-details[open] {
    width: 30vw;
    position: absolute;
}

.tab-content {
    padding: 20px;
    border: 1px solid #ccc;
    border-top: none;
    border-radius: 0 0 4px 4px;
    display: none;
}

details[open] .tab-content {
    display: block;
}
```

## What We Learn from this

1. **HTML Semantics:** Understanding how to use `<details>` and `<summary>` tags for interactive elements without JavaScript.

2. **CSS Techniques:** Learning to manipulate visibility and layout using CSS properties like position and display.

3. **Constraints Creativity:** Developing solutions under constraints like avoiding JavaScript or specific HTML tags.

4. **UI Design Basics:** Creating functional and visually appealing interfaces using pure HTML and CSS.
