---
name: doc-gen
description: Documentation generator - create JSDoc, docstrings, README sections, and API documentation. Use when user asks to document code, generate docs, or add comments.
allowed-tools: Read, Edit, Glob, Grep
---

# Documentation Generator Skill

Generate comprehensive documentation for code.

## Documentation Types

### 1. Inline Documentation
- JSDoc for JavaScript/TypeScript
- Docstrings for Python
- GoDoc for Go
- JavaDoc for Java

### 2. README Generation
- Project overview
- Installation instructions
- Usage examples
- API reference

### 3. API Documentation
- Endpoint descriptions
- Request/response formats
- Authentication requirements
- Error codes

## JSDoc Template

```javascript
/**
 * Brief description of the function.
 *
 * @param {Type} paramName - Description of parameter
 * @returns {Type} Description of return value
 * @throws {ErrorType} Description of when this error is thrown
 * @example
 * // Example usage
 * const result = functionName(arg);
 */
```

## Python Docstring Template

```python
def function_name(param):
    """
    Brief description of the function.

    Args:
        param (Type): Description of parameter

    Returns:
        Type: Description of return value

    Raises:
        ErrorType: Description of when this error is raised

    Example:
        >>> function_name(arg)
        result
    """
```

## Workflow

1. Analyze the code structure
2. Identify public APIs and exports
3. Generate appropriate documentation format
4. Include usage examples
5. Add inline documentation to source files

## Guidelines

- Be concise but complete
- Include types when available
- Add examples for complex functions
- Document edge cases and errors
- Use consistent formatting
