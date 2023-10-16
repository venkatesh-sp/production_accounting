-- name: GetVendorByID :one
SELECT * FROM "vendor"
WHERE id = $1 LIMIT 1;

-- name: ListVendors :many
SELECT * FROM "vendor"
ORDER BY name;

-- name: CreateVendor :one
INSERT INTO "vendor" (
  name,
  is_active,
  meta,
  created_by,
  created_at,
  modified_by,
  modified_at
) VALUES (
  $1, $2, $3, $4, $5, $6, $7
)
RETURNING *;

-- name: UpdateVendor :exec
UPDATE "vendor"
SET
  name = $2,
  is_active = $3,
  meta = $4,
  created_by = $5,
  created_at = $6,
  modified_by = $7,
  modified_at= $8
WHERE id = $1;


-- name: DeleteVendor :exec
DELETE FROM "vendor"
WHERE id = $1;