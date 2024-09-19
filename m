Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54EA381E
	for <dtrace@lists.linux.dev>; Thu, 19 Sep 2024 00:30:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726705851; cv=fail; b=ipTF04Y4KIzUhNmiMIYEHo2JcreYSIKh334lJz/fp/cGNlDg3gdjWtW7PLkAqmHkFnm0PFBvx3011yH0CWjNjslPlsKruE9FRFjVBK7Nof8KW08OcW6qx2WNKufMV5Tv+s9v5tfmY6dTAFlMlQXX2CXAgOB0TfK3F6RfOOnFnp4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726705851; c=relaxed/simple;
	bh=Va1a41/DHz/6sCx0QyPAjyGVdocwxarpD3tDmBw3334=;
	h=From:To:Subject:Date:Message-Id:Content-Type:MIME-Version; b=UZS9SQ9j8PIcYlbwqq0K3kobwN3qimMf8qnR82PzdrIfrI4yqCWIZV+DEd0Ekispu/YQPQxOKiJHjjJSTYRoW9IdeAmk0Uz2PUJMRJamg5+lZlAclkwGAN4C8Z5kbig4wkcFBooTlQF3ILYbCSrPhjg8/UE4BShjifMhJ5osXMY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=hp45BwUY; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=USGObAeO; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="hp45BwUY";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="USGObAeO"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48IJmQOx007122
	for <dtrace@lists.linux.dev>; Thu, 19 Sep 2024 00:30:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	from:to:subject:date:message-id:content-type:mime-version; s=
	corp-2023-11-20; bh=JeS1arC/9WdYjR3qxew20dKNqPvRb89zLfujRsAZxzo=; b=
	hp45BwUYt+Ao90PRtCEfsYOZJRxrDFhS1NW5akcAiw2njmCFhWuZ0lEklgleM4b1
	UVYWVovgFrHKgpBAr28uVzK0pIHwsqOBVhUZnxYNhWLbeXpDgfHKPZmgJ8MyueF6
	cJ/BaI21EFJU4RpxIPv9YzNZR1lMCCT4YkViYA8miJ0y7ti1QULMbhGn0NvhL46Q
	v2baObG+N77oAFIkljJ1yRXjcvgEgKbFwVLGFuexOrZxpXW/V/TBDOpuKd93VqTQ
	IvSQ+wwkgzMa9boQFF4qLzcm7T0wTqmllIBsxMrDOIpwCsnyTsCvMBau4AedjIM+
	Lug/tAwgW1NngDrreH5qGQ==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 41n3nsjsfd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 19 Sep 2024 00:30:48 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 48IMu6NR034104
	for <dtrace@lists.linux.dev>; Thu, 19 Sep 2024 00:30:47 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2172.outbound.protection.outlook.com [104.47.55.172])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 41nyck2esa-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 19 Sep 2024 00:30:47 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fiiHvK2gPOo2d0YRQFcflWauBdVcJPGytBPKUy36EcB9YACiERo4SX+N8kYT9x7Ohm6wVf5kdH7FiZJFg6vuhy0fNdteNpiVanxoTjBFhU+H7Vqnu+9KUTL58eQQrqIosFEK09ZuZORegARDFZj8phD1S9ve2+ADyI1XKVurQ32hc3dQzm7PEAM2zaBqwDnCGPaNr9a0MdGTVr51d5r9vPtiNG+4fjh/SijbEw4KdlUOCPc7HJuCZe0YqMasQxi6ik+A9vmuwiNESIii8kES+YBXji6sMkaGr8fhJ1+scz7rrpKBQnrzgvCKMG0eILOe2aUmCS/SQhst0vWJtAmzjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JeS1arC/9WdYjR3qxew20dKNqPvRb89zLfujRsAZxzo=;
 b=Bl3Z68biRbCiZI5Vpw1jhuMdIgd8O9yYnEGloDD0hpeHecjBFBEiUQGLISXjrlAH0Od4MBfgqX8ZXOF05rXa0ZU481LcmXVRtCLNn5VkazTg1PCM3zH//oPPo25jfYz82BAHI+4CHe5HyOcP7tvhJ+kVwPcVMut1pvPpru7VIX7veN+JA2MSF+tzrcO6oF0PD5qJjf19mVtfgW+9fxvLK8DOPUF+8z5N7JbWs42aCvOchLLWWUMDJ1WwMXQaOrcwurq3gO9qnzIvZ1a+mXf+YRphOo2gDk4Ep0wggogUsvQTP3G1+asM7Hf5uvZE9zs8Wrjox3or9GJXUwJ/yAgWcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JeS1arC/9WdYjR3qxew20dKNqPvRb89zLfujRsAZxzo=;
 b=USGObAeOh9wLqFIHZql8Ky+/N16SoIfiuyOaLj18VL0mA/dWMUhzRWw9Aug4sSjFHx2FHVt7QoUzCNXeH6V7WGjJIY4l5nLd/kY+z67+BHMEynui7TUOG82a1ZlZ/xzhEWH2bH1O1ElX+nOyMspSBJliHa3aX+lFbq17kKidxtk=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by SN7PR10MB6384.namprd10.prod.outlook.com (2603:10b6:806:26c::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.14; Thu, 19 Sep
 2024 00:30:44 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%3]) with mapi id 15.20.7982.012; Thu, 19 Sep 2024
 00:30:44 +0000
From: eugene.loh@oracle.com
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH v2 01/19] Change probes from having lists of clauses to lists of stmts
Date: Wed, 18 Sep 2024 20:30:41 -0400
Message-Id: <20240919003041.23158-1-eugene.loh@oracle.com>
X-Mailer: git-send-email 2.18.4
Content-Type: text/plain
X-ClientProxiedBy: BYAPR01CA0046.prod.exchangelabs.com (2603:10b6:a03:94::23)
 To CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|SN7PR10MB6384:EE_
X-MS-Office365-Filtering-Correlation-Id: 2f11a037-b6ac-4bfb-2021-08dcd8424c5b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?eZXdU2ALO65NhnwpBH55hM0AnUv4YvshiqElh26HklwnotfelH0pLuqUQNES?=
 =?us-ascii?Q?SwG7AEAaAxVDnKBSPRL2AUAidtZsstLUbvgUNn5QogPvcTFFMp2NqXexf9hy?=
 =?us-ascii?Q?Yb1j4oBLYQLHWuPCpxMQAmK8PDG4e0382mOczu8sUH7eArEI/HCMbHtcYpH3?=
 =?us-ascii?Q?lH6ZqzTXX7s3jqptLV3SAQ6+la58AnZV91ZU3+PBxET/n7Qo/KauXyqG7SRk?=
 =?us-ascii?Q?APrmtHykiRpap6EMujn3LK3H9ZOHXJYe5vRD8OmT3a//Llg1rI0GeWO00L0g?=
 =?us-ascii?Q?3g7XlmL5nJ5jiP8X2omBMRSZZs74dN6Demsemq2g8270gtA9SVm/Ylk87it6?=
 =?us-ascii?Q?9x1/unCwPtJiWKxDGsBMW6xs0wW7cL1HVI5hNjIb2+qa8HyiZfzUeTpQXS3V?=
 =?us-ascii?Q?cbNacwNrfTedCC1DsHkn04AhzLmwokwuZ4SsJdHIs/7LPMBrTJzCtdImTaCY?=
 =?us-ascii?Q?HGYRiXhR43kK2tzJtOGAaO3zDrcjMKw5chrcuFOJM4aq3OaxBAHkSgtz5iWK?=
 =?us-ascii?Q?izpYKum1HYkB5irB4hGjE3FFyYbBOhntMjykiKjS3V6B9xjlFCa7Sv+ew+UZ?=
 =?us-ascii?Q?7Z8Tt+maelgTb1h8nye5BcGSk3L8WZzyQlPvhrcApmE2iLjGctk3lM1GQVHD?=
 =?us-ascii?Q?ie9yP1p+XZUBDrN8ZabWHTJiJAuCjHxGxRvUAiaDlsB89DJAyYRzr+D8PBnf?=
 =?us-ascii?Q?AG9/wpFlkwCPybT4veejTVCPLujv5ITQvIcb0lJebhiATO3DcWZb451QHTB/?=
 =?us-ascii?Q?Jisnu5kHLnq4PppNqOm8Hj/tUp1MPu3J1USZYPcPoCtCLC6x7NYD8lTFwcIv?=
 =?us-ascii?Q?O3EOUqWoCZCYtH5kXTetPJCWfOOxuQgUG0TRGzspwj3tdesn7yczT2A/DB6e?=
 =?us-ascii?Q?vuMVHNcrcoLBFJIwtRKSaZpujUKrlZUBO1WP4lkCEkSsmTCvJFKy+hiTPhGq?=
 =?us-ascii?Q?BC1Osuo7bsvhHWIKNhXdIdK2NRLE8A6bJxiYh/BM2bwn/LQO48qScDgNb4HV?=
 =?us-ascii?Q?Me8F1PqkW+tqK54OSap5rbPOys9ttsTOU8k0WQBdlPcclbp3+HO4/TRlzwiL?=
 =?us-ascii?Q?LLDAJ+fi6SMKWuxpxxbRd6k23kzDAxO/QnJv/ilaGov7vFmIfLPJdJDcKZTQ?=
 =?us-ascii?Q?oCJhhQzV2VD3Fv7BcDEvQWmkNleojKIYktYRJSRZiKUKrj/hA4iFtvZ6UlhM?=
 =?us-ascii?Q?Vuo5MM6AEfpP64MO2glUfGgqGayZhBntDV3EjhYIaJcLtgFDCByrfh8pIIET?=
 =?us-ascii?Q?xE2ZQatihlxnNq68GrgPx0upr1bt3Mhm5M96DORSUoC1kOeMxxL1RKlkOZ2l?=
 =?us-ascii?Q?NFr6rSzg92c8+ikw0GB2pdbB8wBknZ9A2Nbhk/J/6O29WQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?pbHft0sujVGi/LBYNlmp8BsnG8Wm0Pgrpg1Z06s6GoCXUYhqAMWzu1l9hfSw?=
 =?us-ascii?Q?vSN0+jplLaRjFR//lralsOV2VcITMq/Twj1SPJH7kBgaf8GIiFmtP2Lg0Zx7?=
 =?us-ascii?Q?crHqdM6AKLn87bMQ4YC0th5hOJpWP9AeCLNQFhOZyNGK1vyDqHw/BdR1RgI3?=
 =?us-ascii?Q?77VNrtPtD2HKQ4vTWCY63qpbHuED7O5CdRjw4L4nOgRmYM4GYvmpmR7Es3kX?=
 =?us-ascii?Q?H7Ni+pnLH8Kn3cTGh5R64oSYighjggNZpbPnabikUaEnagOmgf1DwYti30q7?=
 =?us-ascii?Q?JR11YgD8zjQrcHQA8aQF9v+jly0lKPnU8YkO2hAiWMiD0DBr30ciyXmI4A7O?=
 =?us-ascii?Q?faxPJQIDPA+nYd9muvrs569qdmT0zViW0gFzAsI8h6/8UoYXmsc+70EkVGb7?=
 =?us-ascii?Q?oYFUy614yxQderNYNWvHTmmtDXR5Cw9Pg24EcayYemrToqYE6+jtofYjKJ+u?=
 =?us-ascii?Q?nMivqvpHVPrrbvM9RyJrlda67wvMVtuIEH0UUySg1YRwrTtrZOFYB8Foi8+X?=
 =?us-ascii?Q?GqKGkMSrFA4a+MrL+m3siHOsmPSVSLZHVlVUnqsqvZ1DOTcYczQK+vsw02qT?=
 =?us-ascii?Q?9QGxoG8MnhqtL/9GrJvVd8gXY/eb5KG2dcCld0yq1spsuKMIC/uR3cGW2cRD?=
 =?us-ascii?Q?wwgGRqVddi1p/K2KItXWSpYEr2T72rIifmX6MCyllAX/ylwhq1RpPa+JWawc?=
 =?us-ascii?Q?v3Mpt1IafS8Sibv5p8Ky0S2w0fT1GOLVdP/ss7hlT2t2x+lPkba8hjG8yR0x?=
 =?us-ascii?Q?qh6zQk1RlO3E21zUJ9ALdK2r8n6VGr32/4a7fQG/T+h0ZY5gtete5VFgz/Bc?=
 =?us-ascii?Q?+z0/WJwrG0Qh2ld7mkBo63OI8ugYoaUXKJD6Uk/hZMAah22nJuIc7gKtAxzg?=
 =?us-ascii?Q?51KDN9hlesJg0gW9L4PJNT0cVSXPsbvopDuGvFt7s6NJUaIAf8zpun+hJQGM?=
 =?us-ascii?Q?a4pPag035yl8RRjbz7Apr+kiSYNnX0K7jJrCCIBwFqtYMNzEmzqnpZBKYK9F?=
 =?us-ascii?Q?ytzVd1FKMVgsy4BsZI1VR74+767yg3w1fPOHdw3eS8Xg6iGVgfd6AApfXwLl?=
 =?us-ascii?Q?WbDAB+7ufPgtv15XjRsivbAx/N7Bb+6+G3WK1D0YcEdYWrCx45mdeErzrGQO?=
 =?us-ascii?Q?dhoKdirjinYhisyQlNICHprNEKTa9W+G1eLWJN07ubRUqUx48Idrrj2FHXoR?=
 =?us-ascii?Q?yEUHK/rk9B+1KiUEFwYw/xzz2ANSW68uQcn2dFbe9nQIRzizwDx359dyRH0n?=
 =?us-ascii?Q?GmpOhXGAqCgSvE6QmHNLgM6N3JtqO+QyDJeNG0Kfqh7rP9F0t4QLz3JL4uaS?=
 =?us-ascii?Q?I/w1+BzIoWi8tkKsqXej1HVFwoVg9riAmxUk1FntlF/Cejn0I33Wx/rX5omD?=
 =?us-ascii?Q?VrnrLGmezDbOaVqsIXhjEfGUXqQ7iviWIVZH+DhSzv1RyDsJoZo6pzuPIiMJ?=
 =?us-ascii?Q?ZcmTzXe3UpQC1GS/e7gW8tKXZPtyTN3Isw6tPuYbJZ+4GotnCfwz1fxLFolQ?=
 =?us-ascii?Q?mxp9ePViiISN2rP3WlS+ib7n2dGALLAES7fsk41UBGzA5JQ98y65ZsiXXaA/?=
 =?us-ascii?Q?3ZAZEIqNsZIPlD4Ipso1KUE/uJ7cnQrSFWI0sKSl?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	Dck4nzna10KZeT33q6a3tz2PRXU9VP++rMGXGmUT5clLv7uk0k8kAa6KvPgxBdFwdB5Y6bNDUj5YkIfUYcvqTjDkzXDj7kUMzT4owcmULbjTwQJnsaDv496FGg83SFc0LnL40dBDgWW5N9vvhMP3zlSZS9w4hJmfLbvr5zZqYJgxaOsph2ppIxjVfDUlVYcczJ+GMfaQ3PdhhwcSrWAWdjNakI5QkCX5yp4JfKXI7vc+15OeweY26VY5823DjFMtHmpWTAi/kqN8ZRvPgQW8ODdKyjHYukFQMOf5WRT+azUyU4WONhB0zjXaQ1CJwyFX+QKbO4aZ4NKG8kjUqUGBpoPrO4bw+5JAw/h3cRchkDPf1UXPmaJkom52o/FahrB8YBmhSvIur+A6hMsZFYrukPAV5PfApjOSOgZU4uwe7+c7uniPNz8Sj2V32LxO+zs74FJ6sAR+ABmxpO+av7Nb3HVNj1TmAxHGv3p0x3LY9X0mBX/T826dpCRymqeTfpD3IHwWf/K6I8bUk4i1eCNC04qjbroRJJlqYbNr95kWJr4+JPybm20v/atoDGeMvm2AKUQPXr5QDmpbMQ6wkqdnVtxAq04BJF7kUDKo4rlmWZQ=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f11a037-b6ac-4bfb-2021-08dcd8424c5b
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Sep 2024 00:30:44.1414
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: z1lJVYz5bLKho7ibI3jPcdhdgthWm3IlsEv+AOjmX/Zg8codpHmx4gLYc2rorQP71B9i+L7g3XzFYR27LqkPLQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR10MB6384
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-18_14,2024-09-18_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 mlxlogscore=999
 malwarescore=0 spamscore=0 mlxscore=0 adultscore=0 suspectscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2408220000 definitions=main-2409190002
X-Proofpoint-GUID: Dz1skvaC70X2PHMp3fmMmaOansPFl7FY
X-Proofpoint-ORIG-GUID: Dz1skvaC70X2PHMp3fmMmaOansPFl7FY

From: Eugene Loh <eugene.loh@oracle.com>

Each stmt has a clause and a probe description.  Traditionally,
we have added clauses to probes.  Further, we have generated an
enabled probe ID for each probe/clause combination, and the
consumer has used the EPID to determine the PRID as well as the
data descriptor for the clause.

In this patch, change from probes having clauses associated
with them to having stmts.

Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
---
 libdtrace/dt_cg.c      | 17 +++++-----
 libdtrace/dt_probe.c   | 73 ++++++++++++++++++++++--------------------
 libdtrace/dt_probe.h   | 12 +++----
 libdtrace/dt_program.c |  8 ++---
 4 files changed, 56 insertions(+), 54 deletions(-)

diff --git a/libdtrace/dt_cg.c b/libdtrace/dt_cg.c
index 166627fba..f6c88c5ca 100644
--- a/libdtrace/dt_cg.c
+++ b/libdtrace/dt_cg.c
@@ -844,9 +844,10 @@ typedef struct {
 } dt_clause_arg_t;
 
 static int
-dt_cg_call_clause(dtrace_hdl_t *dtp, dt_ident_t *idp, dt_clause_arg_t *arg)
+dt_cg_call_clause(dtrace_hdl_t *dtp, dtrace_stmtdesc_t *sdp, dt_clause_arg_t *arg)
 {
 	dt_irlist_t	*dlp = arg->dlp;
+	dt_ident_t	*idp = sdp->dtsd_clause;
 
 	/*
 	 *	if (*dctx.act != act)	// ldw %r0, [%r9 + DCTX_ACT]
@@ -874,14 +875,12 @@ dt_cg_call_clause(dtrace_hdl_t *dtp, dt_ident_t *idp, dt_clause_arg_t *arg)
 }
 
 void
-dt_cg_tramp_call_clauses(dt_pcb_t *pcb, const dt_probe_t *prp,
-			 dt_activity_t act)
+dt_cg_tramp_call_clauses(dt_pcb_t *pcb, const dt_probe_t *prp, dt_activity_t act)
 {
 	dt_irlist_t	*dlp = &pcb->pcb_ir;
 	dt_clause_arg_t	arg = { dlp, act, pcb->pcb_exitlbl };
 
-	dt_probe_clause_iter(pcb->pcb_hdl, prp,
-			     (dt_clause_f *)dt_cg_call_clause, &arg);
+	dt_probe_stmt_iter(pcb->pcb_hdl, prp, (dt_stmt_f *)dt_cg_call_clause, &arg);
 }
 
 static int
@@ -990,9 +989,10 @@ dt_cg_tramp_epilogue_advance(dt_pcb_t *pcb, dt_activity_t act)
 }
 
 static int
-dt_cg_tramp_error_call_clause(dtrace_hdl_t *dtp, dt_ident_t *idp,
-			      dt_irlist_t *dlp)
+dt_cg_tramp_error_call_clause(dtrace_hdl_t *dtp, dtrace_stmtdesc_t *sdp, dt_irlist_t *dlp)
 {
+	dt_ident_t *idp = sdp->dtsd_clause;
+
 	/*
 	 *	dt_error_#(dctx);	// mov %r1, %r9
 	 *				// call dt_error_#
@@ -1029,8 +1029,7 @@ dt_cg_tramp_error(dt_pcb_t *pcb)
 	TRACE_REGSET("Trampoline: Begin");
 	emit(dlp, BPF_MOV_REG(BPF_REG_9, BPF_REG_1));
 
-	dt_probe_clause_iter(dtp, dtp->dt_error,
-			     (dt_clause_f *)dt_cg_tramp_error_call_clause, dlp);
+	dt_probe_stmt_iter(dtp, dtp->dt_error, (dt_stmt_f *)dt_cg_tramp_error_call_clause, dlp);
 
 	emit(dlp, BPF_MOV_IMM(BPF_REG_0, 0));
 	emit(dlp, BPF_RETURN());
diff --git a/libdtrace/dt_probe.c b/libdtrace/dt_probe.c
index 01a0196af..686e2a661 100644
--- a/libdtrace/dt_probe.c
+++ b/libdtrace/dt_probe.c
@@ -24,10 +24,10 @@
 #include <dt_list.h>
 #include <dt_bpf.h>
 
-typedef struct dt_probe_clause {
-	dt_list_t	list;
-	dt_ident_t	*clause;
-} dt_probe_clause_t;
+typedef struct dt_probe_stmt {
+	dt_list_t		list;
+	dtrace_stmtdesc_t	*stmt;
+} dt_probe_stmt_t;
 
 typedef struct dt_probe_dependent {
 	dt_list_t	list;
@@ -335,7 +335,7 @@ dt_probe_enable(dtrace_hdl_t *dtp, dt_probe_t *prp)
 void
 dt_probe_destroy(dt_probe_t *prp)
 {
-	dt_probe_clause_t	*pcp, *pcp_next;
+	dt_probe_stmt_t		*psp, *psp_next;
 	dt_probe_instance_t	*pip, *pip_next;
 	dt_probe_dependent_t	*dep, *dep_next;
 	dtrace_hdl_t		*dtp;
@@ -367,9 +367,9 @@ dt_probe_destroy(dt_probe_t *prp)
 	dt_free(dtp, prp->nargv);
 	dt_free(dtp, prp->xargv);
 
-	for (pcp = dt_list_next(&prp->clauses); pcp != NULL; pcp = pcp_next) {
-		pcp_next = dt_list_next(pcp);
-		dt_free(dtp, pcp);
+	for (psp = dt_list_next(&prp->stmts); psp != NULL; psp = psp_next) {
+		psp_next = dt_list_next(psp);
+		dt_free(dtp, psp);
 	}
 
 	for (dep = dt_list_next(&prp->dependents); dep != NULL; dep = dep_next) {
@@ -1147,24 +1147,24 @@ dtrace_probe_iter(dtrace_hdl_t *dtp, const dtrace_probedesc_t *pdp,
 }
 
 /*
- * Create an ERROR-probe specific copy of a given clause.
- *
- * A modified copy of the clause is necessary because the ERROR probe may share
- * some clauses with other probes, and yet it needs to be handled differently.
+ * Create an ERROR-probe specific copy of a given stmt.
  *
- * The following modifications are made in the copy of the clause:
+ * A modified copy of the stmt is necessary because the ERROR probe may share
+ * some stmts with other probes, and yet it needs to be handled differently.
  *
- *	- it is named dt_error_N where N is taken from the original clause
- *	  dt_clause_N (which also guarantees uniqueness)
+ * In the copy of the stmt, the clause is named dt_error_N, where N is taken
+ * from the original stmt's dt_clause_N (which also guarantees uniqueness).
  */
-dt_ident_t *
-dt_probe_error_clause(dtrace_hdl_t *dtp, dt_ident_t *idp)
+static dtrace_stmtdesc_t *
+dt_probe_error_stmt(dtrace_hdl_t *dtp, dtrace_stmtdesc_t *sdp)
 {
 	char		*name;
 	int		len;
+	dt_ident_t	*idp = sdp->dtsd_clause;
 	dtrace_difo_t	*dp = dt_dlib_get_func_difo(dtp, idp);
 	dt_ident_t	*nidp = NULL;
 	dtrace_difo_t	*ndp;
+	dtrace_stmtdesc_t *nsdp = NULL;
 
 	/*
 	 * Copy the DIFO.
@@ -1180,7 +1180,6 @@ dt_probe_error_clause(dtrace_hdl_t *dtp, dt_ident_t *idp)
 	name = dt_alloc(dtp, len);
 	if (name == NULL)
 		goto no_mem;
-
 	snprintf(name, len, "dt_error_%s", idp->di_name + strlen("dt_clause_"));
 
 	/*
@@ -1194,7 +1193,12 @@ dt_probe_error_clause(dtrace_hdl_t *dtp, dt_ident_t *idp)
 
 	dt_ident_set_data(nidp, ndp);
 
-	return nidp;
+	nsdp = dt_alloc(dtp, sizeof(dtrace_stmtdesc_t));
+	if (nsdp == NULL)
+		goto no_mem;
+	nsdp->dtsd_clause = nidp;
+
+	return nsdp;
 
 no_mem:
 	if (ndp != NULL)
@@ -1207,40 +1211,39 @@ no_mem:
 }
 
 int
-dt_probe_add_clause(dtrace_hdl_t *dtp, dt_probe_t *prp, dt_ident_t *idp)
+dt_probe_add_stmt(dtrace_hdl_t *dtp, dt_probe_t *prp, dtrace_stmtdesc_t *sdp)
 {
-	dt_probe_clause_t	*pcp;
+	dt_probe_stmt_t	*psp;
 
-	pcp = dt_zalloc(dtp, sizeof(dt_probe_clause_t));
-	if (pcp == NULL)
+	psp = dt_zalloc(dtp, sizeof(dt_probe_stmt_t));
+	if (psp == NULL)
 		return dt_set_errno(dtp, EDT_NOMEM);
 
 	if (prp == dtp->dt_error) {
-		pcp->clause = dt_probe_error_clause(dtp, idp);
-		if (pcp->clause == NULL) {
-			dt_free(dtp, pcp);
+		psp->stmt = dt_probe_error_stmt(dtp, sdp);
+		if (psp->stmt == NULL) {
+			dt_free(dtp, psp);
 			return 0;
 		}
 	} else
-		pcp->clause = idp;
+		psp->stmt = sdp;
 
-	dt_list_append(&prp->clauses, pcp);
+	dt_list_append(&prp->stmts, psp);
 
 	return 0;
 }
 
 int
-dt_probe_clause_iter(dtrace_hdl_t *dtp, const dt_probe_t *prp,
-		     dt_clause_f *func, void *arg)
+dt_probe_stmt_iter(dtrace_hdl_t *dtp, const dt_probe_t *prp, dt_stmt_f *func, void *arg)
 {
-	dt_probe_clause_t	*pcp;
-	int			rc;
+	dt_probe_stmt_t	*psp;
+	int		rc;
 
 	assert(func != NULL);
 
-	for (pcp = dt_list_next(&prp->clauses); pcp != NULL;
-	     pcp = dt_list_next(pcp)) {
-		rc = func(dtp, pcp->clause, arg);
+	for (psp = dt_list_next(&prp->stmts); psp != NULL;
+	     psp = dt_list_next(psp)) {
+		rc = func(dtp, psp->stmt, arg);
 
 		if (rc != 0)
 			return rc;
diff --git a/libdtrace/dt_probe.h b/libdtrace/dt_probe.h
index b4c1a3e40..2a78cb9ca 100644
--- a/libdtrace/dt_probe.h
+++ b/libdtrace/dt_probe.h
@@ -32,7 +32,7 @@ typedef struct dt_probe_instance {
 
 typedef struct dt_probe {
 	dt_list_t list;			/* prev/next in enablings chain */
-	dt_list_t clauses;		/* clauses to attach */
+	dt_list_t stmts;		/* stmts */
 	dt_list_t dependents;		/* dependenct probes to attach */
 	const dtrace_probedesc_t *desc;	/* probe description (id, name) */
 	dt_provider_t *prov;		/* pointer to containing provider */
@@ -86,11 +86,11 @@ typedef int dt_probe_f(dtrace_hdl_t *dtp, dt_probe_t *prp, void *arg);
 extern int dt_probe_iter(dtrace_hdl_t *dtp, const dtrace_probedesc_t *pdp,
 			 dt_probe_f *pfunc, dtrace_probe_f *dfunc, void *arg);
 
-extern int dt_probe_add_clause(dtrace_hdl_t *dtp, dt_probe_t *prp,
-			       dt_ident_t *idp);
-typedef int dt_clause_f(dtrace_hdl_t *dtp, dt_ident_t *idp, void *arg);
-extern int dt_probe_clause_iter(dtrace_hdl_t *dtp, const dt_probe_t *prp,
-				dt_clause_f *func, void *arg);
+extern int dt_probe_add_stmt(dtrace_hdl_t *dtp, dt_probe_t *prp,
+			     dtrace_stmtdesc_t *sdp);
+typedef int dt_stmt_f(dtrace_hdl_t *dtp, dtrace_stmtdesc_t *sdp, void *arg);
+extern int dt_probe_stmt_iter(dtrace_hdl_t *dtp, const dt_probe_t *prp,
+			      dt_stmt_f *func, void *arg);
 
 extern int dt_probe_add_dependent(dtrace_hdl_t *dtp, dt_probe_t *prp,
 				  dt_probe_t *idprp);
diff --git a/libdtrace/dt_program.c b/libdtrace/dt_program.c
index a4b052fc4..0e2c1e2af 100644
--- a/libdtrace/dt_program.c
+++ b/libdtrace/dt_program.c
@@ -139,8 +139,8 @@ dtrace_program_info(dtrace_hdl_t *dtp, dtrace_prog_t *pgp,
 }
 
 typedef struct pi_state {
-	int		*cnt;
-	dt_ident_t	*idp;
+	int			*cnt;
+	dtrace_stmtdesc_t	*sdp;
 } pi_state_t;
 
 static int
@@ -151,7 +151,7 @@ dt_stmt_probe(dtrace_hdl_t *dtp, dt_probe_t *prp, pi_state_t *st)
 	dt_probe_info(dtp, prp->desc, &p);
 	dt_probe_enable(dtp, prp);
 
-	dt_probe_add_clause(dtp, prp, st->idp);
+	dt_probe_add_stmt(dtp, prp, st->sdp);
 	(*st->cnt)++;
 
 	return 0;
@@ -166,7 +166,7 @@ dt_prog_stmt(dtrace_hdl_t *dtp, dtrace_prog_t *pgp, dtrace_stmtdesc_t *sdp,
 	int			rc;
 
 	st.cnt = cnt;
-	st.idp = sdp->dtsd_clause;
+	st.sdp = sdp;
 	rc = dt_probe_iter(dtp, pdp, (dt_probe_f *)dt_stmt_probe, NULL, &st);
 
 	/*
-- 
2.43.5

