function mapActions(actions) {
  if (!actions) {
    return {
      json: null,
      url: null,
    };
  }

  return {
    json: actions.json ? JSON.stringify(actions.json) : null,
    url: actions.url || null,
  };
}

function mapField(field) {
  return {
    name: field.name,
    type: {
      built_in: field.type.built_in || null,
      custom: field.type.custom || null,
    },
  };
}

function mapSample(sample) {
  return {
    tagged_text: sample.tagged_text,
    language_override: sample.language_override || null,
    source_channel: sample.source_channel || null,
  };
}

function mapTasks(tasks) {
  return tasks.map(JSON.parse).map(function (task) {
    return {
      name: task.name,
      actions: mapActions(task.actions),
      fields: (task.fields || []).map(mapField),
      samples: (task.samples || []).map(mapSample),
    };
  });
}

mapTasks(input);
