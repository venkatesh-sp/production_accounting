-- name: GetUserByID :one
SELECT * FROM "user"
WHERE id = $1 LIMIT 1;

-- name: ListUsers :many
SELECT * FROM "user"
ORDER BY email;

-- name: CreateUser :one
INSERT INTO "user" (
  first_name,
  last_name,
  email,
  phone,
  dob,
  username,
  password,
  profile_image,
  address,
  is_active,
  meta,
  company_id,
  created_by,
  created_at,
  modified_by,
  modified_at

) VALUES (
  $1, $2, $3, $4, $5, $6, $7, $8, $9, $10, $11, $12, $13, $14, $15, $16
)
RETURNING *;

-- name: UpdateUser :exec
UPDATE "user"
SET
  first_name = $2,
  last_name = $3,
  email = $4,
  phone = $5,
  dob = $6,
  username = $7,
  password = $8,
  profile_image = $9,
  address = $10,
  is_active = $11,
  meta = $12,
  company_id = $13,
  created_by = $14,
  created_at = $15,
  modified_by = $16,
  modified_at= $17
WHERE id = $1;


-- name: DeleteUser :exec
DELETE FROM "user"
WHERE id = $1;