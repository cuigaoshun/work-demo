package schema

import (
	"entgo.io/ent"
	"entgo.io/ent/dialect/entsql"
	entschema "entgo.io/ent/schema"
	"entgo.io/ent/schema/field"
)

type Work struct {
	ent.Schema
}

func (Work) Annotations() []entschema.Annotation {
	return []entschema.Annotation{entsql.Annotation{Table: "works"}}
}

func (Work) Fields() []ent.Field {
	return []ent.Field{
		field.Int64("id").Unique(),
		field.String("name").MaxLen(255),
		field.Int64("user_id"),
	}
}
