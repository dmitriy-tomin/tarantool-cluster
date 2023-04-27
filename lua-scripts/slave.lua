box.cfg{
    listen = 3301,
    replication = {
        'replicator:password@10.129.0.10:13301', -- master URI
    },
    read_only = true -- mode replica
}
box.once("schema", function()
    box.schema.user.create('replicator', {password = 'password'})
    box.schema.user.grant('replicator', 'replication') -- grant replication role
    -- box.schema.space.create("test")
    -- box.space.test:create_index("primary")
    print('box.once executed on slave')
end)
