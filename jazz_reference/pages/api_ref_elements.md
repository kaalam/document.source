---
title: API elements
summary: An explanation of the basic parts of an API call (common to all clients).
sidebar: mydoc_sidebar
permalink: api_ref_elements.html
---

## API elements

### String constants

String constants are part of Bebop, they are applied separated by double quote `"` with a simple C-like escape sequence mechanism. Look for the
function ExpandEscapeSequences [here](/develop_jazz02/namespacejazz__utils.html) for details. Inside a url, url encoding should be used.

## Blocks

### Block names

A block name is a sequence of case-sensitive alphanumeric characters or underscores of maximum length JAZZ_MAX_BLOCK_ID_LENGTH - 1 (actually 31)
starting with a letter.

The regex JAZZ_REGEX_VALIDATE_BLOCK_ID validates a block identifier.

### Block attributes

In some `http` cases, when attributes are relevant to the protocol, they are automatically converted to mime types and urls. In all cases,
attributes of a block can be read using the function get_block_attributes() and written with set_block_attributes(). These functions exist
in all APIs. They are implemented as standard code functions so that $std.get_block_attributes() and $std.set_block_attributes() work
everywhere. Attribute reference is [here](reference_api_block_attributes.html)

### Anchor keepers

Three special characters are used to root all blocks in Jazz.

| Character | Name | Description |
|-----------|------|-------------|
| `/` | local root | Is the root keeper of the current node (the only node if a Jazz cluster isn't defined). |
| `@` | forward | Requires forwarding to the appropriate node in the cluster. All `@` requests are transformed to `/` on some node. In reading using http, the call is actually forwarded. In assignment, `@` on both the left and right sides, performs a **map** operation, on the right side only, an **aggregate**. |
| `$` | ubiquitous | If reading, the resource is everywhere in the cluster like the cluster definition itself or the standard core. If writing, it is broadcasted to the whole cluster. |

### Block modifiers

Modifiers have the form	`?(`*expression*`)`, depending on *expression*, a modifier can be:

  * A **block constructor**. The definition of a block as a constant.
  * A **block selection**. A selection applied to a block.
  * A **predicate modifier**. Some extra condition applied to a predicate such as "only if exists", "only if new", etc.

## Function calls

Function calls have the form *name*`(`*arguments*`)`.

## Operators

| Operator | Override | Description |
|-----------|------|-------------|
| `.` | NO | Defines the right argument belonging to the keeper on the left. Is **not** used after `/`, `@` and `$`. E.g., `/fraud.indices.bl001` should be read as: `bl001` is in `indices` which is in `fraud` which is in `/` (local root). |
| `=` | NO | Assignment. |
| `+`, `-`, `*`, `/`, `^` | NO | Arithmetic operators. Defined on numbers only. The `^` has an alternative form, `:pow:` that should be used in urls. |
| `&`, `:and:` | NO | Logic `and` operator (any of the two). |
| `|`, `:or:` | NO | Logic `or` operator (any of the two). The vertical `|` version should not be used in a url. |
| `!`, `:not:` | NO | Logic `negation` operator. |
| `:xor:` | NO | Logic `xor` operator. |
| `:`*name*`:` | YES | User defined operator. In an operator, *name* can only contain lowercase letters avoiding the reserved names in this table. |


## API predicates

Predicates are the basic API functions such as create, read, update, assign and delete. They are implicit in the API function or http command
you use, for details see [API predicates](reference_api_predicates.html).

{% include links.html %}
