package schema

import (
	"entgo.io/ent"
	"entgo.io/ent/dialect/entsql"
	entschema "entgo.io/ent/schema"
	"entgo.io/ent/schema/field"
)

// User describes a row in the users table.
type User struct {
	ent.Schema
}

func (User) Annotations() []entschema.Annotation {
	return []entschema.Annotation{entsql.Annotation{Table: "users"}}
}

func (User) Fields() []ent.Field {
	return []ent.Field{
		field.Int64("id").Unique(),
		field.String("name").MaxLen(255),
	}
}
