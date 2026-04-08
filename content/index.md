---
layout: layouts/base.njk
title: My Site
---

# Posts

<table>
    <colgroup>
        <col style="width: 150px">
        <col style="width: auto">
    <colgroup>
    <tr>
        <th>Date</th>
        <th>Title</th>
    </tr>

    {% for post in collections.posts %}
    <tr>
        <td class="date-field">{{ post.date | readableDate }}</td>
        <td><a href={{ post.url }} target="_blank">{{ post.data.title }}</a></td>
    </tr>
    {% endfor %}
</table>
