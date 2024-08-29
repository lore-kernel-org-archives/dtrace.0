Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89F3EDDA6
	for <dtrace@lists.linux.dev>; Thu, 29 Aug 2024 05:26:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724909175; cv=fail; b=Hj/4jWhVj9Ua1cBllv+fiGlxsuLh+ojB3GYdeGf/BUEPlxfJ9+pxpBPRMfinE4pkbwlKRx6B7KhyICapaflV8R0fx9Mlvsg7fdOGtPN11DCs8KSWXmpqSgGeTsHgu++wiDtm6xpQc/SsTF9BLJwmW9uHj+Y8D1FPb0aWhS76fcA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724909175; c=relaxed/simple;
	bh=r8DZw9Yc1rtizzmKFipbaigmzIjQ4Riu0XhZ+Mnb7WE=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Q++UPAZhTg/NN0j0qGFijznajkktjTMfS6oDu53KTO3kMxsV1yckRioiYF1RccWQ3somiIuWa2gEb5ni1Jul69UT4/E0nK48mLT9NzSBomSmJz06dUPYyM3v1h7xx63mYt7kygvzm5veIbfnA3ehEFXtCfTlATvZRO8HIcQCE20=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=MyAdyyZE; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=jKGmYxDo; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="MyAdyyZE";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="jKGmYxDo"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47T1gW3b014726
	for <dtrace@lists.linux.dev>; Thu, 29 Aug 2024 05:26:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	from:to:subject:date:message-id:in-reply-to:references
	:content-type:mime-version; s=corp-2023-11-20; bh=5eN5JjupyjoYQN
	Ccx1EeMevIcqwlkYP/grBT9z9ZFmA=; b=MyAdyyZE9vOqTDNLBZKmu6DHo8H0YZ
	s+EIWa3QI2W17x4aXngpjybHubKmm6Oi81BM1y8WhrQgHuNUerfPk7aHl8doSjAO
	NhEIMerfTuOPzzbg0rK5ZoBPIUZ5vfSe0/9pAtE4MgjrU7ZyRXJ4KTvIC5ZpKCRq
	YF0dZM+8jtXqCqhZlNAGl5ZCDU/0jqi/BKY6EmxtwnVNvZhXKLY3WyDDlzVYnA9E
	6hnlWdgYWffP2h55dM2zYpo6eH5ZLVquRvF9V+jTQ1Ji+CJLAxMp7Gz9L5D88ilj
	/D0wO5nNwKQMXiSoE2Xfjed/VV4LbM/dZlBfkh3SvfM8NrAyArcJ6KKg==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 419pus39kw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 29 Aug 2024 05:26:12 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 47T3FG44033185
	for <dtrace@lists.linux.dev>; Thu, 29 Aug 2024 05:26:11 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2048.outbound.protection.outlook.com [104.47.70.48])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 418a0w84pc-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 29 Aug 2024 05:26:11 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GFpemGKEPkEF2blh5hOWPYZ/7EfSmRN5Hfc7NlzPF/Yjwoi4tAjeDq1xlMFWw9tqfHN88uAPd1aHDsV8to6zaWW2uR1ZmzRhMAsCAloLY37tdvpVK5oMQqBJ3I0IaqM1aAvGb9veay626P7Y1i/re562OqXP3s4sj5mwW99vOjDkdZJtFI7JH5Y52hp8zygS5VuDGNBOQ0Y1jjGB2nRnoISQScHgl8LhsSWnPG20pm3PSym6/kdOKi8Y6CJRk2kAsOTSZnXUUMLOKixrRlGFyDBC/Lx0zmFSUoS4aXHzJL97+IPVFIRKfwxD31mdO3CZxHIEfuTmPpWVY5sodNPoHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5eN5JjupyjoYQNCcx1EeMevIcqwlkYP/grBT9z9ZFmA=;
 b=Xf/MCtKVno2etRYoKMnuKBf/WPIA199o2+e9R6JNBGY+rUn52Jfeq5zMTAAqJbvsy2TbDubxvFNGuDHeBC9E/GJG98+ELcrhb98OZJQbBgKeRoCWgTzUWsR3xsATK2zKzYMVfIw3EvJLyaIy5etuLeFzOW/Lbegcpkw6HVCK+n7h7XV+X6KQsKioCj3fTHrCPqYjm2QdkGlLaAFI4c061zge+1Ie3+WBdUZJN/2zSS3FSannpMLl03y3MHsQmQ1AzGUyOi5mQ4p7quBLnEEHwIy/yyqqGxKozI/ro2wNE3Q+v8pMRMnIFnQAiXpdY7xKBw4KTLUAljTPeU+pgdE6KA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5eN5JjupyjoYQNCcx1EeMevIcqwlkYP/grBT9z9ZFmA=;
 b=jKGmYxDoo5W/D2tlnZPK9J/grNduMamngPgEgYuMHvM1hcj4VnCecQNlZn3eVeA+07k/fTCvrXsx8qq1ahl/bsLorzDQJYZIZORvzHK8IlHOK11yoTdaD256y/wr8OQb8iKMeCS4+xbapWSeJ6CzghyGMVdF1XSjOhiyggmQJ8E=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by PH0PR10MB7008.namprd10.prod.outlook.com (2603:10b6:510:287::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.18; Thu, 29 Aug
 2024 05:26:09 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%3]) with mapi id 15.20.7918.017; Thu, 29 Aug 2024
 05:26:09 +0000
From: eugene.loh@oracle.com
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH 02/19] Add a hook for a provider-specific "update" function
Date: Thu, 29 Aug 2024 01:25:41 -0400
Message-Id: <20240829052558.3525-2-eugene.loh@oracle.com>
X-Mailer: git-send-email 2.18.4
In-Reply-To: <20240829052558.3525-1-eugene.loh@oracle.com>
References: <20240829052558.3525-1-eugene.loh@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: LNXP265CA0051.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:5d::15) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|PH0PR10MB7008:EE_
X-MS-Office365-Filtering-Correlation-Id: 5ad35960-d20c-4de5-3f59-08dcc7eb16c6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?3EzInBdGmOJll/B+G8MONH/44lSk8fb7EIbCAWXMb4CybcpxBqWucAFDgEjD?=
 =?us-ascii?Q?kUWiWepW1MVCSXAH+rvlf8qUMTMyy5OgJY1bxzBh9Y55VwrJrf1Hbhnu4+Sc?=
 =?us-ascii?Q?3fN89kkm4lJqdUtQdcnG+ISz/ROfeXGHy1bgefzDVDCYE9taWulSG6ya7Rdi?=
 =?us-ascii?Q?wRJqymrH7CLvPT04nyt+0aVMJKVzGD/gpqPPk7MNL8EfoR5PVg1vCsG4J0NP?=
 =?us-ascii?Q?hTQQ9ZhHoAmVN6BfATep+7r0rsm/PKzJkRFa4cJX5xL/BTPxehIDaAxtF02U?=
 =?us-ascii?Q?mq7YxfZr85uWVgIUhSk8cQqdvuZMRbQ0VZMdYqONXi/HbzoMxASMSe+jqSgg?=
 =?us-ascii?Q?R8HGdpF1wOqvbVSnXsjYHAuPxkXZXlLRs0UOQmweuAUX+rGeg3qaVFOY44R6?=
 =?us-ascii?Q?Brda7G5kYy+FFrM5wv5l/Zp5bl5Dv9TQyp9pjJLSP94qiRQMCv9liq052Oaa?=
 =?us-ascii?Q?BP1iimh4rHP0+r8hTgvIiINa9mFff2BO89Qqz8PVr4Ex/FHolokoDfAiR/hp?=
 =?us-ascii?Q?TAc65PfGkP3s+B1bvD8FeP4sSfKkeSIU+6lUxhvDaBNRbuQyuEMIk4z34n3c?=
 =?us-ascii?Q?K6uxyp8ht+lcetJziO1UV3EejMf9HDIz/JqYOdXEyJWyCNs7ISu4xZFwy409?=
 =?us-ascii?Q?maRcjPnWKREoJJioKfZl5tBzSvMrBpPQwn2eWkvJLXAgc445j7G2zKsWkEPL?=
 =?us-ascii?Q?qkFeMJc+Q2EgRlk0KQBKE582MREReKX0ewJ3DKWBPYiLtiRXygszJdF4tGvO?=
 =?us-ascii?Q?Qg2CqE8HmbwIUOIDTiIZ8MRwTkV/37BNmKlk83dZtEetCpz/vl9GugmOGam4?=
 =?us-ascii?Q?QFoKYqrDMVFAyBTPU+Q+9ndzTQcY59yl8tdnNzkW98cHj2duiimLz3OvVVSM?=
 =?us-ascii?Q?rhIHsVAEYgmzfj6cl+0gnP8GvfLFjz0fXw8eMO6Jl8fr3EUuLMxK/RW7rM1E?=
 =?us-ascii?Q?IGQpb4MhF6w8eu6ccgSMSsrd5IGEuHNLdgsVDCth3YdjBH1I1P42sgiN6FdK?=
 =?us-ascii?Q?T9AxNV0mCIqferY8sJHLLZwNZG18wbyveN0GM5Srfw4oPFX19BuHPpppa8Bi?=
 =?us-ascii?Q?y5gSOGvbydRz02Oni4uQm/BtamzKAIRUoMaGZLOtFVsDTQda1TQrryHFHHhK?=
 =?us-ascii?Q?Cnw4EyxiMaz7t2LnSphNhVK+vztKVFiQnOnQnjtwR2yOpVKZzLmNBvpLYxFS?=
 =?us-ascii?Q?DdfhXV4EUliyfI1MErgQwEAhUvWILGcz72B6aDcEI3AQi2VfovhP8ko0XvnM?=
 =?us-ascii?Q?moDqNyt2CKiZidcUMQC+GDsRs5hhWJCg3wG3pRPJfhBzhjKeP4Wx6UnVUSIM?=
 =?us-ascii?Q?trgbIJlo+NQn/SftC/pKgQ0M+Z4ww/s2vbra/AXZYBsxuw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?NEsyUqZllTCxqb5wPbel6JRHNVDJDQh6ackf7AP/bjfoUaml+DeAKZu2zvwD?=
 =?us-ascii?Q?LsOd6WVYEWw5HmaReGQE086XPUqDQuQ0uaWOmaIvyk3BpBmXvswB//oVI6ei?=
 =?us-ascii?Q?dOcP+OjvkM5PN4rqGqYVo9+0kBeT2hZprrBg0DvDUuyeJfzbuDMkHiYRCQrw?=
 =?us-ascii?Q?HiKSwMsNQXMSOD1Cdn16khRwz5k0meAwzkRmwFDSH7YhiSpyJsFzb9fDqtA2?=
 =?us-ascii?Q?7eQk6yxs++/fEkGp3UezIkmsDwlgnz3jSTS2A4FT1ZYe1Fn2EMZP+LEp7bfh?=
 =?us-ascii?Q?wPdqXxx9wTLgsGzbzc71fH58Riy6pW+5lLI0iypgvLFwZbzb5O9aVi0vrfiE?=
 =?us-ascii?Q?P9YTrQvUhRTLV1aJLAxY0zvBUaOzk8D1FBN4s1ov9f87m+T/p7XzskBHHOgY?=
 =?us-ascii?Q?+0fjabe2zMRvHXG1s1UFK3vB7xLM+Z9JR+YDhBLK+KR9VQou5Pvg7rJ9IBkF?=
 =?us-ascii?Q?UiZP8vBfS/hJb/qqRRB63PqhXGvXvxH3TRMuIm//AFqNI4y5UEqayTSJUeMd?=
 =?us-ascii?Q?eiN3PEEUz7rFHTCA/KK1FYl1Pc+Jn4Oyq4FxYRmgP8lUnw/Ku2coKzejs0r8?=
 =?us-ascii?Q?zgzMngvVpeNd0OAAaCtUufIxN++sGHzffHVq7gBfCN0oQjEBjPa8oNkhf+8M?=
 =?us-ascii?Q?pBqELzNgHpFOTqPP+WAwoOLqyQtJQttElP/uyJSboElb5skWQLpMJNpFFja0?=
 =?us-ascii?Q?cQRibnQ4dgPVVv943knERBuZXSnbFwemq2P/9ELVT3Cp0XMcKQbYIbV8RCv5?=
 =?us-ascii?Q?nsegbtGDicJLUHesOTheK25+/odrqDxWkbCXHjNVjeOXCGzVcFVgGKsunCA+?=
 =?us-ascii?Q?ULyyTPxekIPcJoAwwed3hLaG+te49mZzgnMQ1RAl/QtxgyLQaBoj4ML/3Iun?=
 =?us-ascii?Q?CLD0fialCFzkEwboYtA2p9ljxIDOEHiRQ783bbl4Bu9VnQwJdrho5zvH20t4?=
 =?us-ascii?Q?E+ZUuAtxul+uEc3zovYArV59fWT6uBTiGOM8F+vPbZwIwi1UdcOShlsVXGpk?=
 =?us-ascii?Q?D28C1divRyDfF1lzTKO9o8um6Sxk8Exr2ByGdxl9x7yLmG4fVxJ5sDYWu1Sx?=
 =?us-ascii?Q?1xuiEdiFCxvWkKvtrIife4+Cj08NeOH3lmwT8OwwbZkNlJ9czLuLtj33jcIY?=
 =?us-ascii?Q?GYDJplzddgMdUf/Afj5nHsDtbytMBV/FfBpKZUR6gMVgO9zzwCaZ+AfUnbYO?=
 =?us-ascii?Q?oE1lrDWLNGAVT2AQUyfTE+OuymCFRKbSPcVdFEKUkZ3dQDEwp3aJ4w5DgB6Z?=
 =?us-ascii?Q?KoqKf93c3CcCBKKm/F5QNXCfCNfWySveRKYSXZlA585lQ/0YVUR7q/kFf+yH?=
 =?us-ascii?Q?bzH9CHDOu8GjwoBV3g+bIfuf29u+tfo4LHr7WcFJ+jcl/N9Gb9YQodQh9S1z?=
 =?us-ascii?Q?8bM6ZvSlscFUQRJqOQFShN/UJhffKg/MkwTbI8iIOOBi1vldh92mOdROtHL/?=
 =?us-ascii?Q?lbaBNh99PfGNYGna3x/RwwFEcPTnXWYHjwuYZcfedxU11vBBnrWEODMOncny?=
 =?us-ascii?Q?wGuz3OY+WNWNuxy4xu5ceVK/mNIEKsuyPtl7EIlZ04XdKpWoa4Z0Uc4uj+1Q?=
 =?us-ascii?Q?iAdvsfE8C1O6nnekaHRteqb2yErwD7zFb2CDsaP0?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	EDrijvij24yYRDj+fr0Qxk8w45SumsBdTYxMLcJ4ArbPoOooDR9ryihG3JrECS6NNz71b3eTVRjmgyVmmBdhsG915OpX3quqkchCEs0EF6jd/Yw3/yBMwyULyf4Dqd08ktMV9MWBIcemSnXV7mIz5tCwjsHiiSMCw21+6eLUIHepgNitA/1xYIVG2XwePMmTWAgs8lV9hJ78H1TVTlv9N9I3UwqEyElUIg662okn9x8Kr3nKr2zwe/EEEIBh95eMMHkZBCyci2NbAsNKY3NCh2a41kpcQPtts3ONOhHQ6vbqYscsrzT/u6/7pk5Q5WIWv0a+4SOyXpjZaORagSu/qCQQyRILVh1wHQaq2DOxhS14Tc0qEbtyUpskOL9a25+SRnx7GGz9E8Lcb4GjAkRsxUpCy2qRpUSvCQGsc31i7QAzXoZTeFXGIYvUwYkNS5Jw3Aj4SXhCYgOj60qMbLk/vlJd/QOqW0+1xPik/MF6v12PChdyKxypeiYE00a8lWqEDWPVpH1PlA3JCvyw4u0HYyPdp8Ro43He8EwHWKR3y1AAEMQ4sqDaV5u0EcFpGKu9RONKWkAsHHCW9qSQEahNSkpjk7LX6eF2zKzCt4z/cRk=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ad35960-d20c-4de5-3f59-08dcc7eb16c6
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2024 05:26:09.5703
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MG4+c4sWKKdvo3T8Pq/aFyysKIOgWHZNWr7wWN3VLlD06NV/quo+c5kdUQyf7OxAGSCYGo5xAeWZBYQmesjprg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB7008
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-29_02,2024-08-29_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 mlxlogscore=999 mlxscore=0
 suspectscore=0 malwarescore=0 spamscore=0 adultscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2407110000
 definitions=main-2408290037
X-Proofpoint-GUID: 74Z4EvHLGBw7yJ28L_kBXydUf_K9jjGU
X-Proofpoint-ORIG-GUID: 74Z4EvHLGBw7yJ28L_kBXydUf_K9jjGU

From: Eugene Loh <eugene.loh@oracle.com>

For up-coming USDT-probe support, we need to update a BPF map
-- at least when the dtrace session starts but possibly also later
to support systemwide USDT tracing for processes that may start up
later.

One way to do this is with a USDT-specific update function.

For now, let's add a hook for providers to have provider-specific
update functions.  User space can either call

    for (i = 0; i < ARRAY_SIZE(dt_providers); i++) {
        if (dt_providers[i]->update)
            dt_providers[i]->update(...);
    }

any time it likes.  Or it can call dt_usdt.update(...).

This is for WIP.  A different approach can be adopted later instead.

Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
---
 libdtrace/dt_provider.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/libdtrace/dt_provider.h b/libdtrace/dt_provider.h
index 17b1844c..21ff15ad 100644
--- a/libdtrace/dt_provider.h
+++ b/libdtrace/dt_provider.h
@@ -68,6 +68,8 @@ typedef struct dt_provimpl {
 			      void *datap);
 	void (*destroy)(dtrace_hdl_t *dtp,	/* free provider data */
 			      void *datap);
+	void (*update)(dtrace_hdl_t *dtp,	/* update provider-specific info */
+			      void *datap);
 } dt_provimpl_t;
 
 /* list dt_dtrace first */
-- 
2.43.5

