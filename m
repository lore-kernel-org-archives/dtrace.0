Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5D391CA80
	for <dtrace@lists.linux.dev>; Thu, 27 Jun 2024 05:39:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719466789; cv=fail; b=j36tmF4LMa2EKsQzpGbbhR0NKrf4Z7gMoQAcaLMqWX2bV81ijycb+31mqLJM9+TxTBkwy48GpiFvYgV9vRugMcHWy7m0CPwZBgeTz77GtgE+fQUJeDz/R9qIX0mo2fokilqEtFfOhrEA8CyzRd4BMssQYU3ZAehUrZFU0EixG0w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719466789; c=relaxed/simple;
	bh=gJwgkP63c1bWKY7GF5oMl3j6w3jnlQDy0P6JLBfq3QA=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Lif+y6Ys87ZipZzHBHFD5xCDw7kesY5+Vqrl2kumGBj3/RGKUeVzwJ7UDVEVTrgThIcelAm+tRf2gVEV0u2zzv6GiMprvsa8ORlB6rRTnQPLsQOFDynr73/VtHSyzbahJVUhypKko0jawkiJNW4nHrmthtwQ5mChbX9UXyxWo8g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=TZIR/1FV; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=U3MbpANu; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="TZIR/1FV";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="U3MbpANu"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45QLMTdB006662
	for <dtrace@lists.linux.dev>; Thu, 27 Jun 2024 05:39:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	from:to:subject:date:message-id:in-reply-to:references
	:content-type:mime-version; s=corp-2023-11-20; bh=1wZ3xzVf3WFDxT
	gYhmv26MWKqzFG/WvZSQpqOqTAS8M=; b=TZIR/1FV/VuWUqXcWAGGzDNpT8D3zC
	JpFgJnfbkMYAsHCUnK6whyv1/q9ymCJc/Y3ToPkElSfVJEM+xjo1O0P5XZ0cnmzo
	Uqip5TTS8nf63YLyAkY7eRmE8udG6S/ZafJ4c+lWEhjtOv+plGjWsQJwRRloPjHp
	b4nBImS5UW5QHctvof3craLQPBk+dGw7954Ftt1WZLjwVpSCCf78rii4GSItnxGz
	xtKO9A5JneS0BNWzmz5eMdmeR5Kfr0FNPYeUmYzVv/uNVzEI4tvECAvvvSl/6+mw
	66QVQpwwErL0CGpvKr0mzQQ9eUGXjHJl32nZtxMzAssTdgHSxGtV/Btw==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 400ttn8j5k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 27 Jun 2024 05:39:44 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 45R5aPXs017891
	for <dtrace@lists.linux.dev>; Thu, 27 Jun 2024 05:39:43 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2177.outbound.protection.outlook.com [104.47.58.177])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 3ywn29vb90-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 27 Jun 2024 05:39:43 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MSqdTm0Pon153pvzLg0OnKVY3BYQI6Bgmb8n4r/pH6k97IfXGTH3kPEH8Yf6CvaGLYLi4ZnrwywDsiQu3AqdthqOBcIjwk11cjPkEWpU7eLeY/MZcGRMvsvr8+DfEdhc+Lg1xMBXZVH9G6GgKN6RmXYo/TRQZQTg5aAhDA3BqVxeCu6qhZPMLSDYq4E5hLENnh1NJulgZ0rqADzvwf+rlkIkynpWb+Ms4VnMZCs0j32g2obHpxgKz5fwijUkAm5gia3wUT+xYoVMVpheJ1BOoh9zA8A50lq6yBPTSJlzOcNe/dP8x7vVJjaimXgCciHe0+LU+U6QqQXQnJNckLSqAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1wZ3xzVf3WFDxTgYhmv26MWKqzFG/WvZSQpqOqTAS8M=;
 b=g747oyFB+OvqLuHKdIVBvzFTDo91vggCoOd1BVW0S7uW+ItXiDmO3S0srmicWfj0kuE9L6cXck4CgHaLuFAzeFxrRyS0JWSkCyIS62cwbIucACcWALauVs67a0Mb6SK8ZKptgYIsI42K5V+XtTD730pVTv0Vu+N7g8AB7wEdtGpsvvoXZNJ/4WoGPMLg+ZhQH/AVY3RUx2xHz16od9+tXIKwjbFwypcdYbiyTN/d8O1+1LZVqvMPZdRl0NUm2/gGo/uKsQ4JGwrp+crUQ5uADCYQrfgddTld7+qqAFDg+xBUMfVK1N2P98uyXr9WflzJSXvURcV+7nvSA27pPhdrKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1wZ3xzVf3WFDxTgYhmv26MWKqzFG/WvZSQpqOqTAS8M=;
 b=U3MbpANupH8wrYt2uVmA88KZKcN/PGjhKapxsGPccUYSDP/RlK8CtmZa3dWIJZlvUhnH+obOGNc4ia7WHw0y3FvwWwR1bMmjll3rUPwlCkN2490Qg2E9IApa5eELC+RO9CIhDi0uD/GESWJc4V0bG9zRqFufQV3ixLxorN1njic=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by IA3PR10MB7994.namprd10.prod.outlook.com (2603:10b6:208:50b::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.35; Thu, 27 Jun
 2024 05:39:34 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%4]) with mapi id 15.20.7698.025; Thu, 27 Jun 2024
 05:39:34 +0000
From: eugene.loh@oracle.com
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH 32/38] Widen the EPID to include the PRID
Date: Thu, 27 Jun 2024 01:38:58 -0400
Message-Id: <20240627053904.21996-13-eugene.loh@oracle.com>
X-Mailer: git-send-email 2.18.4
In-Reply-To: <20240627053904.21996-1-eugene.loh@oracle.com>
References: <20240627053904.21996-1-eugene.loh@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: BYAPR11CA0062.namprd11.prod.outlook.com
 (2603:10b6:a03:80::39) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|IA3PR10MB7994:EE_
X-MS-Office365-Filtering-Correlation-Id: faf9732a-0527-48c7-1c64-08dc966b85ae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?FMf9Etji5RhMKUNAm09DROIoQXcaRwfEC8sb2YIpcP5YcYHN918v8NEZKHrJ?=
 =?us-ascii?Q?a5Qdh1xXZ/25C2ofljlPwXJ9PVEURap2lVtjHKRjYxGMLKc7PZ8DndbbGDbP?=
 =?us-ascii?Q?za/BxL6sh2pRU5kY/o7RJ9SSteK3R3fw0kk4v33SczdTMlcZAo/rf9l8y7Sb?=
 =?us-ascii?Q?uqmRyH0n/RnyqMndRdm4k1NfR2kNR7cuTTVmzEiXsqD0LLmeH/HM10WjIfDc?=
 =?us-ascii?Q?R7UzhEB03XUmtCiUyBnS6vpULCjPUqqbNkNZIetoz0OZVIlrf5xvmSa7wFf+?=
 =?us-ascii?Q?m6f4dts3ffK+Xw47xTNQ6d4yvcV6+CAJtq1IYGtJy7Z8wVdoWAv7Vt8QM4zB?=
 =?us-ascii?Q?3HRU7JZ78zsJzHxN0VFeY33u3YlG0EFC4oJGMlO6uJRlGX2RHSiqNrLeId6Y?=
 =?us-ascii?Q?wim4z4y9k8zR1/NcfnwaEpkI90y8yyHEB/QjHC9/bRUwgkw1wt2Ri+AV/fik?=
 =?us-ascii?Q?MXnrEGGNz9/8lcy30ETafvQHShWUmcQ0Q1wIbz4O3JccpexK9A0eM8FzPiFc?=
 =?us-ascii?Q?5+m2M19Mld0Ug3jlziNJg4Mh80HEjuc5QUJhA3s2YKKzRPZfZsNgiHX9Xjht?=
 =?us-ascii?Q?c8W39p4kL3eicHOU1vuZ3nKO8UuxSAPrtO1W/OHGfZ+o1t8HFQFLMfCIpnMm?=
 =?us-ascii?Q?9PntVnu+UrQ5BZ82630j3T+cQV4WQwYBNsQcJjuKG8EZhyFdsjNjlL4kGJV3?=
 =?us-ascii?Q?bwWR6RyB/Dt4E0i/DPcUZoMj1sjWPvHBKRGw1YJRKEcyNC9C3hyli0CR6CiO?=
 =?us-ascii?Q?iyj/rbQThp0w0/GRO9gQYRbVmy3PBEeihTX9a3Zm7O4v6PXb3W/531dJFOuk?=
 =?us-ascii?Q?SSVjpwHqkRO9xFpeKXuZsw8UFBaB+Lv5MvLPsp/jVa7uEeGvrk+AxYw5ooUc?=
 =?us-ascii?Q?i5QPXKqNVwJyNLRLh/zT1XrJvUrtas7u7GG4ylDRnAY0DRRR7UfD4EvfRpE0?=
 =?us-ascii?Q?InSEcKY63Eq1fn3ow9wHmx9QVESV9n0Q7q7sR6VkXPpQeG3Ms4l1IKA7TmHu?=
 =?us-ascii?Q?r3Y9uzOCGDk52TJCN9FChn1tndO3jA4T4ZmX/d5cGWp2jVsQoMJwBDPMcJOR?=
 =?us-ascii?Q?igRIBY0WxaxUt7JzVtUI48k3+hd3o9q5cUxmVGDHLx+Hl+UGw/EM3llP0bO0?=
 =?us-ascii?Q?YsMZT4Ozl4vjrPdctGg0rtbGhfXkxRmaAcgzko+Br70nXScRpBqR+nilYNZs?=
 =?us-ascii?Q?aayPgZncABAHtuYSVeXTxctqib5DvEJu7S+5xrPP4HlSsExD8p52YwRQQy6N?=
 =?us-ascii?Q?TZMiDB5iuTaUgo77AZhaM4CKM8nKOrKweOqS920VexMfGd0qVRZGmvVH4NxM?=
 =?us-ascii?Q?CM8/zJoLNr0w4xg9b/KWuNQdX5PSRoXWqcURVW+/aq+O7w=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?GiJvUk7ocCJXCEvORfArWBHla+/+mDAecmqIoy6YTRhvT+Wzy2H+PzYSS9zl?=
 =?us-ascii?Q?t6xf/5+POD122vONU+fijNtnTm1WPY9SyzA+jlW25bRDCQg8X5Vl86ghWuK4?=
 =?us-ascii?Q?1XdlZ2UtqxQAeerzO2S96KTigKqwcDNMJQ0wNohBEy2AqCigyxA/XGjIKzgd?=
 =?us-ascii?Q?YYduIv8bAxVeg+bt26Wvd9poNKkQfNfYoFsQAVDVvcDKilABAArZ09CJ3QTn?=
 =?us-ascii?Q?l5/Pz6wbUkjRlHxpryFeWLZGOgwAJ7ky5goqfHjdHguQ+XPGfgl3BORnfULG?=
 =?us-ascii?Q?EVmY9M/gS9Ffm1vsurlq/GS9y3LIPzykAcnwL7QLpjNEGzxHunC2XSATwwDE?=
 =?us-ascii?Q?GnFmncgS6OnaJ65eHFnf34VwK4ONfCFkYJuJ1lt0jltK7okGkI3QUKkuyVJd?=
 =?us-ascii?Q?CsSn/iedryIIHwRsXFlJloZZkQeI0nJL9gQrmKy3tjEFwRAZ0w1Dao+T2wlU?=
 =?us-ascii?Q?SmnvSJQmQ+P3nHeVo7Eo5EoPkBCeGpFog/MPqkP1Ui6aROEW4rmCgP0Qd2/a?=
 =?us-ascii?Q?WRed7j/ZJvN7peesvt9cV/SF/Dc7Uf+FMGGMMCKDimg7UH3m8tIK3wOeBKl8?=
 =?us-ascii?Q?CEIV7qgyjTPwtlTuzyUgmBJEnbKlBdY5s9UKTNTsVUvtM27D/T7QmolXJRgY?=
 =?us-ascii?Q?vUWwxXPIlNfETH3znzL9/rrbr2hysfe5sFXkFUxA17ohmW/FLbnTvX3ECce9?=
 =?us-ascii?Q?/M9onEBWxbJ0z4Cyhjms9xe0q9eV89M0cLBSaOOLC4lyyyTzWvMIijk/1DX1?=
 =?us-ascii?Q?oRolap8QfsbhP0FBy0BOxzMwYStdMNQEIebd2kzjtFH59jyVu7VrHVRYbyL6?=
 =?us-ascii?Q?VPNnxvK374akJ73TN27V6VjZaQyqsLx6jO9U7mQzwS15/iZW2YggOEEwPT/D?=
 =?us-ascii?Q?3U5tvq/GUvYihVTyjHzLJ4E7t9Z2bJUa3ep0LC5CIqP4sW+qqZGxo4WguOOR?=
 =?us-ascii?Q?UpYpobSKNJ0vsA2X6lcsP96yM3+KjilJPof9PKv4lejm98uKy3VtQ5PRm4ZT?=
 =?us-ascii?Q?Yw0Ze9VVdGE2xzLrVgCYiZDDGdlMhkdLHcL9VA7orSgQCJqUN+QedTeDYhnJ?=
 =?us-ascii?Q?jIiZgRUcml6v0wzHmn3k9zEuGRpO1Qeg3HBg/lYaoXCoBllor7HKmKluPu0J?=
 =?us-ascii?Q?SzCj2v7OFexBpU1oXC5X7JlzuhvarcbObh4jNgR/wHz54UZ7kDmEhjbGRXuO?=
 =?us-ascii?Q?Aa+Iv/vP59J5zu/y6v6o4mobRba7edehK7HtHagcWJ89R/f3nJFd03rpG4ec?=
 =?us-ascii?Q?BAzuweXfQy4mCAnpcpzKWHUKxYXYZ4vSwLVEs+LgmaARToGIDcGOjOgan9qW?=
 =?us-ascii?Q?tBso0zkdehmc7H1bUzpWkTFNQ032Fql3wE2M2w3wwoAII9/lIAIY95KUCRju?=
 =?us-ascii?Q?Mqbw3Pb2LYyP/4in1xjXRojrZK4r0Kr2+RdV8rNex7Pz/mas2XnpWnfTi6Yd?=
 =?us-ascii?Q?uA7jz2Yhrfg98CjdXw9JYh7S7LPMi76TGITJ4qC0oBNOX8XUlKtnV9IRpisx?=
 =?us-ascii?Q?DA1pXaVJU25ZCn7c7MlQoCNkEA2/YDj05JPupg02eyBfkXaoHrKwPTbFOKdf?=
 =?us-ascii?Q?QJmwpBGWAaPESaRCxfjBvfWk+nxjMYycpUQU5eMm?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	kKS2nuvxsciz5vJflu9UsQMWWm0290z/jpSpH3WZGqI3uD9db4sK3PiHZXqoIsWtuXWXV5PTKziENSY8HV+BfBfsYKR3GGHIOgoveXjhxuFWTcpQ0+WdDQHd+vu+gurE6jpJ3xatCH4k86uLZb0WJsQDRjZT1Vjr5839I+gNeAKm6QCITqELpE/D1jtVF3O+K4O3CLnfkwNpPjkCJ5Nmi1dKqQTG1HCMfI+YUbizDh7G7FwPqZFr8qWmncIebbn0yCtMDhNafhmEBqdnqwqi6EEWGzPe8V/Xi8pyf3Lu+NWNGEz4q9dkffB/RRdM8CA4vQX7ZaNLtRAdYFd4sv8mhkg8bdguDY0bKivUORz4TxXnqhvxdIegSnA1pHEzBYf+lCGPW6cAS/wTJ90KMBtYyQUSuT8LN+XwtKFNL4gqPdZAn+Ry6LG2eh80zWJpGJQrIYov/pxBjKAgdPl2r1nu6fKRw1UYsmXFcwl9uReEqrmTU+arpUzHmFAWuPd9cQILt+c2dG4iP7ajiOT73/fJ64GVojUBnprPSSq3QsPlNJZ3aCTZDSw51UpbQ46M8U/35N3ro1l7Rhixrs3MsT8lcPCJkZiFPWr7zChyUhhSyvk=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: faf9732a-0527-48c7-1c64-08dc966b85ae
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jun 2024 05:39:34.2912
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DQOwS6uggBg73zD3tDzLfZIlpdhnfid4bSzVlaQbe18gOfxqptv1Wfr2GJhQ7EvhXa4ZG6aHNENK+f+NfOHmoA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR10MB7994
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-27_02,2024-06-25_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 malwarescore=0 adultscore=0
 phishscore=0 bulkscore=0 mlxlogscore=999 suspectscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2406180000
 definitions=main-2406270041
X-Proofpoint-GUID: yWpIbhslT2C62L2Om71bmaAVj_feHPR9
X-Proofpoint-ORIG-GUID: yWpIbhslT2C62L2Om71bmaAVj_feHPR9

From: Eugene Loh <eugene.loh@oracle.com>

Each output record has a EPID associated with it, allowing the consumer
to get both a data description and a PRID (so it can report PRID and
probe function and name).  We want to support uprobes that trigger for
multiple PRIDs, however, basically breaking this scheme.

So, expand the EPID to 64 bits, half for the old-style EPID (based on
static information about the D programs) and half for the PRID (discovered
at run time).

The EPID seen by compile-time files like dt_cc.c or dt_map.c are still
the old-style EPIDs (even if now 64-bit) since they have no knowledge
of the run-time PRIDs.

Further, we do not need to expand:
- the mstate (since it already had the PRID anyhow)
- the output buffer (since it already had an unused 4-byte pad)

The combination of EPID and PRID is for the built-in variable epid as
well as what the consumer reads.

Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
---
 bpf/get_bvar.c                                |  6 ++-
 bpf/probe_error.c                             |  7 ++-
 include/dtrace/universal.h                    |  2 +-
 libdtrace/dt_bpf.c                            |  2 -
 libdtrace/dt_cg.c                             | 43 +++++++++++--------
 libdtrace/dt_consume.c                        | 28 ++++++++----
 libdtrace/dt_dctx.h                           | 12 ++++--
 libdtrace/dt_handle.c                         |  9 ++--
 libdtrace/dt_map.c                            |  3 ++
 libdtrace/dt_open.c                           |  2 +-
 test/demo/dtrace/error.r                      |  2 +-
 test/stress/buffering/tst.resize3-manual.r    |  2 +-
 test/stress/buffering/tst.resize3.r           |  2 +-
 test/unittest/actions/setopt/tst.badopt.r     | 14 +++---
 .../arrays/tst.declared-bounds.runtime_out.r  |  2 +-
 test/unittest/codegen/err.deref_0.r           |  2 +-
 test/unittest/codegen/err.deref_1.r           |  2 +-
 test/unittest/codegen/err.deref_i0.r          |  2 +-
 test/unittest/codegen/err.deref_i1.r          |  2 +-
 .../unittest/codegen/err.deref_string-assoc.r |  2 +-
 test/unittest/codegen/err.deref_string-gvar.r |  2 +-
 test/unittest/codegen/err.deref_string-lvar.r |  2 +-
 test/unittest/codegen/err.deref_string-tvar.r |  2 +-
 .../codegen/err.str_NULL_plus_offset-assoc.r  |  2 +-
 .../codegen/err.str_NULL_plus_offset-lvar.r   |  2 +-
 .../codegen/err.str_NULL_plus_offset-tvar.r   |  2 +-
 .../codegen/err.str_NULL_plus_offset.r        |  2 +-
 test/unittest/disasm/tst.vartab-bvar.r        |  2 +-
 .../tst.DTRACEFLT_BADADDR.null_ptr_field.r    |  2 +-
 test/unittest/error/tst.DTRACEFLT_BADADDR.r   |  4 +-
 .../error/tst.DTRACEFLT_DIVZERO.div.r         |  2 +-
 .../error/tst.DTRACEFLT_DIVZERO.mod.r         |  2 +-
 test/unittest/error/tst.DTRACEFLT_UNKNOWN.r   |  4 +-
 .../error/tst.clause_scope-begin-ended.r      |  2 +-
 test/unittest/error/tst.clause_scope-begin.r  |  2 +-
 .../error/tst.clause_scope-regular.r.p        | 12 +++++-
 test/unittest/error/tst.error.r               |  2 +-
 test/unittest/error/tst.errorend.r            |  2 +-
 .../alloca/err.alloca-bcopy-before-beyond.r   |  2 +-
 .../alloca/err.alloca-bcopy-before-bottom.r   |  2 +-
 .../alloca/err.alloca-bcopy-beyond-top.r      |  2 +-
 .../alloca/err.alloca-bcopy-crossing-bottom.r |  2 +-
 .../alloca/err.alloca-bcopy-crossing-top.r    |  2 +-
 .../alloca/err.alloca-crossing-clauses.r      |  2 +-
 .../alloca/err.alloca-load-before-bottom.r    |  2 +-
 .../funcs/alloca/err.alloca-load-beyond-top.r |  2 +-
 .../alloca/err.alloca-load-crossing-bottom.r  |  2 +-
 .../alloca/err.alloca-null-deref-lvalue.r     |  2 +-
 .../funcs/alloca/err.alloca-null-deref.r      |  2 +-
 .../err.alloca-scratch-exceeding-bcopy.r      |  2 +-
 .../alloca/err.alloca-store-before-bottom.r   |  2 +-
 .../alloca/err.alloca-store-beyond-top.r      |  2 +-
 .../alloca/err.alloca-store-crossing-bottom.r |  2 +-
 test/unittest/funcs/bcopy/err.badbcopy1.r     |  2 +-
 test/unittest/funcs/bcopy/err.badbcopy4.r     |  2 +-
 test/unittest/funcs/bcopy/err.badbcopy5.r     |  2 +-
 test/unittest/funcs/bcopy/err.badbcopy6.r     |  2 +-
 test/unittest/funcs/bcopy/err.badbcopy7.r     |  2 +-
 test/unittest/funcs/bcopy/err.badbcopy8.r     |  2 +-
 test/unittest/funcs/copyin/err.badaddr.r      |  2 +-
 test/unittest/funcs/copyin/err.null_arg1.r    |  2 +-
 test/unittest/funcs/copyinstr/err.badaddr.r   |  2 +-
 test/unittest/funcs/copyinstr/err.null_arg1.r |  2 +-
 test/unittest/funcs/copyinto/err.badaddr.r    |  2 +-
 test/unittest/funcs/copyinto/err.badsize.r    |  2 +-
 test/unittest/funcs/copyinto/err.null_arg1.r  |  2 +-
 test/unittest/funcs/err.badalloca.r.p         | 12 +++++-
 test/unittest/funcs/err.link_ntopbadaddr.r    |  2 +-
 test/unittest/funcs/err.link_ntopbadarg.r     |  2 +-
 .../inet_ntoa6/err.inet_ntoa6.arg1_null.r     |  2 +-
 .../err.inet_ntoa6.arg1_null_const.r          |  2 +-
 test/unittest/funcs/strlen/tst.null.r         |  2 +-
 test/unittest/funcs/strtok/tst.strtok_null.r  |  2 +-
 .../funcs/strtok/tst.strtok_nulldel.r         |  2 +-
 .../funcs/strtok/tst.strtok_nullstr.r         |  2 +-
 .../funcs/strtok/tst.strtok_nullstr2.r        |  2 +-
 .../funcs/substr/err.substr_null_arg1.r       |  2 +-
 test/unittest/pointers/err.AllocaOverrun.r    |  2 +-
 test/unittest/pointers/err.BadAlign.r         |  2 +-
 test/unittest/pointers/err.InvalidAddress2.r  |  2 +-
 test/unittest/pointers/err.InvalidAddress4.r  |  2 +-
 .../speculation/err.CommitWithInvalid.r       |  2 +-
 .../speculation/err.DiscardWithInvalid.r      |  2 +-
 .../speculation/tst.SpecSizeVariations.r      | 22 ----------
 .../speculation/tst.SpecSizeVariations.sh     |  2 +-
 test/unittest/speculation/tst.negcommit.r     |  2 +-
 86 files changed, 174 insertions(+), 148 deletions(-)

diff --git a/bpf/get_bvar.c b/bpf/get_bvar.c
index a0c04f3a..5673c94b 100644
--- a/bpf/get_bvar.c
+++ b/bpf/get_bvar.c
@@ -48,8 +48,10 @@ noinline uint64_t dt_get_bvar(const dt_dctx_t *dctx, uint32_t id, uint32_t idx)
 			mst->tstamp = bpf_ktime_get_ns();
 
 		return mst->tstamp;
-	case DIF_VAR_EPID:
-		return mst->epid;
+	case DIF_VAR_EPID: {
+		uint64_t val = mst->prid;
+		return (val << 32) | mst->epid;
+	}
 	case DIF_VAR_ID:
 		return mst->prid;
 	case DIF_VAR_ARG0: case DIF_VAR_ARG1: case DIF_VAR_ARG2:
diff --git a/bpf/probe_error.c b/bpf/probe_error.c
index c8ddcdfa..c8b21d7c 100644
--- a/bpf/probe_error.c
+++ b/bpf/probe_error.c
@@ -7,6 +7,8 @@
 #include <bpf/bpf_helpers.h>
 #include <dt_dctx.h>
 
+extern uint64_t ERROR_PRID;
+
 #ifndef noinline
 # define noinline	__attribute__((noinline))
 #endif
@@ -26,15 +28,18 @@ noinline void dt_probe_error(const dt_dctx_t *dctx, uint64_t pc, uint64_t fault,
 			     uint64_t illval)
 {
 	dt_mstate_t	*mst = dctx->mst;
+	int		oldprid = mst->prid;
 
 	mst->argv[0] = 0;
-	mst->argv[1] = mst->epid;
+	mst->argv[1] = (((uint64_t)mst->prid) << 32) | mst->epid;
 	mst->argv[2] = mst->clid;
 	mst->argv[3] = pc;
 	mst->argv[4] = fault;
 	mst->argv[5] = illval;
 
+	mst->prid = ((uint64_t)&ERROR_PRID);
 	dt_error(dctx);
+	mst->prid = oldprid;
 
 	mst->fault = fault;
 }
diff --git a/include/dtrace/universal.h b/include/dtrace/universal.h
index d6562489..655ea772 100644
--- a/include/dtrace/universal.h
+++ b/include/dtrace/universal.h
@@ -37,7 +37,7 @@ typedef uint16_t	dtrace_actkind_t;	/* action kind */
 
 typedef uint32_t	dtrace_aggid_t;		/* aggregation identifier */
 typedef uint32_t	dtrace_cacheid_t;	/* predicate cache identifier */
-typedef uint32_t	dtrace_epid_t;		/* enabled probe identifier */
+typedef uint64_t	dtrace_epid_t;		/* enabled probe identifier */
 typedef uint32_t	dtrace_optid_t;		/* option identifier */
 typedef uint32_t	dtrace_specid_t;	/* speculation identifier */
 
diff --git a/libdtrace/dt_bpf.c b/libdtrace/dt_bpf.c
index 71c6a446..428cb407 100644
--- a/libdtrace/dt_bpf.c
+++ b/libdtrace/dt_bpf.c
@@ -778,7 +778,6 @@ gmap_create_cpuinfo(dtrace_hdl_t *dtp)
  * The size of the memory region is the sum of:
  *	- size of the DTrace machine state, rounded up to the nearest
  *	  multiple of 8
- *	- 8 bytes padding for trace buffer alignment purposes
  *	- maximum trace buffer record size, rounded up to the nearest
  *	  multiple of 8
  *	- size of dctx->mem (see dt_dctx.h)
@@ -787,7 +786,6 @@ static int
 gmap_create_mem(dtrace_hdl_t *dtp)
 {
 	size_t	sz = roundup(sizeof(dt_mstate_t), 8) +
-		     8 +
 		     roundup(dtp->dt_maxreclen, 8) +
 		     DMEM_SIZE(dtp);
 
diff --git a/libdtrace/dt_cg.c b/libdtrace/dt_cg.c
index 2fb2d0d8..d27a8cb2 100644
--- a/libdtrace/dt_cg.c
+++ b/libdtrace/dt_cg.c
@@ -275,15 +275,9 @@ dt_cg_tramp_prologue_act(dt_pcb_t *pcb, dt_activity_t act)
 	 *	buf = rc + roundup(sizeof(dt_mstate_t), 8);
 	 *				// add %r0, roundup(
 	 *						sizeof(dt_mstate_t), 8)
-	 *	*((uint64_t *)&buf[0]) = 0;
-	 *				// stdw [%r0 + 0], 0
-	 *	buf += 8;		// add %r0, 8
-	 *				//     (%r0 = pointer to buffer space)
 	 *	dctx.buf = buf;		// stdw [%r9 + DCTX_BUF], %r0
 	 */
 	emit(dlp,  BPF_ALU64_IMM(BPF_ADD, BPF_REG_0, roundup(sizeof(dt_mstate_t), 8)));
-	emit(dlp,  BPF_STORE_IMM(BPF_DW, BPF_REG_0, 0, 0));
-	emit(dlp,  BPF_ALU64_IMM(BPF_ADD, BPF_REG_0, 8));
 	emit(dlp,  BPF_STORE(BPF_DW, BPF_REG_9, DCTX_BUF, BPF_REG_0));
 
 	/*
@@ -1094,8 +1088,6 @@ dt_cg_prologue(dt_pcb_t *pcb, dt_node_t *pred)
 	 *	dctx->mst->specsize = 0;// stdw [%r0 + DMST_SPECSIZE], 0
 	 *	dctx->mst->epid = EPID;	// stw [%r0 + DMST_EPID], EPID
 	 *	dctx->mst->clid = CLID;	// stw [%r0 + DMST_CLID], CLID
-	 *	*((uint32_t *)&buf[DBUF_EPID]) = EPID;
-	 *				// stw [%r9 + DBUF_EPID], EPID
 	 */
 	emit(dlp,  BPF_LOAD(BPF_DW, BPF_REG_0, BPF_REG_0, DCTX_MST));
 	emit(dlp,  BPF_STORE_IMM(BPF_DW, BPF_REG_0, DMST_FAULT, 0));
@@ -1103,7 +1095,13 @@ dt_cg_prologue(dt_pcb_t *pcb, dt_node_t *pred)
 	emit(dlp,  BPF_STORE_IMM(BPF_DW, BPF_REG_0, DMST_SPECSIZE, 0));
 	emite(dlp, BPF_STORE_IMM(BPF_W, BPF_REG_0, DMST_EPID, -1), epid);
 	emite(dlp, BPF_STORE_IMM(BPF_W, BPF_REG_0, DMST_CLID, -1), clid);
-	emite(dlp, BPF_STORE_IMM(BPF_W, BPF_REG_9, DBUF_EPID, -1), epid);
+
+	/*
+	 *	Zero out the leading 4 bytes of the buffer.
+	 *	*((uint32_t *)&buf[DBUF_PAD]) = 0;
+	 *				// stw [%r9 + DBUF_PAD], 0
+	 */
+	emit(dlp,  BPF_STORE_IMM(BPF_W, BPF_REG_9, DBUF_PAD, 0));
 
 	/*
 	 *	Set the speculation ID field to zero to indicate no active
@@ -1113,6 +1111,18 @@ dt_cg_prologue(dt_pcb_t *pcb, dt_node_t *pred)
 	 */
 	emit(dlp,  BPF_STORE_IMM(BPF_W, BPF_REG_9, DBUF_SPECID, 0));
 
+	/*
+	 *	*((uint64_t *)&buf[DBUF_EPID]) = (dctx->mst->prid << 32) | EPID;
+	 *				// ld %r1, [%r0 + DMST_PRID]
+	 *				// lsh %r1, 32
+	 *				// or %r1, epid
+	 *				// stdw [%r9 + DBUF_EPID], %r1
+	 */
+	emit (dlp, BPF_LOAD(BPF_W, BPF_REG_1, BPF_REG_0, DMST_PRID));
+	emit (dlp, BPF_ALU64_IMM(BPF_LSH, BPF_REG_1, 32));
+	emite(dlp, BPF_ALU64_IMM(BPF_OR, BPF_REG_1, -1), epid);
+	emit (dlp, BPF_STORE(BPF_DW, BPF_REG_9, DBUF_EPID, BPF_REG_1));
+
 	/*
 	 * If there is a predicate:
 	 *
@@ -1131,10 +1141,9 @@ dt_cg_prologue(dt_pcb_t *pcb, dt_node_t *pred)
 	TRACE_REGSET("Prologue: End  ");
 
 	/*
-	 * Account for 32-bit EPID (at offset 0) and 32-bit speculation ID (at
-	 * offset 4).
+	 * Set the offset for the beginning of trace data.
 	 */
-	pcb->pcb_bufoff += 2 * sizeof(uint32_t);
+	pcb->pcb_bufoff = DBUF_DATA;
 }
 
 /*
@@ -1169,15 +1178,15 @@ dt_cg_epilogue(dt_pcb_t *pcb)
 		/*
 		 *	rc = bpf_perf_event_output(dctx->ctx, &buffers,
 		 *				   BPF_F_CURRENT_CPU,
-		 *				   buf - 4, bufoff + 4);
+		 *				   buf + 4, bufoff - 4);
 		 *				// lddw %r1, [%fp + DT_STK_DCTX]
 		 *				// lddw %r1, [%r1 + DCTX_CTX]
 		 *				// lddw %r2, &buffers
 		 *				// lddw %r3, BPF_F_CURRENT_CPU
 		 *				// mov %r4, %r9
-		 *				// add %r4, -4
+		 *				// add %r4, 4
 		 *				// mov %r5, pcb->pcb_bufoff
-		 *				// add %r5, 4
+		 *				// add %r5, -4
 		 *				// call bpf_perf_event_output
 		 */
 		emit(dlp, BPF_LOAD(BPF_DW, BPF_REG_1, BPF_REG_FP, DT_STK_DCTX));
@@ -1185,9 +1194,9 @@ dt_cg_epilogue(dt_pcb_t *pcb)
 		dt_cg_xsetx(dlp, buffers, DT_LBL_NONE, BPF_REG_2, buffers->di_id);
 		dt_cg_xsetx(dlp, NULL, DT_LBL_NONE, BPF_REG_3, BPF_F_CURRENT_CPU);
 		emit(dlp, BPF_MOV_REG(BPF_REG_4, BPF_REG_9));
-		emit(dlp, BPF_ALU64_IMM(BPF_ADD, BPF_REG_4, -4));
+		emit(dlp, BPF_ALU64_IMM(BPF_ADD, BPF_REG_4, 4));
 		emit(dlp, BPF_MOV_IMM(BPF_REG_5, pcb->pcb_bufoff));
-		emit(dlp, BPF_ALU64_IMM(BPF_ADD, BPF_REG_5, 4));
+		emit(dlp, BPF_ALU64_IMM(BPF_ADD, BPF_REG_5, -4));
 		emit(dlp, BPF_CALL_HELPER(BPF_FUNC_perf_event_output));
 
 		/*
diff --git a/libdtrace/dt_consume.c b/libdtrace/dt_consume.c
index 7dfec72f..adbd2c7f 100644
--- a/libdtrace/dt_consume.c
+++ b/libdtrace/dt_consume.c
@@ -14,9 +14,11 @@
 #include <ctype.h>
 #include <alloca.h>
 #include <dt_impl.h>
+#include <dt_dctx.h>
 #include <dt_module.h>
 #include <dt_pcap.h>
 #include <dt_peb.h>
+#include <dt_probe.h>
 #include <dt_state.h>
 #include <dt_string.h>
 #include <libproc.h>
@@ -478,7 +480,7 @@ dt_flowindent(dtrace_hdl_t *dtp, dtrace_probedata_t *data, dtrace_epid_t last)
 	 */
 	if (flow == DTRACEFLOW_ENTRY) {
 		if (last != DTRACE_EPIDNONE && id != last &&
-		    pd->id == dtp->dt_pdesc[last]->id)
+		    pd->id == dtp->dt_probes[last >> 32]->desc->id)
 			flow = DTRACEFLOW_NONE;
 	}
 
@@ -2202,19 +2204,23 @@ dt_consume_one_probe(dtrace_hdl_t *dtp, FILE *fp, char *data, uint32_t size,
 		     int peekflags, dtrace_epid_t *last, int committing,
 		     void *arg)
 {
+	int			specid;
 	dtrace_epid_t		epid;
+	uint32_t		prid;
 	dtrace_datadesc_t	*epd;
 	dt_spec_buf_t		tmpl;
 	dt_spec_buf_t		*dtsb;
-	int			specid;
 	int			i;
 	int			rval;
 	dtrace_workstatus_t	ret;
 	int			commit_discard_seen, only_commit_discards;
 	int			data_recording = 1;
 
-	epid = ((uint32_t *)data)[0];
-	specid = ((uint32_t *)data)[1];
+	specid = *((uint32_t *)(data + DBUF_SPECID));
+	epid = *((uint64_t *)(data + DBUF_EPID));
+	prid = epid >> 32;
+	if (prid > dtp->dt_probe_id)
+		return dt_set_errno(dtp, EDT_BADEPID);
 
 	/*
 	 * Fill in the epid and address of the epid in the buffer.  We need to
@@ -2227,6 +2233,7 @@ dt_consume_one_probe(dtrace_hdl_t *dtp, FILE *fp, char *data, uint32_t size,
 					 &pdat->dtpda_pdesc);
 	if (rval != 0)
 		return dt_set_errno(dtp, EDT_BADEPID);
+	pdat->dtpda_pdesc = (dtrace_probedesc_t *)dtp->dt_probes[prid]->desc;
 
 	epd = pdat->dtpda_ddesc;
 	if (epd->dtdd_uarg != DT_ECB_DEFAULT) {
@@ -2661,9 +2668,8 @@ dt_consume_one(dtrace_hdl_t *dtp, FILE *fp, char *buf,
 		 * struct {
 		 *	struct perf_event_header	header;
 		 *	uint32_t			size;
-		 *	uint32_t			pad;
-		 *	uint32_t			epid;
 		 *	uint32_t			specid;
+		 *	dtrace_epid_t			epid;
 		 *	uint64_t			data[n];
 		 * }
 		 * and 'data' points to the 'size' member at this point.
@@ -2673,13 +2679,17 @@ dt_consume_one(dtrace_hdl_t *dtp, FILE *fp, char *buf,
 			return dt_set_errno(dtp, EDT_DSIZE);
 
 		size = *(uint32_t *)data;
-		data += sizeof(size);
 		ptr += sizeof(size) + size;
 		if (ptr != buf + hdr->size)
 			return dt_set_errno(dtp, EDT_DSIZE);
 
-		data += sizeof(uint32_t);		/* skip padding */
-		size -= sizeof(uint32_t);
+		/*
+		 * The "size" measures from specid to the end.  But our buffer
+		 * offsets are relative to &size itself, to preserve 8-byte
+		 * alignment.  So, we leave data pointing at size, and we increase
+		 * size by 4 bytes.
+		 */
+		size += 4;
 
 		return dt_consume_one_probe(dtp, fp, data, size, pdat, efunc,
 					    rfunc, flow, quiet, peekflags,
diff --git a/libdtrace/dt_dctx.h b/libdtrace/dt_dctx.h
index 1422ad24..6d38b0c2 100644
--- a/libdtrace/dt_dctx.h
+++ b/libdtrace/dt_dctx.h
@@ -82,16 +82,20 @@ typedef struct dt_dctx {
  * The dctx->buf pointer references a block of memory that contains:
  *
  *                       +----------------+
- *                  0 -> | EPID           |
+ *                  0 -> | pad            |
  *                       +----------------+
- *		    4 -> | Speculation ID |
+ *                  4 -> | Speculation ID |
  *                       +----------------+
- *                       | Trace Data     |
+ *                  8 -> | EPID           |
+ *                       +----------------+
+ *                 16 -> | Trace Data     |
  *                       |      ...       |
  *                       +----------------+
  */
-#define DBUF_EPID	0
+#define DBUF_PAD	0
 #define DBUF_SPECID	4
+#define DBUF_EPID	8
+#define DBUF_DATA	16
 
 /*
  * The dctx->mem pointer references a block of memory that contains:
diff --git a/libdtrace/dt_handle.c b/libdtrace/dt_handle.c
index 4c9b9413..b1ba5f9f 100644
--- a/libdtrace/dt_handle.c
+++ b/libdtrace/dt_handle.c
@@ -14,6 +14,7 @@
 #include <alloca.h>
 
 #include <dt_impl.h>
+#include <dt_probe.h>
 #include <dt_program.h>
 
 static const char _dt_errprog[] =
@@ -147,11 +148,11 @@ dt_handle_err(dtrace_hdl_t *dtp, dtrace_probedata_t *data)
 	 * This is an error.  We have the following items here:  EPID,
 	 * faulting action, BPF pc, fault code and faulting address.
 	 */
-	epid = (uint32_t)DT_REC(uint64_t, 0);
+	epid = DT_REC(uint64_t, 0);
 
 	if (dt_epid_lookup(dtp, epid, &errdd, &errpd) != 0)
 		return dt_set_errno(dtp, EDT_BADERROR);
-
+	errpd = (dtrace_probedesc_t *)dtp->dt_probes[epid>>32]->desc;
 	err.dteda_ddesc = errdd;
 	err.dteda_pdesc = errpd;
 	err.dteda_cpu = data->dtpda_cpu;
@@ -195,7 +196,7 @@ no_addr:
 		details[0] = 0;
 	}
 
-	snprintf(str, len, "error on enabled probe ID %u (ID %u: %s:%s:%s:%s): "
+	snprintf(str, len, "error on enabled probe ID %lu (ID %u: %s:%s:%s:%s): "
 			   "%s%s in %s%s",
 		 epid, errpd->id, errpd->prv, errpd->mod, errpd->fun,
 		 errpd->prb, dtrace_faultstr(dtp, err.dteda_fault), details,
@@ -256,7 +257,7 @@ dt_handle_liberr(dtrace_hdl_t *dtp, const dtrace_probedata_t *data,
 	str = alloca(len);
 
 	snprintf(str, len,
-		 "error on enabled probe ID %u (ID %u: %s:%s:%s:%s): %s",
+		 "error on enabled probe ID %lu (ID %u: %s:%s:%s:%s): %s",
 		 data->dtpda_epid, errpd->id, errpd->prv, errpd->mod,
 		 errpd->fun, errpd->prb, faultstr);
 
diff --git a/libdtrace/dt_map.c b/libdtrace/dt_map.c
index c685274d..fe6194a7 100644
--- a/libdtrace/dt_map.c
+++ b/libdtrace/dt_map.c
@@ -137,6 +137,9 @@ int
 dt_epid_lookup(dtrace_hdl_t *dtp, dtrace_epid_t epid, dtrace_datadesc_t **ddp,
 	       dtrace_probedesc_t **pdp)
 {
+	/* Remove the PRID portion of the EPID. */
+	epid &= 0xffffffff;
+
 	if (epid >= dtp->dt_maxprobe ||
 	    dtp->dt_ddesc[epid] == NULL || dtp->dt_pdesc[epid] == NULL)
 		return -1;
diff --git a/libdtrace/dt_open.c b/libdtrace/dt_open.c
index 5c922488..0550379f 100644
--- a/libdtrace/dt_open.c
+++ b/libdtrace/dt_open.c
@@ -169,7 +169,7 @@ static const dt_ident_t _dtrace_globals[] = {
 { "discard", DT_IDENT_ACTFUNC, 0, DT_ACT_DISCARD, DT_ATTR_STABCMN, DT_VERS_1_0,
 	&dt_idops_func, "void(int)" },
 { "epid", DT_IDENT_SCALAR, 0, DIF_VAR_EPID, DT_ATTR_STABCMN, DT_VERS_1_0,
-	&dt_idops_type, "uint_t" },
+	&dt_idops_type, "uint64_t" },
 { "errno", DT_IDENT_SCALAR, 0, DIF_VAR_ERRNO, DT_ATTR_STABCMN, DT_VERS_1_0,
 	&dt_idops_type, "int" },
 { "execname", DT_IDENT_SCALAR, 0, DIF_VAR_EXECNAME,
diff --git a/test/demo/dtrace/error.r b/test/demo/dtrace/error.r
index d3904f47..2504e793 100644
--- a/test/demo/dtrace/error.r
+++ b/test/demo/dtrace/error.r
@@ -3,4 +3,4 @@
 
 -- @@stderr --
 dtrace: script 'test/demo/dtrace/error.d' matched 2 probes
-dtrace: error on enabled probe ID 3 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
+dtrace: error on enabled probe ID 4294967299 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
diff --git a/test/stress/buffering/tst.resize3-manual.r b/test/stress/buffering/tst.resize3-manual.r
index 43b647c7..25819f15 100644
--- a/test/stress/buffering/tst.resize3-manual.r
+++ b/test/stress/buffering/tst.resize3-manual.r
@@ -1,5 +1,5 @@
                    FUNCTION:NAME
-                          :BEGIN           3
+                          :BEGIN            4294967299
                           :BEGIN 
 
 -- @@stderr --
diff --git a/test/stress/buffering/tst.resize3.r b/test/stress/buffering/tst.resize3.r
index 9c471158..5e6afe81 100644
--- a/test/stress/buffering/tst.resize3.r
+++ b/test/stress/buffering/tst.resize3.r
@@ -1,5 +1,5 @@
                    FUNCTION:NAME
-                          :BEGIN           3
+                          :BEGIN            4294967299
                           :BEGIN 
 
 -- @@stderr --
diff --git a/test/unittest/actions/setopt/tst.badopt.r b/test/unittest/actions/setopt/tst.badopt.r
index 29e39fd4..b1c6d148 100644
--- a/test/unittest/actions/setopt/tst.badopt.r
+++ b/test/unittest/actions/setopt/tst.badopt.r
@@ -1,16 +1,16 @@
 
 -- @@stderr --
-dtrace: error on enabled probe ID 2 (ID 1: dtrace:::BEGIN): couldn't set option "Nixon" to "1": Invalid option name
+dtrace: error on enabled probe ID 4294967298 (ID 1: dtrace:::BEGIN): couldn't set option "Nixon" to "1": Invalid option name
 
-dtrace: error on enabled probe ID 2 (ID 1: dtrace:::BEGIN): couldn't set option "Harding" to "1": Invalid option name
+dtrace: error on enabled probe ID 4294967298 (ID 1: dtrace:::BEGIN): couldn't set option "Harding" to "1": Invalid option name
 
-dtrace: error on enabled probe ID 2 (ID 1: dtrace:::BEGIN): couldn't set option "Hoover" to "1": Invalid option name
+dtrace: error on enabled probe ID 4294967298 (ID 1: dtrace:::BEGIN): couldn't set option "Hoover" to "1": Invalid option name
 
-dtrace: error on enabled probe ID 2 (ID 1: dtrace:::BEGIN): couldn't set option "Bush" to "1": Invalid option name
+dtrace: error on enabled probe ID 4294967298 (ID 1: dtrace:::BEGIN): couldn't set option "Bush" to "1": Invalid option name
 
-dtrace: error on enabled probe ID 2 (ID 1: dtrace:::BEGIN): couldn't set option "quiet" to "um, no": Invalid value for specified option
+dtrace: error on enabled probe ID 4294967298 (ID 1: dtrace:::BEGIN): couldn't set option "quiet" to "um, no": Invalid value for specified option
 
-dtrace: error on enabled probe ID 2 (ID 1: dtrace:::BEGIN): couldn't set option "aggrate" to "0.5hz": Invalid value for specified option
+dtrace: error on enabled probe ID 4294967298 (ID 1: dtrace:::BEGIN): couldn't set option "aggrate" to "0.5hz": Invalid value for specified option
 
-dtrace: error on enabled probe ID 2 (ID 1: dtrace:::BEGIN): couldn't set option "bufsize" to "1m": Operation illegal when tracing is active
+dtrace: error on enabled probe ID 4294967298 (ID 1: dtrace:::BEGIN): couldn't set option "bufsize" to "1m": Operation illegal when tracing is active
 
diff --git a/test/unittest/arrays/tst.declared-bounds.runtime_out.r b/test/unittest/arrays/tst.declared-bounds.runtime_out.r
index 4917528d..fa6e3b73 100644
--- a/test/unittest/arrays/tst.declared-bounds.runtime_out.r
+++ b/test/unittest/arrays/tst.declared-bounds.runtime_out.r
@@ -1,3 +1,3 @@
 expected run-time error
 -- @@stderr --
-dtrace: error on enabled probe ID 3 (ID 1: dtrace:::BEGIN): index out of bounds (8) in action #1 at BPF pc NNN
+dtrace: error on enabled probe ID 4294967299 (ID 1: dtrace:::BEGIN): index out of bounds (8) in action #1 at BPF pc NNN
diff --git a/test/unittest/codegen/err.deref_0.r b/test/unittest/codegen/err.deref_0.r
index 07c1dc52..ef71d557 100644
--- a/test/unittest/codegen/err.deref_0.r
+++ b/test/unittest/codegen/err.deref_0.r
@@ -1,3 +1,3 @@
 
 -- @@stderr --
-dtrace: error on enabled probe ID 3 (ID 1: dtrace:::BEGIN): invalid address (0) in action #1 at BPF pc NNN
+dtrace: error on enabled probe ID 4294967299 (ID 1: dtrace:::BEGIN): invalid address (0) in action #1 at BPF pc NNN
diff --git a/test/unittest/codegen/err.deref_1.r b/test/unittest/codegen/err.deref_1.r
index a2ca8ac4..11bf0b20 100644
--- a/test/unittest/codegen/err.deref_1.r
+++ b/test/unittest/codegen/err.deref_1.r
@@ -1,3 +1,3 @@
 
 -- @@stderr --
-dtrace: error on enabled probe ID 3 (ID 1: dtrace:::BEGIN): invalid address (1) in action #1 at BPF pc NNN
+dtrace: error on enabled probe ID 4294967299 (ID 1: dtrace:::BEGIN): invalid address (1) in action #1 at BPF pc NNN
diff --git a/test/unittest/codegen/err.deref_i0.r b/test/unittest/codegen/err.deref_i0.r
index 07c1dc52..ef71d557 100644
--- a/test/unittest/codegen/err.deref_i0.r
+++ b/test/unittest/codegen/err.deref_i0.r
@@ -1,3 +1,3 @@
 
 -- @@stderr --
-dtrace: error on enabled probe ID 3 (ID 1: dtrace:::BEGIN): invalid address (0) in action #1 at BPF pc NNN
+dtrace: error on enabled probe ID 4294967299 (ID 1: dtrace:::BEGIN): invalid address (0) in action #1 at BPF pc NNN
diff --git a/test/unittest/codegen/err.deref_i1.r b/test/unittest/codegen/err.deref_i1.r
index a2ca8ac4..11bf0b20 100644
--- a/test/unittest/codegen/err.deref_i1.r
+++ b/test/unittest/codegen/err.deref_i1.r
@@ -1,3 +1,3 @@
 
 -- @@stderr --
-dtrace: error on enabled probe ID 3 (ID 1: dtrace:::BEGIN): invalid address (1) in action #1 at BPF pc NNN
+dtrace: error on enabled probe ID 4294967299 (ID 1: dtrace:::BEGIN): invalid address (1) in action #1 at BPF pc NNN
diff --git a/test/unittest/codegen/err.deref_string-assoc.r b/test/unittest/codegen/err.deref_string-assoc.r
index 08277992..b047a341 100644
--- a/test/unittest/codegen/err.deref_string-assoc.r
+++ b/test/unittest/codegen/err.deref_string-assoc.r
@@ -1,3 +1,3 @@
 66
 -- @@stderr --
-dtrace: error on enabled probe ID 4 (ID 1: dtrace:::BEGIN): invalid address (1) in action #2 at BPF pc NNN
+dtrace: error on enabled probe ID 4294967300 (ID 1: dtrace:::BEGIN): invalid address (1) in action #2 at BPF pc NNN
diff --git a/test/unittest/codegen/err.deref_string-gvar.r b/test/unittest/codegen/err.deref_string-gvar.r
index 08277992..b047a341 100644
--- a/test/unittest/codegen/err.deref_string-gvar.r
+++ b/test/unittest/codegen/err.deref_string-gvar.r
@@ -1,3 +1,3 @@
 66
 -- @@stderr --
-dtrace: error on enabled probe ID 4 (ID 1: dtrace:::BEGIN): invalid address (1) in action #2 at BPF pc NNN
+dtrace: error on enabled probe ID 4294967300 (ID 1: dtrace:::BEGIN): invalid address (1) in action #2 at BPF pc NNN
diff --git a/test/unittest/codegen/err.deref_string-lvar.r b/test/unittest/codegen/err.deref_string-lvar.r
index 08277992..b047a341 100644
--- a/test/unittest/codegen/err.deref_string-lvar.r
+++ b/test/unittest/codegen/err.deref_string-lvar.r
@@ -1,3 +1,3 @@
 66
 -- @@stderr --
-dtrace: error on enabled probe ID 4 (ID 1: dtrace:::BEGIN): invalid address (1) in action #2 at BPF pc NNN
+dtrace: error on enabled probe ID 4294967300 (ID 1: dtrace:::BEGIN): invalid address (1) in action #2 at BPF pc NNN
diff --git a/test/unittest/codegen/err.deref_string-tvar.r b/test/unittest/codegen/err.deref_string-tvar.r
index 08277992..b047a341 100644
--- a/test/unittest/codegen/err.deref_string-tvar.r
+++ b/test/unittest/codegen/err.deref_string-tvar.r
@@ -1,3 +1,3 @@
 66
 -- @@stderr --
-dtrace: error on enabled probe ID 4 (ID 1: dtrace:::BEGIN): invalid address (1) in action #2 at BPF pc NNN
+dtrace: error on enabled probe ID 4294967300 (ID 1: dtrace:::BEGIN): invalid address (1) in action #2 at BPF pc NNN
diff --git a/test/unittest/codegen/err.str_NULL_plus_offset-assoc.r b/test/unittest/codegen/err.str_NULL_plus_offset-assoc.r
index 187543b6..64a3861b 100644
--- a/test/unittest/codegen/err.str_NULL_plus_offset-assoc.r
+++ b/test/unittest/codegen/err.str_NULL_plus_offset-assoc.r
@@ -1,3 +1,3 @@
 
 -- @@stderr --
-dtrace: error on enabled probe ID 3 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
+dtrace: error on enabled probe ID 4294967299 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
diff --git a/test/unittest/codegen/err.str_NULL_plus_offset-lvar.r b/test/unittest/codegen/err.str_NULL_plus_offset-lvar.r
index 187543b6..64a3861b 100644
--- a/test/unittest/codegen/err.str_NULL_plus_offset-lvar.r
+++ b/test/unittest/codegen/err.str_NULL_plus_offset-lvar.r
@@ -1,3 +1,3 @@
 
 -- @@stderr --
-dtrace: error on enabled probe ID 3 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
+dtrace: error on enabled probe ID 4294967299 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
diff --git a/test/unittest/codegen/err.str_NULL_plus_offset-tvar.r b/test/unittest/codegen/err.str_NULL_plus_offset-tvar.r
index 187543b6..64a3861b 100644
--- a/test/unittest/codegen/err.str_NULL_plus_offset-tvar.r
+++ b/test/unittest/codegen/err.str_NULL_plus_offset-tvar.r
@@ -1,3 +1,3 @@
 
 -- @@stderr --
-dtrace: error on enabled probe ID 3 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
+dtrace: error on enabled probe ID 4294967299 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
diff --git a/test/unittest/codegen/err.str_NULL_plus_offset.r b/test/unittest/codegen/err.str_NULL_plus_offset.r
index 187543b6..64a3861b 100644
--- a/test/unittest/codegen/err.str_NULL_plus_offset.r
+++ b/test/unittest/codegen/err.str_NULL_plus_offset.r
@@ -1,3 +1,3 @@
 
 -- @@stderr --
-dtrace: error on enabled probe ID 3 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
+dtrace: error on enabled probe ID 4294967299 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
diff --git a/test/unittest/disasm/tst.vartab-bvar.r b/test/unittest/disasm/tst.vartab-bvar.r
index 06d7c52b..53e5f618 100644
--- a/test/unittest/disasm/tst.vartab-bvar.r
+++ b/test/unittest/disasm/tst.vartab-bvar.r
@@ -4,7 +4,7 @@ curthread               scl glb r    D type (pointer) (size 8)
 timestamp               scl glb r    D type (integer) (size 8)
 vtimestamp              scl glb r    D type (integer) (size 8)
 ipl                     scl glb r    D type (integer) (size 4)
-epid                    scl glb r    D type (integer) (size 4)
+epid                    scl glb r    D type (integer) (size 8)
 id                      scl glb r    D type (integer) (size 4)
 arg0                    scl glb r    D type (integer) (size 8)
 arg1                    scl glb r    D type (integer) (size 8)
diff --git a/test/unittest/error/tst.DTRACEFLT_BADADDR.null_ptr_field.r b/test/unittest/error/tst.DTRACEFLT_BADADDR.null_ptr_field.r
index 187543b6..64a3861b 100644
--- a/test/unittest/error/tst.DTRACEFLT_BADADDR.null_ptr_field.r
+++ b/test/unittest/error/tst.DTRACEFLT_BADADDR.null_ptr_field.r
@@ -1,3 +1,3 @@
 
 -- @@stderr --
-dtrace: error on enabled probe ID 3 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
+dtrace: error on enabled probe ID 4294967299 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
diff --git a/test/unittest/error/tst.DTRACEFLT_BADADDR.r b/test/unittest/error/tst.DTRACEFLT_BADADDR.r
index b9f5f43c..5556955d 100644
--- a/test/unittest/error/tst.DTRACEFLT_BADADDR.r
+++ b/test/unittest/error/tst.DTRACEFLT_BADADDR.r
@@ -1,6 +1,6 @@
-The arguments are 3 1 1 0
+The arguments are 4294967299 1 1 0
 The value of arg4 should be 1
 The value of arg5 should be 0
 
 -- @@stderr --
-dtrace: error on enabled probe ID 3 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
+dtrace: error on enabled probe ID 4294967299 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
diff --git a/test/unittest/error/tst.DTRACEFLT_DIVZERO.div.r b/test/unittest/error/tst.DTRACEFLT_DIVZERO.div.r
index e6d6afa2..80cd485b 100644
--- a/test/unittest/error/tst.DTRACEFLT_DIVZERO.div.r
+++ b/test/unittest/error/tst.DTRACEFLT_DIVZERO.div.r
@@ -1,3 +1,3 @@
 
 -- @@stderr --
-dtrace: error on enabled probe ID 3 (ID 1: dtrace:::BEGIN): divide-by-zero in action #1 at BPF pc NNN
+dtrace: error on enabled probe ID 4294967299 (ID 1: dtrace:::BEGIN): divide-by-zero in action #1 at BPF pc NNN
diff --git a/test/unittest/error/tst.DTRACEFLT_DIVZERO.mod.r b/test/unittest/error/tst.DTRACEFLT_DIVZERO.mod.r
index e6d6afa2..80cd485b 100644
--- a/test/unittest/error/tst.DTRACEFLT_DIVZERO.mod.r
+++ b/test/unittest/error/tst.DTRACEFLT_DIVZERO.mod.r
@@ -1,3 +1,3 @@
 
 -- @@stderr --
-dtrace: error on enabled probe ID 3 (ID 1: dtrace:::BEGIN): divide-by-zero in action #1 at BPF pc NNN
+dtrace: error on enabled probe ID 4294967299 (ID 1: dtrace:::BEGIN): divide-by-zero in action #1 at BPF pc NNN
diff --git a/test/unittest/error/tst.DTRACEFLT_UNKNOWN.r b/test/unittest/error/tst.DTRACEFLT_UNKNOWN.r
index 1e4fdd64..31752a9e 100644
--- a/test/unittest/error/tst.DTRACEFLT_UNKNOWN.r
+++ b/test/unittest/error/tst.DTRACEFLT_UNKNOWN.r
@@ -1,5 +1,5 @@
-The arguments are 3 1 PC 1 64
+The arguments are 4294967299 1 PC 1 64
 The value of arg4 = 0
 
 -- @@stderr --
-dtrace: error on enabled probe ID 3 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
+dtrace: error on enabled probe ID 4294967299 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
diff --git a/test/unittest/error/tst.clause_scope-begin-ended.r b/test/unittest/error/tst.clause_scope-begin-ended.r
index 8d57382e..7c88b227 100644
--- a/test/unittest/error/tst.clause_scope-begin-ended.r
+++ b/test/unittest/error/tst.clause_scope-begin-ended.r
@@ -2,4 +2,4 @@ Error fired
 Clause executed
 
 -- @@stderr --
-dtrace: error on enabled probe ID 3 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
+dtrace: error on enabled probe ID 4294967299 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
diff --git a/test/unittest/error/tst.clause_scope-begin.r b/test/unittest/error/tst.clause_scope-begin.r
index 8d57382e..7c88b227 100644
--- a/test/unittest/error/tst.clause_scope-begin.r
+++ b/test/unittest/error/tst.clause_scope-begin.r
@@ -2,4 +2,4 @@ Error fired
 Clause executed
 
 -- @@stderr --
-dtrace: error on enabled probe ID 3 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
+dtrace: error on enabled probe ID 4294967299 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
diff --git a/test/unittest/error/tst.clause_scope-regular.r.p b/test/unittest/error/tst.clause_scope-regular.r.p
index 7659601b..8117b8ab 100755
--- a/test/unittest/error/tst.clause_scope-regular.r.p
+++ b/test/unittest/error/tst.clause_scope-regular.r.p
@@ -1,3 +1,11 @@
-#!/bin/sed -f
+#!/usr/bin/awk -f
+
 # This report has a variable probe ID in it.
-s/ID [0-9][0-9]*: profile/ID nnn: profile/
+/^dtrace: error on enabled probe ID / {
+    $7 = and($7, 0xffffffff);    # mask out the high 32 bits (variable prid)
+}
+
+{
+    sub("ID [0-9][0-9]*: profile", "ID nnn: profile");
+    print;
+}
diff --git a/test/unittest/error/tst.error.r b/test/unittest/error/tst.error.r
index 0d29bcc8..82c6da2d 100644
--- a/test/unittest/error/tst.error.r
+++ b/test/unittest/error/tst.error.r
@@ -1,4 +1,4 @@
 Error fired
 
 -- @@stderr --
-dtrace: error on enabled probe ID 3 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
+dtrace: error on enabled probe ID 4294967299 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
diff --git a/test/unittest/error/tst.errorend.r b/test/unittest/error/tst.errorend.r
index 73abf697..17cbee17 100644
--- a/test/unittest/error/tst.errorend.r
+++ b/test/unittest/error/tst.errorend.r
@@ -2,4 +2,4 @@ Error fired
 End fired after exit
 
 -- @@stderr --
-dtrace: error on enabled probe ID 3 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
+dtrace: error on enabled probe ID 4294967299 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
diff --git a/test/unittest/funcs/alloca/err.alloca-bcopy-before-beyond.r b/test/unittest/funcs/alloca/err.alloca-bcopy-before-beyond.r
index 187543b6..64a3861b 100644
--- a/test/unittest/funcs/alloca/err.alloca-bcopy-before-beyond.r
+++ b/test/unittest/funcs/alloca/err.alloca-bcopy-before-beyond.r
@@ -1,3 +1,3 @@
 
 -- @@stderr --
-dtrace: error on enabled probe ID 3 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
+dtrace: error on enabled probe ID 4294967299 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
diff --git a/test/unittest/funcs/alloca/err.alloca-bcopy-before-bottom.r b/test/unittest/funcs/alloca/err.alloca-bcopy-before-bottom.r
index 187543b6..64a3861b 100644
--- a/test/unittest/funcs/alloca/err.alloca-bcopy-before-bottom.r
+++ b/test/unittest/funcs/alloca/err.alloca-bcopy-before-bottom.r
@@ -1,3 +1,3 @@
 
 -- @@stderr --
-dtrace: error on enabled probe ID 3 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
+dtrace: error on enabled probe ID 4294967299 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
diff --git a/test/unittest/funcs/alloca/err.alloca-bcopy-beyond-top.r b/test/unittest/funcs/alloca/err.alloca-bcopy-beyond-top.r
index 187543b6..64a3861b 100644
--- a/test/unittest/funcs/alloca/err.alloca-bcopy-beyond-top.r
+++ b/test/unittest/funcs/alloca/err.alloca-bcopy-beyond-top.r
@@ -1,3 +1,3 @@
 
 -- @@stderr --
-dtrace: error on enabled probe ID 3 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
+dtrace: error on enabled probe ID 4294967299 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
diff --git a/test/unittest/funcs/alloca/err.alloca-bcopy-crossing-bottom.r b/test/unittest/funcs/alloca/err.alloca-bcopy-crossing-bottom.r
index 187543b6..64a3861b 100644
--- a/test/unittest/funcs/alloca/err.alloca-bcopy-crossing-bottom.r
+++ b/test/unittest/funcs/alloca/err.alloca-bcopy-crossing-bottom.r
@@ -1,3 +1,3 @@
 
 -- @@stderr --
-dtrace: error on enabled probe ID 3 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
+dtrace: error on enabled probe ID 4294967299 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
diff --git a/test/unittest/funcs/alloca/err.alloca-bcopy-crossing-top.r b/test/unittest/funcs/alloca/err.alloca-bcopy-crossing-top.r
index 4257f567..9638fa5b 100644
--- a/test/unittest/funcs/alloca/err.alloca-bcopy-crossing-top.r
+++ b/test/unittest/funcs/alloca/err.alloca-bcopy-crossing-top.r
@@ -1,3 +1,3 @@
 
 -- @@stderr --
-dtrace: error on enabled probe ID 3 (ID 1: dtrace:::BEGIN): invalid size ({ptr}) in action #1 at BPF pc NNN
+dtrace: error on enabled probe ID 4294967299 (ID 1: dtrace:::BEGIN): invalid size ({ptr}) in action #1 at BPF pc NNN
diff --git a/test/unittest/funcs/alloca/err.alloca-crossing-clauses.r b/test/unittest/funcs/alloca/err.alloca-crossing-clauses.r
index f5ff855d..35cf68b1 100644
--- a/test/unittest/funcs/alloca/err.alloca-crossing-clauses.r
+++ b/test/unittest/funcs/alloca/err.alloca-crossing-clauses.r
@@ -1,3 +1,3 @@
 
 -- @@stderr --
-dtrace: error on enabled probe ID 4 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #2 at BPF pc NNN
+dtrace: error on enabled probe ID 4294967300 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #2 at BPF pc NNN
diff --git a/test/unittest/funcs/alloca/err.alloca-load-before-bottom.r b/test/unittest/funcs/alloca/err.alloca-load-before-bottom.r
index 187543b6..64a3861b 100644
--- a/test/unittest/funcs/alloca/err.alloca-load-before-bottom.r
+++ b/test/unittest/funcs/alloca/err.alloca-load-before-bottom.r
@@ -1,3 +1,3 @@
 
 -- @@stderr --
-dtrace: error on enabled probe ID 3 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
+dtrace: error on enabled probe ID 4294967299 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
diff --git a/test/unittest/funcs/alloca/err.alloca-load-beyond-top.r b/test/unittest/funcs/alloca/err.alloca-load-beyond-top.r
index 187543b6..64a3861b 100644
--- a/test/unittest/funcs/alloca/err.alloca-load-beyond-top.r
+++ b/test/unittest/funcs/alloca/err.alloca-load-beyond-top.r
@@ -1,3 +1,3 @@
 
 -- @@stderr --
-dtrace: error on enabled probe ID 3 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
+dtrace: error on enabled probe ID 4294967299 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
diff --git a/test/unittest/funcs/alloca/err.alloca-load-crossing-bottom.r b/test/unittest/funcs/alloca/err.alloca-load-crossing-bottom.r
index 187543b6..64a3861b 100644
--- a/test/unittest/funcs/alloca/err.alloca-load-crossing-bottom.r
+++ b/test/unittest/funcs/alloca/err.alloca-load-crossing-bottom.r
@@ -1,3 +1,3 @@
 
 -- @@stderr --
-dtrace: error on enabled probe ID 3 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
+dtrace: error on enabled probe ID 4294967299 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
diff --git a/test/unittest/funcs/alloca/err.alloca-null-deref-lvalue.r b/test/unittest/funcs/alloca/err.alloca-null-deref-lvalue.r
index 187543b6..64a3861b 100644
--- a/test/unittest/funcs/alloca/err.alloca-null-deref-lvalue.r
+++ b/test/unittest/funcs/alloca/err.alloca-null-deref-lvalue.r
@@ -1,3 +1,3 @@
 
 -- @@stderr --
-dtrace: error on enabled probe ID 3 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
+dtrace: error on enabled probe ID 4294967299 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
diff --git a/test/unittest/funcs/alloca/err.alloca-null-deref.r b/test/unittest/funcs/alloca/err.alloca-null-deref.r
index 187543b6..64a3861b 100644
--- a/test/unittest/funcs/alloca/err.alloca-null-deref.r
+++ b/test/unittest/funcs/alloca/err.alloca-null-deref.r
@@ -1,3 +1,3 @@
 
 -- @@stderr --
-dtrace: error on enabled probe ID 3 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
+dtrace: error on enabled probe ID 4294967299 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
diff --git a/test/unittest/funcs/alloca/err.alloca-scratch-exceeding-bcopy.r b/test/unittest/funcs/alloca/err.alloca-scratch-exceeding-bcopy.r
index 4257f567..9638fa5b 100644
--- a/test/unittest/funcs/alloca/err.alloca-scratch-exceeding-bcopy.r
+++ b/test/unittest/funcs/alloca/err.alloca-scratch-exceeding-bcopy.r
@@ -1,3 +1,3 @@
 
 -- @@stderr --
-dtrace: error on enabled probe ID 3 (ID 1: dtrace:::BEGIN): invalid size ({ptr}) in action #1 at BPF pc NNN
+dtrace: error on enabled probe ID 4294967299 (ID 1: dtrace:::BEGIN): invalid size ({ptr}) in action #1 at BPF pc NNN
diff --git a/test/unittest/funcs/alloca/err.alloca-store-before-bottom.r b/test/unittest/funcs/alloca/err.alloca-store-before-bottom.r
index 187543b6..64a3861b 100644
--- a/test/unittest/funcs/alloca/err.alloca-store-before-bottom.r
+++ b/test/unittest/funcs/alloca/err.alloca-store-before-bottom.r
@@ -1,3 +1,3 @@
 
 -- @@stderr --
-dtrace: error on enabled probe ID 3 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
+dtrace: error on enabled probe ID 4294967299 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
diff --git a/test/unittest/funcs/alloca/err.alloca-store-beyond-top.r b/test/unittest/funcs/alloca/err.alloca-store-beyond-top.r
index 187543b6..64a3861b 100644
--- a/test/unittest/funcs/alloca/err.alloca-store-beyond-top.r
+++ b/test/unittest/funcs/alloca/err.alloca-store-beyond-top.r
@@ -1,3 +1,3 @@
 
 -- @@stderr --
-dtrace: error on enabled probe ID 3 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
+dtrace: error on enabled probe ID 4294967299 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
diff --git a/test/unittest/funcs/alloca/err.alloca-store-crossing-bottom.r b/test/unittest/funcs/alloca/err.alloca-store-crossing-bottom.r
index 187543b6..64a3861b 100644
--- a/test/unittest/funcs/alloca/err.alloca-store-crossing-bottom.r
+++ b/test/unittest/funcs/alloca/err.alloca-store-crossing-bottom.r
@@ -1,3 +1,3 @@
 
 -- @@stderr --
-dtrace: error on enabled probe ID 3 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
+dtrace: error on enabled probe ID 4294967299 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
diff --git a/test/unittest/funcs/bcopy/err.badbcopy1.r b/test/unittest/funcs/bcopy/err.badbcopy1.r
index 187543b6..64a3861b 100644
--- a/test/unittest/funcs/bcopy/err.badbcopy1.r
+++ b/test/unittest/funcs/bcopy/err.badbcopy1.r
@@ -1,3 +1,3 @@
 
 -- @@stderr --
-dtrace: error on enabled probe ID 3 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
+dtrace: error on enabled probe ID 4294967299 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
diff --git a/test/unittest/funcs/bcopy/err.badbcopy4.r b/test/unittest/funcs/bcopy/err.badbcopy4.r
index 187543b6..64a3861b 100644
--- a/test/unittest/funcs/bcopy/err.badbcopy4.r
+++ b/test/unittest/funcs/bcopy/err.badbcopy4.r
@@ -1,3 +1,3 @@
 
 -- @@stderr --
-dtrace: error on enabled probe ID 3 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
+dtrace: error on enabled probe ID 4294967299 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
diff --git a/test/unittest/funcs/bcopy/err.badbcopy5.r b/test/unittest/funcs/bcopy/err.badbcopy5.r
index 187543b6..64a3861b 100644
--- a/test/unittest/funcs/bcopy/err.badbcopy5.r
+++ b/test/unittest/funcs/bcopy/err.badbcopy5.r
@@ -1,3 +1,3 @@
 
 -- @@stderr --
-dtrace: error on enabled probe ID 3 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
+dtrace: error on enabled probe ID 4294967299 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
diff --git a/test/unittest/funcs/bcopy/err.badbcopy6.r b/test/unittest/funcs/bcopy/err.badbcopy6.r
index 4257f567..9638fa5b 100644
--- a/test/unittest/funcs/bcopy/err.badbcopy6.r
+++ b/test/unittest/funcs/bcopy/err.badbcopy6.r
@@ -1,3 +1,3 @@
 
 -- @@stderr --
-dtrace: error on enabled probe ID 3 (ID 1: dtrace:::BEGIN): invalid size ({ptr}) in action #1 at BPF pc NNN
+dtrace: error on enabled probe ID 4294967299 (ID 1: dtrace:::BEGIN): invalid size ({ptr}) in action #1 at BPF pc NNN
diff --git a/test/unittest/funcs/bcopy/err.badbcopy7.r b/test/unittest/funcs/bcopy/err.badbcopy7.r
index 4257f567..9638fa5b 100644
--- a/test/unittest/funcs/bcopy/err.badbcopy7.r
+++ b/test/unittest/funcs/bcopy/err.badbcopy7.r
@@ -1,3 +1,3 @@
 
 -- @@stderr --
-dtrace: error on enabled probe ID 3 (ID 1: dtrace:::BEGIN): invalid size ({ptr}) in action #1 at BPF pc NNN
+dtrace: error on enabled probe ID 4294967299 (ID 1: dtrace:::BEGIN): invalid size ({ptr}) in action #1 at BPF pc NNN
diff --git a/test/unittest/funcs/bcopy/err.badbcopy8.r b/test/unittest/funcs/bcopy/err.badbcopy8.r
index 4257f567..9638fa5b 100644
--- a/test/unittest/funcs/bcopy/err.badbcopy8.r
+++ b/test/unittest/funcs/bcopy/err.badbcopy8.r
@@ -1,3 +1,3 @@
 
 -- @@stderr --
-dtrace: error on enabled probe ID 3 (ID 1: dtrace:::BEGIN): invalid size ({ptr}) in action #1 at BPF pc NNN
+dtrace: error on enabled probe ID 4294967299 (ID 1: dtrace:::BEGIN): invalid size ({ptr}) in action #1 at BPF pc NNN
diff --git a/test/unittest/funcs/copyin/err.badaddr.r b/test/unittest/funcs/copyin/err.badaddr.r
index ba4a4695..dadaa45b 100644
--- a/test/unittest/funcs/copyin/err.badaddr.r
+++ b/test/unittest/funcs/copyin/err.badaddr.r
@@ -3,4 +3,4 @@
 
 -- @@stderr --
 dtrace: script 'test/unittest/funcs/copyin/err.badaddr.d' matched 2 probes
-dtrace: error on enabled probe ID 3 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
+dtrace: error on enabled probe ID 4294967299 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
diff --git a/test/unittest/funcs/copyin/err.null_arg1.r b/test/unittest/funcs/copyin/err.null_arg1.r
index a806d107..c0739a4d 100644
--- a/test/unittest/funcs/copyin/err.null_arg1.r
+++ b/test/unittest/funcs/copyin/err.null_arg1.r
@@ -3,4 +3,4 @@
 
 -- @@stderr --
 dtrace: script 'test/unittest/funcs/copyin/err.null_arg1.d' matched 2 probes
-dtrace: error on enabled probe ID 3 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
+dtrace: error on enabled probe ID 4294967299 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
diff --git a/test/unittest/funcs/copyinstr/err.badaddr.r b/test/unittest/funcs/copyinstr/err.badaddr.r
index 0f566d6e..76861803 100644
--- a/test/unittest/funcs/copyinstr/err.badaddr.r
+++ b/test/unittest/funcs/copyinstr/err.badaddr.r
@@ -3,4 +3,4 @@
 
 -- @@stderr --
 dtrace: script 'test/unittest/funcs/copyinstr/err.badaddr.d' matched 2 probes
-dtrace: error on enabled probe ID 3 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
+dtrace: error on enabled probe ID 4294967299 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
diff --git a/test/unittest/funcs/copyinstr/err.null_arg1.r b/test/unittest/funcs/copyinstr/err.null_arg1.r
index cdd7c22c..074882e0 100644
--- a/test/unittest/funcs/copyinstr/err.null_arg1.r
+++ b/test/unittest/funcs/copyinstr/err.null_arg1.r
@@ -3,4 +3,4 @@
 
 -- @@stderr --
 dtrace: script 'test/unittest/funcs/copyinstr/err.null_arg1.d' matched 2 probes
-dtrace: error on enabled probe ID 3 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
+dtrace: error on enabled probe ID 4294967299 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
diff --git a/test/unittest/funcs/copyinto/err.badaddr.r b/test/unittest/funcs/copyinto/err.badaddr.r
index 11861e1f..9c2e65c2 100644
--- a/test/unittest/funcs/copyinto/err.badaddr.r
+++ b/test/unittest/funcs/copyinto/err.badaddr.r
@@ -3,4 +3,4 @@
 
 -- @@stderr --
 dtrace: script 'test/unittest/funcs/copyinto/err.badaddr.d' matched 2 probes
-dtrace: error on enabled probe ID 3 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
+dtrace: error on enabled probe ID 4294967299 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
diff --git a/test/unittest/funcs/copyinto/err.badsize.r b/test/unittest/funcs/copyinto/err.badsize.r
index ec4b062e..7e99c307 100644
--- a/test/unittest/funcs/copyinto/err.badsize.r
+++ b/test/unittest/funcs/copyinto/err.badsize.r
@@ -3,4 +3,4 @@
 
 -- @@stderr --
 dtrace: script 'test/unittest/funcs/copyinto/err.badsize.d' matched 2 probes
-dtrace: error on enabled probe ID 3 (ID 1: dtrace:::BEGIN): invalid size ({ptr}) in action #1 at BPF pc NNN
+dtrace: error on enabled probe ID 4294967299 (ID 1: dtrace:::BEGIN): invalid size ({ptr}) in action #1 at BPF pc NNN
diff --git a/test/unittest/funcs/copyinto/err.null_arg1.r b/test/unittest/funcs/copyinto/err.null_arg1.r
index f568ee5c..7c1fa9e0 100644
--- a/test/unittest/funcs/copyinto/err.null_arg1.r
+++ b/test/unittest/funcs/copyinto/err.null_arg1.r
@@ -3,4 +3,4 @@
 
 -- @@stderr --
 dtrace: script 'test/unittest/funcs/copyinto/err.null_arg1.d' matched 2 probes
-dtrace: error on enabled probe ID 3 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
+dtrace: error on enabled probe ID 4294967299 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
diff --git a/test/unittest/funcs/err.badalloca.r.p b/test/unittest/funcs/err.badalloca.r.p
index d7a88a39..15f99035 100755
--- a/test/unittest/funcs/err.badalloca.r.p
+++ b/test/unittest/funcs/err.badalloca.r.p
@@ -1,3 +1,11 @@
-#!/bin/sed -f
+#!/usr/bin/awk -f
 
-s/(ID [0-9]*/(ID NNN/g
+# This report has a variable probe ID in it.
+/^dtrace: error on enabled probe ID / {
+    $7 = and($7, 0xffffffff);    # mask out the high 32 bits (variable prid)
+}
+
+{
+    sub("ID [0-9]*: profile", "ID NNN: profile");
+    print;
+}
diff --git a/test/unittest/funcs/err.link_ntopbadaddr.r b/test/unittest/funcs/err.link_ntopbadaddr.r
index b798b5e0..f0973529 100644
--- a/test/unittest/funcs/err.link_ntopbadaddr.r
+++ b/test/unittest/funcs/err.link_ntopbadaddr.r
@@ -1,3 +1,3 @@
 -- @@stderr --
-dtrace: error on enabled probe ID 3 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
+dtrace: error on enabled probe ID 4294967299 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
 
diff --git a/test/unittest/funcs/err.link_ntopbadarg.r b/test/unittest/funcs/err.link_ntopbadarg.r
index e386a67c..3c677e9f 100644
--- a/test/unittest/funcs/err.link_ntopbadarg.r
+++ b/test/unittest/funcs/err.link_ntopbadarg.r
@@ -1,3 +1,3 @@
 -- @@stderr --
-dtrace: error on enabled probe ID 3 (ID 1: dtrace:::BEGIN): illegal operation in action #1 at BPF pc NNN
+dtrace: error on enabled probe ID 4294967299 (ID 1: dtrace:::BEGIN): illegal operation in action #1 at BPF pc NNN
 
diff --git a/test/unittest/funcs/inet_ntoa6/err.inet_ntoa6.arg1_null.r b/test/unittest/funcs/inet_ntoa6/err.inet_ntoa6.arg1_null.r
index 187543b6..64a3861b 100644
--- a/test/unittest/funcs/inet_ntoa6/err.inet_ntoa6.arg1_null.r
+++ b/test/unittest/funcs/inet_ntoa6/err.inet_ntoa6.arg1_null.r
@@ -1,3 +1,3 @@
 
 -- @@stderr --
-dtrace: error on enabled probe ID 3 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
+dtrace: error on enabled probe ID 4294967299 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
diff --git a/test/unittest/funcs/inet_ntoa6/err.inet_ntoa6.arg1_null_const.r b/test/unittest/funcs/inet_ntoa6/err.inet_ntoa6.arg1_null_const.r
index 187543b6..64a3861b 100644
--- a/test/unittest/funcs/inet_ntoa6/err.inet_ntoa6.arg1_null_const.r
+++ b/test/unittest/funcs/inet_ntoa6/err.inet_ntoa6.arg1_null_const.r
@@ -1,3 +1,3 @@
 
 -- @@stderr --
-dtrace: error on enabled probe ID 3 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
+dtrace: error on enabled probe ID 4294967299 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
diff --git a/test/unittest/funcs/strlen/tst.null.r b/test/unittest/funcs/strlen/tst.null.r
index 187543b6..64a3861b 100644
--- a/test/unittest/funcs/strlen/tst.null.r
+++ b/test/unittest/funcs/strlen/tst.null.r
@@ -1,3 +1,3 @@
 
 -- @@stderr --
-dtrace: error on enabled probe ID 3 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
+dtrace: error on enabled probe ID 4294967299 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
diff --git a/test/unittest/funcs/strtok/tst.strtok_null.r b/test/unittest/funcs/strtok/tst.strtok_null.r
index 03226aa1..4c51c5e9 100644
--- a/test/unittest/funcs/strtok/tst.strtok_null.r
+++ b/test/unittest/funcs/strtok/tst.strtok_null.r
@@ -3,4 +3,4 @@
 
 -- @@stderr --
 dtrace: script 'test/unittest/funcs/strtok/tst.strtok_null.d' matched 2 probes
-dtrace: error on enabled probe ID 3 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
+dtrace: error on enabled probe ID 4294967299 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
diff --git a/test/unittest/funcs/strtok/tst.strtok_nulldel.r b/test/unittest/funcs/strtok/tst.strtok_nulldel.r
index 70f8e4e2..2ab9938d 100644
--- a/test/unittest/funcs/strtok/tst.strtok_nulldel.r
+++ b/test/unittest/funcs/strtok/tst.strtok_nulldel.r
@@ -3,4 +3,4 @@
 
 -- @@stderr --
 dtrace: script 'test/unittest/funcs/strtok/tst.strtok_nulldel.d' matched 2 probes
-dtrace: error on enabled probe ID 3 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
+dtrace: error on enabled probe ID 4294967299 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
diff --git a/test/unittest/funcs/strtok/tst.strtok_nullstr.r b/test/unittest/funcs/strtok/tst.strtok_nullstr.r
index a57b2469..be5ffe14 100644
--- a/test/unittest/funcs/strtok/tst.strtok_nullstr.r
+++ b/test/unittest/funcs/strtok/tst.strtok_nullstr.r
@@ -3,4 +3,4 @@
 
 -- @@stderr --
 dtrace: script 'test/unittest/funcs/strtok/tst.strtok_nullstr.d' matched 2 probes
-dtrace: error on enabled probe ID 3 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
+dtrace: error on enabled probe ID 4294967299 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
diff --git a/test/unittest/funcs/strtok/tst.strtok_nullstr2.r b/test/unittest/funcs/strtok/tst.strtok_nullstr2.r
index d7df3aca..6c6fe35a 100644
--- a/test/unittest/funcs/strtok/tst.strtok_nullstr2.r
+++ b/test/unittest/funcs/strtok/tst.strtok_nullstr2.r
@@ -4,4 +4,4 @@
 
 -- @@stderr --
 dtrace: script 'test/unittest/funcs/strtok/tst.strtok_nullstr2.d' matched 4 probes
-dtrace: error on enabled probe ID 4 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #2 at BPF pc NNN
+dtrace: error on enabled probe ID 4294967300 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #2 at BPF pc NNN
diff --git a/test/unittest/funcs/substr/err.substr_null_arg1.r b/test/unittest/funcs/substr/err.substr_null_arg1.r
index 187543b6..64a3861b 100644
--- a/test/unittest/funcs/substr/err.substr_null_arg1.r
+++ b/test/unittest/funcs/substr/err.substr_null_arg1.r
@@ -1,3 +1,3 @@
 
 -- @@stderr --
-dtrace: error on enabled probe ID 3 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
+dtrace: error on enabled probe ID 4294967299 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
diff --git a/test/unittest/pointers/err.AllocaOverrun.r b/test/unittest/pointers/err.AllocaOverrun.r
index 187543b6..64a3861b 100644
--- a/test/unittest/pointers/err.AllocaOverrun.r
+++ b/test/unittest/pointers/err.AllocaOverrun.r
@@ -1,3 +1,3 @@
 
 -- @@stderr --
-dtrace: error on enabled probe ID 3 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
+dtrace: error on enabled probe ID 4294967299 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
diff --git a/test/unittest/pointers/err.BadAlign.r b/test/unittest/pointers/err.BadAlign.r
index 187543b6..64a3861b 100644
--- a/test/unittest/pointers/err.BadAlign.r
+++ b/test/unittest/pointers/err.BadAlign.r
@@ -1,3 +1,3 @@
 
 -- @@stderr --
-dtrace: error on enabled probe ID 3 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
+dtrace: error on enabled probe ID 4294967299 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
diff --git a/test/unittest/pointers/err.InvalidAddress2.r b/test/unittest/pointers/err.InvalidAddress2.r
index 187543b6..64a3861b 100644
--- a/test/unittest/pointers/err.InvalidAddress2.r
+++ b/test/unittest/pointers/err.InvalidAddress2.r
@@ -1,3 +1,3 @@
 
 -- @@stderr --
-dtrace: error on enabled probe ID 3 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
+dtrace: error on enabled probe ID 4294967299 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
diff --git a/test/unittest/pointers/err.InvalidAddress4.r b/test/unittest/pointers/err.InvalidAddress4.r
index 187543b6..64a3861b 100644
--- a/test/unittest/pointers/err.InvalidAddress4.r
+++ b/test/unittest/pointers/err.InvalidAddress4.r
@@ -1,3 +1,3 @@
 
 -- @@stderr --
-dtrace: error on enabled probe ID 3 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
+dtrace: error on enabled probe ID 4294967299 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
diff --git a/test/unittest/speculation/err.CommitWithInvalid.r b/test/unittest/speculation/err.CommitWithInvalid.r
index fc072417..e8a71c29 100644
--- a/test/unittest/speculation/err.CommitWithInvalid.r
+++ b/test/unittest/speculation/err.CommitWithInvalid.r
@@ -1,3 +1,3 @@
 
 -- @@stderr --
-dtrace: error on enabled probe ID 4 (ID 1: dtrace:::BEGIN): illegal operation in action #2 at BPF pc NNN
+dtrace: error on enabled probe ID 4294967300 (ID 1: dtrace:::BEGIN): illegal operation in action #2 at BPF pc NNN
diff --git a/test/unittest/speculation/err.DiscardWithInvalid.r b/test/unittest/speculation/err.DiscardWithInvalid.r
index fc072417..e8a71c29 100644
--- a/test/unittest/speculation/err.DiscardWithInvalid.r
+++ b/test/unittest/speculation/err.DiscardWithInvalid.r
@@ -1,3 +1,3 @@
 
 -- @@stderr --
-dtrace: error on enabled probe ID 4 (ID 1: dtrace:::BEGIN): illegal operation in action #2 at BPF pc NNN
+dtrace: error on enabled probe ID 4294967300 (ID 1: dtrace:::BEGIN): illegal operation in action #2 at BPF pc NNN
diff --git a/test/unittest/speculation/tst.SpecSizeVariations.r b/test/unittest/speculation/tst.SpecSizeVariations.r
index 51f0596c..2748b307 100644
--- a/test/unittest/speculation/tst.SpecSizeVariations.r
+++ b/test/unittest/speculation/tst.SpecSizeVariations.r
@@ -11,26 +11,6 @@ Speculative buffer ID: 1
 123456706
 counts: 1 1
 
-Speculative buffer ID: 1
-123456700
-123456701
-123456702
-123456703
-123456704
-123456705
-123456706
-counts: 1 1
-
-Speculative buffer ID: 1
-123456700
-123456701
-123456702
-123456703
-123456704
-123456705
-123456706
-counts: 2 1
-
 Speculative buffer ID: 1
 123456700
 123456701
@@ -64,5 +44,3 @@ counts: 2 1
 dtrace: 2 speculative drops
 dtrace: 1 speculative drop
 dtrace: 1 speculative drop
-dtrace: 1 speculative drop
-dtrace: 1 speculative drop
diff --git a/test/unittest/speculation/tst.SpecSizeVariations.sh b/test/unittest/speculation/tst.SpecSizeVariations.sh
index 75e527d9..79995b59 100755
--- a/test/unittest/speculation/tst.SpecSizeVariations.sh
+++ b/test/unittest/speculation/tst.SpecSizeVariations.sh
@@ -9,7 +9,7 @@
 
 dtrace=$1
 
-for x in 63 64 79 80 143 144; do
+for x in 71 72 159 160; do
 	$dtrace $dt_flags -xspecsize=$x -qn '
 	BEGIN
 	{
diff --git a/test/unittest/speculation/tst.negcommit.r b/test/unittest/speculation/tst.negcommit.r
index 69f246a0..29a3a538 100644
--- a/test/unittest/speculation/tst.negcommit.r
+++ b/test/unittest/speculation/tst.negcommit.r
@@ -3,4 +3,4 @@
 
 -- @@stderr --
 dtrace: script 'test/unittest/speculation/tst.negcommit.d' matched 2 probes
-dtrace: error on enabled probe ID 2 (ID 1: dtrace:::BEGIN): illegal operation in action #1 at BPF pc NNN
+dtrace: error on enabled probe ID 4294967298 (ID 1: dtrace:::BEGIN): illegal operation in action #1 at BPF pc NNN
-- 
2.18.4

