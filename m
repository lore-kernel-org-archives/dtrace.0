Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA206269802
	for <dtrace@lists.linux.dev>; Tue, 25 Mar 2025 22:25:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742941530; cv=fail; b=HMiHEx2L4Lt5nkzhtCMKqoUZSGxl2H8L4d+0fIIMCCihZImN+DSqohx5UhCNSF0giTA5Cx8ibGXHLYjyKGhSM7yXrIqe9eBR3I+nEQF29aNRs2DD4WJNbbLhpv5GpWQfOj6WVw5ovAZIhWb2SmDsk0uLFctiOYKp1EX7hmdlctA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742941530; c=relaxed/simple;
	bh=rcVXCFjxUUeZV8UwA8y48sFPKZqjV1Rc+TDZQJbynaQ=;
	h=From:To:Subject:Date:Message-Id:Content-Type:MIME-Version; b=qOpdImO8DMGLDgiiNjfTTKV+iStglnvxwZCQ53eW266s47rbI0tm7U7UjK10IBnjYl0VS75zUGkW0RJImVhnkb0apnnWXjH1VIf0sfGnDPUVwHE+y415UixfVRkx8R2vWd2UMvukO9xRnTjIKOGMfuUHql2e9Wa263erLRgt6qw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=LepePAXC; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=NJ5GGqmZ; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="LepePAXC";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="NJ5GGqmZ"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52PLuMdo000648
	for <dtrace@lists.linux.dev>; Tue, 25 Mar 2025 22:25:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	corp-2023-11-20; bh=/1Keu4s1RLZaLjzaqAPXq3TQYOvxFFUqHQbDaUvWE+M=; b=
	LepePAXClBKOxwXMlCKdX37cI57FpbWTbyj7Ei+Pu9wfsxJ/NuyHP3HMSGLA2fMb
	zCYhWS84OTzUV2BQjakS9kZ1po8xJTOBknimJHXc5KilXc6twdBgA4YBwkZXNr2x
	m00sB+PEvSmnl5d+6lSxVgfUgzb6wfidFbmnpx54fZoUBzyShch2qrvrxFPbFIWR
	mm+7/AD90sR65lKPCjMJQHNPd2nTdIBhkeuPASDLZS5GjSbNQ7MLnqAEIWQAtMrT
	jdFIlFYpIe5zgLhjw9CRczMZ2tNDFbgxzojLAA6zGOCEJWpKc+lVJkaurFdODL6Q
	Eg5Sks0GD628uXuslqWMxQ==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 45hnd6869v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 25 Mar 2025 22:25:27 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 52PKFjSY008236
	for <dtrace@lists.linux.dev>; Tue, 25 Mar 2025 22:25:26 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2174.outbound.protection.outlook.com [104.47.57.174])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 45jj6us72a-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 25 Mar 2025 22:25:26 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=f188mfHGngh5oieCZDV1ILfaEc2HUkedapUsMoqi6l7b5CTWWCOMG3M2iascytArGGsqi91JmDE6w/T6QtpP6KtVnag70duWnti3t86j6/wq53/K4qPOcUPJPySwKc+UA8FEMBn8GVNsl04ZwMgvIOaOo2sxAnvIJ9F7BrbAHjyPZAobFvhFTcSjfygbkBEyGW0jaRfPC7FTUPo2dx6QlEhPki6wubsTlMWbijmo2pHy6PKeU2z+ryzryrjkrN+53LE0AXNeioJiV48q52HJ4Hmc60wUG1PMe7jnN+VAb14MEHWOeZUzaL1WT1GSH7aqjr4gk1qOA1j8FOoxL74zMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/1Keu4s1RLZaLjzaqAPXq3TQYOvxFFUqHQbDaUvWE+M=;
 b=S5HOdS9ER8gsvx/SjdszTr7Uxb98nPPPieLW6+XUElZs7nSM4NsVUMUTqtsyRScMuTlKUf4Qw+RMB2hD3540YJY66MTur+g3x4lmlpqAxFiOhuuf2hauC8wND+2PkZlrpvc7JQhxo1AcSsAW3Xd7yiaJ1hbYLgn0Kzajd5HCWtnjbAl1a2rQ/fEAoT2ozOR3FNL+b8asb9ChgIpNYy4GfYf0MI+WdnCWDIeMw+5QWrF8FYXm6Qy85N7+g4mz4pFujGtywcd1AYYcgBiv83lalLeaIohkwV9WI2cq5GkFILAS5zYLmcukpSqYBZ6HHe3Rr6nDHsqvZs4xsUHUC1BQwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/1Keu4s1RLZaLjzaqAPXq3TQYOvxFFUqHQbDaUvWE+M=;
 b=NJ5GGqmZAGprdaqjBbMkit6lVWlbA7p5VYtX5WfQ9AORZhKvk+VKoC0H66Gs3alb81DuVhaKghasgypzmP03A9bqMbzs9qmrSi7/07gWOiflAIdYJEAJ6uyYhd/L65MKzITKIIRCVLpMkc0qB+DmAgG6YA5U9/GwZ4X4tW24N24=
Received: from SJ0PR10MB5647.namprd10.prod.outlook.com (2603:10b6:a03:3da::17)
 by IA4PR10MB8586.namprd10.prod.outlook.com (2603:10b6:208:565::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.42; Tue, 25 Mar
 2025 22:25:23 +0000
Received: from SJ0PR10MB5647.namprd10.prod.outlook.com
 ([fe80::8db4:df1d:6afd:e4a7]) by SJ0PR10MB5647.namprd10.prod.outlook.com
 ([fe80::8db4:df1d:6afd:e4a7%3]) with mapi id 15.20.8534.040; Tue, 25 Mar 2025
 22:25:23 +0000
From: eugene.loh@oracle.com
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH 1/4] Remove orphaned dtrace_recdesc_t component dtrd_uarg
Date: Tue, 25 Mar 2025 18:25:18 -0400
Message-Id: <20250325222521.15224-1-eugene.loh@oracle.com>
X-Mailer: git-send-email 2.18.4
Content-Type: text/plain
X-ClientProxiedBy: BYAPR21CA0002.namprd21.prod.outlook.com
 (2603:10b6:a03:114::12) To SJ0PR10MB5647.namprd10.prod.outlook.com
 (2603:10b6:a03:3da::17)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR10MB5647:EE_|IA4PR10MB8586:EE_
X-MS-Office365-Filtering-Correlation-Id: 512fcb75-6c9c-47ed-188b-08dd6bebef4a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?jUqlw+VX7w6h0v5Gn97LxnHAIkHNOscZ9uGaxUEpPktZLoQiIVgNedhw3AL7?=
 =?us-ascii?Q?2NWZRn5XqKQuHJy5gPIPaiP4xR8e+ikRSMCeaiySHAkjutKhjLLkN5F82oAK?=
 =?us-ascii?Q?hxAiguvxrzWMdwQEuHc5Geu2gblV7c6hIucbdbKnEBG4UlH/BO3cKqxgazXF?=
 =?us-ascii?Q?wLouGX5hJnTpSGWK8iaDno/0XjbakNJmgAwJI3I6vBQxesIwzpq6uIfWJMwu?=
 =?us-ascii?Q?3s4P6PxKSeBBoQCJmtnW2oELIkwDTNPf640YUAP9wxKE+7NFJjJGpn+1fISG?=
 =?us-ascii?Q?nYczL9zkzL2br0Qv4MCvN4Qc5kPHjANb2DzcNxYCMoqNKEZtFunSHo2q8j8U?=
 =?us-ascii?Q?F9U/rnbr4Igg8gvpTuexPu9QZwpiJjYTQumPOo7vNUzEKb9GG7Sur2cP5mE9?=
 =?us-ascii?Q?83VF9Kc8wdbA+Z0KLWCWhhfHyduEosydimK9ZUfcI+Xu09+evlnSluT1++TV?=
 =?us-ascii?Q?hMQ/prQHyKkSiSm8Jo8PxKrpqoHQYTDkrNPcksZCnUR4CHMDyiPkY1urVNaO?=
 =?us-ascii?Q?IrE9+WVpD9O/JI2cygi29QBqxfJf0OzRXWbfVRJ0n3sOa/7LmvCsLzZ6kO9m?=
 =?us-ascii?Q?o5jL1fv5VO2ES0yfiTOUYgF+0S4uY/gEzkzGA8r543kP1rBOBfZguDMXngGv?=
 =?us-ascii?Q?/Y/oGY7zXiZRfG9fjyDmcIemf73BoLyXNsnrlWYHIojWpUSq5QnAIRmfyK5/?=
 =?us-ascii?Q?K9NV3U+CDAi8coRrCnKD9NukeQWwyTG6FEJs2CBSRyBDIIA1DRlO+E3/bkmw?=
 =?us-ascii?Q?O8tKAEzCQJsYaSCS2pO9qa3i05HYXpbIgJBk/Qdd8rjNA8mw/s9MAY/ZgPbV?=
 =?us-ascii?Q?1TqvAFcny+b2lzB8EnQdPYuWDPH9W6IhUwWzU7kUVFpnVdM3cBRZHLKpWJVT?=
 =?us-ascii?Q?aa/ONqIXdUytu16WiuYY6RsSwiJyze0C2sLKKtss60apji41k1LDB2le1jpV?=
 =?us-ascii?Q?pz15R42usyHYtmhbYhy1frgVhVXIe2ECcCgz/WNJFESC8Mb7G/Tei+/qUjrw?=
 =?us-ascii?Q?NjucrwvV0NGWbxaJLLPIhDP5aYlxMljjZQSCQi4JpSettRFzCT29G0tvMgBr?=
 =?us-ascii?Q?9MWvJTTf7xXbtEZU8UPlLJq4xxfNiXx/ofPEEgnja2IputzRdAxTQSUMe1dm?=
 =?us-ascii?Q?/SLA6fJ+T0Lfuk04myqoxl4SjTbGVfwqmvYKgf6klogQlQ0X/5rYRTkDuwwJ?=
 =?us-ascii?Q?ks9zbUg7/PgctNMEceS6sSXJlqfFjEEAlrfRjanz3RKkOdrN/Q49eOr41Nkb?=
 =?us-ascii?Q?RGDpFnuoYYC9etmnf0VZWU04PIfSiJXJjnL3r1j1MdYxMq4eN6+7fX+yScA2?=
 =?us-ascii?Q?2+Z3ZKODcuXCgW1lJtAR/+RGxs15SwZSdw8Ugh1EodMnHKdihVxPwVrYTblT?=
 =?us-ascii?Q?X52sXd70xlNBVeDISLV1DrvfXh2Y?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR10MB5647.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?hCF2MN1/nuBuFZmYNjibcvZ6ffzUHwq0+tXAjGaVi9AsC6OujjyBdw07j6Ec?=
 =?us-ascii?Q?Ov1gnCbHa7iu9+2aoXfaH5U/BnKavUrlZ60asHWXtfPt1LsbRTa0nyMVWY+C?=
 =?us-ascii?Q?/tKwiW5mN4lgy/+KE+H+gcN4c4M1nO30g45BlBmEJtBVBCBrjEH7UqXTKTsC?=
 =?us-ascii?Q?yL9uh1mv8XNS61ClvxLkAGiOmucD6XqlH6c8SrPCby0D+wwkzyoHi+d2STPx?=
 =?us-ascii?Q?+AXIJTTbfUNYpIs2QnH/EGI64MNcFX+AXtCGb1k0Im0uF2uiTTRh/WC6YfqI?=
 =?us-ascii?Q?NoUt2E4lQS4bYQKsgRCfX5KCJ0CUX1eo6R9dgw0CBAJ/u/8uN2qwmFDegAQX?=
 =?us-ascii?Q?2BWpj0hj9kijMdprbfVJOjJR75EXNsP6frnHYsVOVaSw1Lf2vn8FFY4G2Ze7?=
 =?us-ascii?Q?6BMU54k+W4YUWlpav7otV51D6NZK70SUYZP0bYxCNvki2m+4Jwe+oprVxx2t?=
 =?us-ascii?Q?Gl6n5d4jV919jwj7cvFc1X+roP4XTwuEsrN1BPbtMT/duAA0mSfox9VsZwN8?=
 =?us-ascii?Q?AJEnaxT8QKOPyQAVLnxsb8D3JJ8UkUY1A5Gt9Rb+wXl8Gc6BRVN+O59AkAMx?=
 =?us-ascii?Q?kv47ME7u31QcHk6kZ6Kr6RTxGjKiRcBh928ElwS3ky4e8us2FyCrYU3WbgT5?=
 =?us-ascii?Q?yYdjD5V937Wh9iP4z2n/wXuQ0m/zWMYlMx7EwpPM/IB0Oe7oNd2T6FI1SBML?=
 =?us-ascii?Q?Zw9t4KSuS65xjyT01tJ3oKjnTXYL6KI+kPFFgqSv/ZHEYfUQQ2Qtdn1VTjtk?=
 =?us-ascii?Q?v0JSxELAVyv73fxE8n6anaRIn9n4IUJ7vN1aTu+1j4xyzYWryPLcKybcxLqb?=
 =?us-ascii?Q?Dh8haeBIGTXnurtGYpk/d+gGY4KXypeaznmpWwTFR+w7pF0K2C+/sGb6+hEk?=
 =?us-ascii?Q?UX2RdZ1Z8qZep7ArC+MqXoChpOX24E+Ib/cCH9GGQ/5JgVahVa0bifkc8myN?=
 =?us-ascii?Q?oRgk5dj9jrTDMYgVX+dzLtKZVV50J0jyJFOJhi3RPC/MVqFt2F3NI/+skb/f?=
 =?us-ascii?Q?VWVJoTF9Y0isBAtb0aWHbUIPgRRvheHwDs75CJq7S02DnodNqVdpjSWpmBw6?=
 =?us-ascii?Q?KSfIqT1xyuU1xqvPAbptooDDt4isveQ7F+jjCy0ORkxe7G/xh/COWu1GMs43?=
 =?us-ascii?Q?nUgYE4mVcPK6IspxaCDm3AX0x2PxkO6o5v/DvHdwS7jFcPik0Gr3T6yO4FQp?=
 =?us-ascii?Q?DTfMJjBxnK3VZBWe7Vks59CEVcaUVS6897USq4yte3ek69NgYkTQ73voxNss?=
 =?us-ascii?Q?XHw0xTXa5Y6KWjD2O2P1jhV2iA/hLw1i7LgwPF3uH6qkghFFLA+UWHAt5yoI?=
 =?us-ascii?Q?blksw1yN+uYn+5CpCRZUfmjc3lX3n9KM1zevxVlicWzF0JQaefWPQPhZcwxU?=
 =?us-ascii?Q?YYiwl8HmQ1I7JjPxsRNxB+WT1ZmY+wpbys/qt4ofwFacGkjhbwT/6jRaP1sk?=
 =?us-ascii?Q?OC3um9xmW0VKDGSJM9ybPVpbEJZcEgUC0MmS9gW+GEkEjaGoQiVNy1T+616+?=
 =?us-ascii?Q?AiGL3uberpr2QSL/jGHnmPs/q0l0wV5S3gr4tEf2Q9uaveSiAdOlTKqrJCy4?=
 =?us-ascii?Q?Tk2rPGfw4JgSrfiAT+WIsdlvdhIq+3JOG9SQBwIB?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	02msv8PQL5zMru1GKC3fLafpAefvaOmvqML7GeJbUWx90eC2zW8aY57DVN/GUYS6Royd3pO1rpzN6aV8Y668YhqzQwC7RjqVC2FEslf6XvdRGyKI8BMs/QXwFYG6BAwuoF77Dkpagm7NhBYyNFJK4eRecZDEzP6TFcUuODUUjnwU3Ei+2sZTalKGXK1kGaSdbfINnxYfDnOYHbzLBvRO4ItyS1d34+daCHQgh9z4dGkxGR2x0sHMheQw+JV+k61IrGPHWFtn4ilgMQMEPw8X99X5J5hN7e5MjO2hU9cf7xEXNDYSgjKpVQBoTZ8qV529KPJN99U0mbJsBQoYyogW/GHDEruWREoNS8I1ZDKbECsEjvbuPV/J+6Ec5NhZBe71sFo306YRXOB0vDNkSJ/H5rDuAlzf0reBtHLR6QVxxIaU5NsVWTSodHVQdGMAjqbOoZR8m4jiYF5o6K4X8lyv25D16MgxPR0jA8ie730Bb5DEIOF+cLO/qqCxo27SzAAUktdmtw5pz3GxC+M3HLaRBD1kShAmJDoaNr5BfIrvCZ2bq/UuyQMH4YOqSWCGPwfhGY8ce7h3mS4Ym2zNms5omQYFvL2hyK9AwtL1aPI3mHc=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 512fcb75-6c9c-47ed-188b-08dd6bebef4a
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR10MB5647.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2025 22:25:23.5176
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HMdycEB+UeUTA0ZT7ZY/Hx5j0usoSfYICkXS4V+5seEt2NAnHxn2LWdXZRjC9krQNuvvWIiR9FX05JI+PCxh/A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR10MB8586
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-25_10,2025-03-25_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 mlxlogscore=999 adultscore=0
 phishscore=0 suspectscore=0 malwarescore=0 spamscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2502280000
 definitions=main-2503250149
X-Proofpoint-ORIG-GUID: VACNZwQ2bzz-LbaJGokOODz0KqCqlJge
X-Proofpoint-GUID: VACNZwQ2bzz-LbaJGokOODz0KqCqlJge

From: Eugene Loh <eugene.loh@oracle.com>

Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
---
 include/dtrace/metadesc.h | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/include/dtrace/metadesc.h b/include/dtrace/metadesc.h
index 8a4add255..b0f789932 100644
--- a/include/dtrace/metadesc.h
+++ b/include/dtrace/metadesc.h
@@ -2,7 +2,7 @@
  * Licensed under the Universal Permissive License v 1.0 as shown at
  * http://oss.oracle.com/licenses/upl.
  *
- * Copyright (c) 2009, 2024, Oracle and/or its affiliates. All rights reserved.
+ * Copyright (c) 2009, 2025, Oracle and/or its affiliates. All rights reserved.
  */
 
 /*
@@ -39,7 +39,6 @@ typedef struct dtrace_recdesc {
 	uint16_t dtrd_alignment;		/* required alignment */
 	void *dtrd_format;			/* format, if any */
 	uint64_t dtrd_arg;			/* action argument */
-	uint64_t dtrd_uarg;			/* user argument */
 } dtrace_recdesc_t;
 
 typedef struct dtrace_datadesc {
-- 
2.43.5

