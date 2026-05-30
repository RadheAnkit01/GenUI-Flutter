final schemas = {
  'TextCard': textCardSchema,
  'ButtonCard': buttonCardSchema,
  'ProductCard': productCardSchema,
  'ProfileCard': profileCardSchema,
  'ImageCard': imageCardSchema,
  'Column': columnSchema,
  'Row': rowSchema,
  'Container': containerSchema,
  'McqsQuestion': mcqsQuestionSchema,
};

final productCardSchema = {
  "type": "object",
  "required": ["title", "price"],
  "properties": {
    "title": {"type": "string"},
    "price": {"type": "number"},
  },
};

final textCardSchema = {
  "type": "object",
  "properties": {
    "text": {"type": "string"},
  },
};

final columnSchema = {
  "type": "object",
  "required": ["children"],
  "properties": {
    "children": {"type": "array"},
  },
};

final rowSchema = {
  "type": "object",
  "required": ["children"],
  "properties": {
    "children": {"type": "array"},
  },
};

final containerSchema = {
  "type": "object",
  "required": ["child"],
  "properties": {
    "child": {"type": "object"},
  },
};

final imageCardSchema = {
  "type": "object",
  "required": ["url"],
  "properties": {
    "url": {"type": "string"},
    "height": {"type": "number"},
    "title": {"type": "string"},
  },
};

final profileCardSchema = {
  "type": "object",
  "required": ["name", "email", "image"],
  "properties": {
    "name": {"type": "string"},
    "email": {"type": "string"},
    "bio": {"type": "string"},
    "image": {"type": "string"},
  },
};

final buttonCardSchema = {
  "type": "object",
  "required": ["title"],
  "properties": {
    "title": {"type": "string"},
    "action": {"type": "string"},
    "backgroundColor": {"type": "string"},
    "textColor": {"type": "string"},
    "width": {"type": "number"},
    "height": {"type": "number"},
    "icon": {"type": "string"},
    "disabled": {"type": "boolean"},
  },
};

final mcqsQuestionSchema = {
  "type": "object",
  "required": [
    "question",
    "choice1",
    "choice2",
    "choice3",
    "choice4",
    "correctOption",
    "explaination",
  ],
  "properties": {
    "question": {"type": "string"},
    "choice1": {"type": "string"},
    "choice2": {"type": "string"},
    "choice3": {"type": "string"},
    "choice4": {"type": "string"},
    "correctOption": {"type": "number"},
    "explaination": {"type": "string"},
  },
};
