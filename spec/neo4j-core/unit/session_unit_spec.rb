require 'spec_helper'

describe Neo4j::Session do
  let(:session) { Neo4j::Session.new }
  let(:error) { 'not impl.' }
  it 'raises errors for methods not implemented' do
    [lambda { session.start }, lambda { session.shutdown }, lambda { session.db_type }, lambda { session.begin_tx }].each do |l|
      expect { l.call }.to raise_error error
    end

    expect { session.query }.to raise_error 'not implemented, abstract'
    expect { session._query }.to raise_error 'not implemented'
    expect { create_session(:foo) }.to raise_error

  end
end
