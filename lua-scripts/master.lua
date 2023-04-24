box.cfg{
    listen = 3301,
    replication = {
        'replicator:password@tarantool1:3301', -- master URI
        'replicator:password@tarantool2:3301', -- replica 1 URI
    },
    read_only = false -- set to true for replica 1 and 2 if you want master-slave
}
box.once("schema", function()
    box.schema.user.create('replicator', {password = 'password'})
    box.schema.user.grant('replicator', 'replication') -- grant replication role
    -- box.schema.space.create("test")
    -- box.space.test:create_index("primary")
    print('box.once executed on master')
end)
