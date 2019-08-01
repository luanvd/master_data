class User < ApplicationRecord
  belongs_to :m_job, class_name: M::Job.name
end
