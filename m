Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03CB9165FA5
	for <dtrace@lists.linux.dev>; Wed,  1 May 2024 21:01:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714597274; cv=fail; b=WQ5iYKHolAOKYKOriKroleqU3kcSFeYEuM8JPdR712ft9O3zF4OQgKTZ1PATjM98UGQFXzYVzB9QU/p2RMje1t9x/ZadUzfx9AzM4ycYptjhDksWmCg98Hcf0Y1To+IbLoUtGvf2TkNqFl9ZC+VM/jN6SLIJIriKCOrFpicCgeo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714597274; c=relaxed/simple;
	bh=8poe9NaSLcUPhLG6DCmw3QwHpElBTqS1tyPa/uzT5O4=;
	h=Date:From:To:Subject:Content-Type:Message-ID:MIME-Version; b=M/E1k/4H2ED0o0PJpH3BLtDRZpbk9wnxQ2o7bgnWeErSV6Iikej7V9BTDc+e4EPvPSbe0iOAFNlAwmDsl3DW1Ub5Cwoc79dMGiE9qXPC3Mrz/p6YXJGswiY7Kyc7cEuTIEb/9FxODvp7hxkGEoytVbaVp+vLyGspEcAK/nLqars=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=Fx1UQ+nf; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=WwSlAT62; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="Fx1UQ+nf";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="WwSlAT62"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 441JcO5b022714
	for <dtrace@lists.linux.dev>; Wed, 1 May 2024 21:01:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to :
 subject : content-type : message-id : mime-version; s=corp-2023-11-20;
 bh=63R2MokifwdQoJg6ANdRAGq2nEq3XGox6Vw2FwBeuTg=;
 b=Fx1UQ+nf3xBY0zupp/7N0HrJe+4r+b1FN2Vm5FnnaMC6A3GCFoYcyplazDggfgoJ3ZeQ
 zZD2CD/SCAaEdzGDJ/ih6Cp6jXJnJ6LVW2U+zTM1a5naPZYvAJIZomccDch0aA/qT7W4
 x2rMyVBbrpt1lu35btw0YXzteC2L6HyeiwTwxsN1wGwREZkuJq21TGf1Tm2TSDVdd1iM
 /CfSPz/a9Uh8CWZqHwCZlrrJG3nasLnuvfPAych6DqWaISEYSib6Lbml1EgxR8PmqBDH
 TufnaPkbCQ3shjHVL9Xw71ibd4eOGV+jxj9bGx1nb9AoVYwn2o90nApbYZUTn8kOjArT aQ== 
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3xrryv82s0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 01 May 2024 21:01:10 +0000
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 441KTaYR034747
	for <dtrace@lists.linux.dev>; Wed, 1 May 2024 21:01:09 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2168.outbound.protection.outlook.com [104.47.57.168])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 3xu4c14dud-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 01 May 2024 21:01:09 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VaIGYY8sZlg7MmOWd2nus9ib7KGD7v2J8o13dNzTpIegfuSEV4gbOXan9lXDXEFpYfGT2VqS+FtnJ4iYwcAWuQyGOHupIKEJo3+ynT74Dckw+7mCfw0E9GqICIR/NxXgnZD4qnvSZlozAJY4/jTGFiwbkBu4Jn5KTPodSg8W8ML3hYRsPy957QgPZCWy8zgMuiXCuHhPrRu6DDXosK/OgcGYP+Ol/WTKF3zg5HbE+Wd9yky5CbGFXgvp0GhZOH8Te1GwzqqPZIjbuu6EWEJFNKXWLCVNmmKYKEJg8hY0gtc6WghrO5Y4gEXD86GiNmWxjyeNU+Z28ilYxAUzJvfh3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=63R2MokifwdQoJg6ANdRAGq2nEq3XGox6Vw2FwBeuTg=;
 b=c78yG2LuV6LR/vl6OieLHROmpFtDZD2nQTM7i/Sol9eS2K7eEwAU5w6eQ9+4CqDiiqQRYbcbBk85D9iFy9ii+mtEPej534Z8NK4bYNcjYdVjfOyCikFcKih+XxJS253b49/zw/+kWhjc4uLqOAfQ+0vurWhmwjsqdC4D7SQXllTdr3X02/DuNrGR5h8Gpa8wIAVwv75YoMbKq35LkbkNhA3rdVVAvuKaod16ornk3flJXhEygnQS0entxWKvYhpIpJm6dEG7nMDuQnIrla5UO2Qdui+ba2UHinK/ql0aTkGEw2Js0FdBRbWV9Q8XJ/gDGXava4w3iDV5TA+9Foa/ww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=63R2MokifwdQoJg6ANdRAGq2nEq3XGox6Vw2FwBeuTg=;
 b=WwSlAT62yYj4NVcs5OQDGybN3mmQYHdJdvQZgJvJm5Hgzc4Q63MYY+dFWhKcpU1TyQQVXf+vBKnkeeHlE1xrMBntMr+xQiJOoIiB+eUebG1+Vnm7VhoJ0yxa+bTjc4tNGnv7FkuzQXGEoWMFrl9cu7NqcQPSW6Rz3rtuH1T20LA=
Received: from SN7PR10MB6287.namprd10.prod.outlook.com (2603:10b6:806:26d::14)
 by MW4PR10MB5749.namprd10.prod.outlook.com (2603:10b6:303:184::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.36; Wed, 1 May
 2024 21:01:04 +0000
Received: from SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::6c60:5db4:7058:1440]) by SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::6c60:5db4:7058:1440%6]) with mapi id 15.20.7544.029; Wed, 1 May 2024
 21:01:04 +0000
Date: Wed, 01 May 2024 16:52:20 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH v3] cg: allow providers to specify a skip count for stack
 retrieval
Content-Type: text/plain
X-ClientProxiedBy: BL1PR13CA0348.namprd13.prod.outlook.com
 (2603:10b6:208:2c6::23) To SN7PR10MB6287.namprd10.prod.outlook.com
 (2603:10b6:806:26d::14)
Message-ID: 
 <SN7PR10MB6287B406F9AB2BBCC1949820C2192@SN7PR10MB6287.namprd10.prod.outlook.com>
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR10MB6287:EE_|MW4PR10MB5749:EE_
X-MS-Office365-Filtering-Correlation-Id: 5a129058-a8a6-4019-9423-08dc6a21d055
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|376005|1800799015;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?6GqIAK8rqHs+QAsbho0Pzx0xxMgM3suXdKrt6iY/Xr6rAq5twD/mYHxQb8HU?=
 =?us-ascii?Q?1bXuim97ow9ftEgNRIJhTt6RAZMIQ2FgQGLulXCjCBfPiHHo/5O6TRk+ddaN?=
 =?us-ascii?Q?RsMp8njXtFMa5amMIWiunqJcRVxnruVTzQe4UkpTP6ZQkaAKYCRbPbqhKgRV?=
 =?us-ascii?Q?21sW7YD6b/VVYZw04SAdOPyU0RvSnX/gOTMoM8xbilP6IGz1gvYIat2/pxRB?=
 =?us-ascii?Q?TRq14UHWCimf/1AE8TwlZcP36wW5Ha73s3mkGExga4fUitPQUZ+6D+HWBG4D?=
 =?us-ascii?Q?lK+ybV4SP4zcURyiRFh05OO27fkgWCGgT7jKIV+A6HblkW8GhsRaOGg3CLMU?=
 =?us-ascii?Q?54zRkoJbn/A7p77qijgxt4r0soSw/IYyV8j2tW0/zZ8NUm8tOXl1SL72x0VW?=
 =?us-ascii?Q?R6Tk+nTZzbU5GFGUcZh9vKXnGZhnbMtHSpTiBz3UXMfL4nK7yEKmCwsaYTPR?=
 =?us-ascii?Q?+SQ3ocQFoxs/0KQ14+ylZx1H90Nrx5JbKz38+iS0LLBeA52BJQ2LzT5MPAqH?=
 =?us-ascii?Q?anBVypOapxtmL/VgoEjg7gOPSU/y04z1VBu5sJ14uoxT6TRmkvqYZ6tVrKWq?=
 =?us-ascii?Q?qwaMlpkbqBwrCEa3tGB/hTRFY3XPim4IpYTRFVU+wHHNC6FyRQsTg3Ff2Cdz?=
 =?us-ascii?Q?Fr8tpLC2aBhYBgLvpz8Fhiz4voQDl6efdMPqQtzw4UHazOKdP3zLxyBvF7sV?=
 =?us-ascii?Q?wlUQJqxOTRBaHcceRAr8vwBUBFGz3qSLF0m9ZGNsmdl0oXMoITXoBUldjvKC?=
 =?us-ascii?Q?Mb1ma37DbSUMCbbf2vc22CpkkCqh2sZbWWnhbz32eqqN5FtVNhtWPAZXnFZX?=
 =?us-ascii?Q?EH/RyYoU2Da+6CU7NsesUjwyW0WOhCLvKjABE6s7qL3kjiqFHnzOfhOliJ3G?=
 =?us-ascii?Q?0yGv4Z28EFqVFkh+/phZbsaLyy4l38ciWFKzAkZQNTrtcqDYPSIVMmAD7XKG?=
 =?us-ascii?Q?9+BRsQJeGFoYZpMoEOrEAv9y/1n+MX5wU/wPd2MUjHHvQH6rwwsjT+7DQlGE?=
 =?us-ascii?Q?Qu18gcS8wbUrEdJAFP/ovlTOvAhpJmSRTBx2OmP5z19FBSJl3LNFhWoE/yS5?=
 =?us-ascii?Q?oVdT0JvaHeothccBr+d4C2qZ2apHgxBD/fXzdkwXrNG9kzj6is2GEBUYkUUJ?=
 =?us-ascii?Q?5k/P5fAmn5oavfbuXg/LYvbb3BPlp57ephAVSJvWAXokQT9Iem6e7vUqpze/?=
 =?us-ascii?Q?HNgnDv/GWnWBaKbBc7T2BV8i/5s1/5MfwzGBOGzAbylBYVoArqdsUmQUF3vP?=
 =?us-ascii?Q?iJ/6pA9u9um/HwE9ZCh21qK0vmwicAGFlQUeKD46vQ=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR10MB6287.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(376005)(1800799015);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?rTH4Gn015tHDY4tYt1/d2hgNFh7M99PUxoS1EvU7Uou0WFLE49rjNzpLblu0?=
 =?us-ascii?Q?Vxh8GMIvTK0QJA5OObqFlNX3+KHntZ96N3cdgRHHRVtjWIvIX777Rx7unocq?=
 =?us-ascii?Q?DYdCsyCT90XPsgJPSQG/QLUSmDTrqCXxfHau4hOwAs6LFER6ulyVHP80UYwC?=
 =?us-ascii?Q?2vclTi3B2uHKPP2e0snl+HEWtcNCjbS70dQg8sxK31VR17vVqL9/iS7DK10p?=
 =?us-ascii?Q?3wFApDU1aOTxvaHbrD5C/zhSEUbACXFx/ywmzPb9SqT+zO94g8lMgWsGttdw?=
 =?us-ascii?Q?IvTD4hP86vurINBTykLKGhm5lLm7whfeEKAiojYJvCFObLYZ2oYEkoQiqqL5?=
 =?us-ascii?Q?Ap67pQv12bJ6b0b9Y8MW6p95JgY+Ho1vhq5pAQdi4HOwTInZQ4kZikKRnyYH?=
 =?us-ascii?Q?a3DbAjylygKnmqijoQkZrj/H15VvPCxihgNoJ8XFty1mDZBjRfhv9e4WxR/J?=
 =?us-ascii?Q?qopaA0pEWIVVhx9Jk4XbJvAp9MYxzbaZS8Y0bHS/nlrIkuO5ivKXIRCJckx3?=
 =?us-ascii?Q?JFSgTp6WUHvODEP2s95gscvPCKusv+pRcLzmp/yx6IXQfD4PRcaGE2Jgso0R?=
 =?us-ascii?Q?1Qx6XnmbyFbHJDwPFi6NFyPj3r4DLN+laNfQcgYhTlI+tZ8b837jExlPnXLA?=
 =?us-ascii?Q?1E0uHSf0bYNkC0A/lCSgqp/DKRpgXz2jvw/byoLD5mWwF6zSsK/aNgKcLrch?=
 =?us-ascii?Q?OhQZYBQMDPrnxWZXl58f0dVJNWFcM9MF3ffn++oY9Dd3kUslGb44JBB1Ljwc?=
 =?us-ascii?Q?UyKWT3yGv07meI3yNJ0lzsRdiZfaSrTOG5NDWu1ikTW3murBBk3l3JSUVSoA?=
 =?us-ascii?Q?O6bxA+Bg25mBF41H8igYpEaqikH0l3GAf15i0CPkXn8l+4tmf8jwIyqbE93G?=
 =?us-ascii?Q?SR5/rB4YZc7MEt24Bzpm1Ot1d9SVrhN0Liu0+T4ECWOWI4Fwv+L2hAsEdBjv?=
 =?us-ascii?Q?CkbkZuQkGdC2FoRjiyspJgOEl1a3KM+dgCbceFKcpnJabC+xy92cxzGs3YWX?=
 =?us-ascii?Q?vG9BFBc8aV9xjtp29VF7SCS9uvt8ENajuT7+CuM1/YI/B56reik+wzSdCadK?=
 =?us-ascii?Q?dUyYoL9nQLU8o7mjVr9njxbKuRWV5o0CiFaYTn7Q2jNyYq6HOy0IuylhT05m?=
 =?us-ascii?Q?sKZTV6sCfSkgM1ikePuhRDBdIPopocariRZwbQHYAsNW/nrAxg3oqdS0THTv?=
 =?us-ascii?Q?4e8NCUmF1htjs5HhVfvNK+8kP0/AgB2/dKvxT0rXuxDnNLCkHzp+y/CfW8Rl?=
 =?us-ascii?Q?kiNhqbHTtXZJoERg3c7U5JxbueeODVg39Bpm95nJJnaxFaA5C3uz3egffbNi?=
 =?us-ascii?Q?XOZg56iFse2en0+8QjFr2Zez7TjvTu5mbYOKF3bfRUyFiJUYsVMGWWZLm13C?=
 =?us-ascii?Q?HXwX569Txcho1KJBn5Zniuy5y6btwQXIHEkmkYKjmiIO9sorn5TLDHweRIuB?=
 =?us-ascii?Q?CPRjot3oRL7k2Q65WD4uvZBZGLnM5z6TZS5O9z+pqj7HiOgdqCNTL8YKMNh4?=
 =?us-ascii?Q?Tuk5voqzw3+59NVQxRTijcZjYmcAOTleO18sNoDgiI3qrSQOTrK3knl5qnds?=
 =?us-ascii?Q?L7C/iGRGMqZr5aBWVmyZUPrJdvQ7zK2obesETG60rGknqngNcOzyLontX3Me?=
 =?us-ascii?Q?Vg=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	oHbFFB3Q09gtTf8Y/OoqS6OcmqrCUlKIs6zJMBoFNblDcBknBvt6sw9hiW664TnsQg44eGlRbzUVErvX9HdT/fIY0dvvP7o1Tt7WkSyYWiHL6TLrp4pvP6mLuZDRxli8ZHed0Zl7azXWrIrfFqvzgM4it93nXEK9z9PTmlqJvPvdDkLAGRz0MmbC5p5SMgt/8tc2BeEXAI4zMsr01jhjn0UB030t03ffRTHvaqaH353QfzC4HqOMdTDyhDKbb1kFIY2V31hLpIFh42FV3IXT/9FiFz/Nb1BS76f59JptvY+LgraIaKJZWt6zFNHfAsZBtS6yem24f+7sbxZgHU35/RWCNOST+51/pbz1seN/Ai99eE8DgDRx0t8w1h6Pco3EsOzm7Dlaq6+k2NvUBAibQr9yfvUa+x+NkXf4i8yETkf9x4m2P88MhUsuItAnUkep8nfiAuJDGGxKcfyKX9Wt66U+sM8FgiayhYSAe430MOLp9OpWaXAzaICCayGb+TxkrvLlR/bUN1SFf6MnhMAvBxqLmmxKZZmKUo13B6u8CrdNY3L2j+LFILQZbcneYXl1AZjRu/c6BDC0dD+eozdAVzkqTXzHVP3d6qLZkri/TaA=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a129058-a8a6-4019-9423-08dc6a21d055
X-MS-Exchange-CrossTenant-AuthSource: SN7PR10MB6287.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 May 2024 21:01:04.2510
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1zu9HUnQ/6gvOBE1W3kuaqlvtjVBd1/C1+DWU9l+Iyv0SxFKEC8obAhrmdYTZszg30QMvUXcIu7lGCgbjBNuhqT3lRtsFv926FzYLj4QdRQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR10MB5749
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1011,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-01_16,2024-04-30_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 bulkscore=0
 mlxlogscore=999 suspectscore=0 mlxscore=0 spamscore=0 adultscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2404010000 definitions=main-2405010149
X-Proofpoint-GUID: kSouSzvLxhnEffDQfTZWO_SsMqS0fFfc
X-Proofpoint-ORIG-GUID: kSouSzvLxhnEffDQfTZWO_SsMqS0fFfc

Some probes cause extra frames to be reported with bpf_get_stack() that
need to be skipped to ensure we report the correct stack trace to the
consumer.  FBT probes based on fentry/fexit probes need this.

Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
---
 bpf/get_bvar.c          | 13 +++++++++----
 libdtrace/dt_bpf.h      |  1 +
 libdtrace/dt_cc.c       |  3 +++
 libdtrace/dt_cg.c       | 11 +++++++++--
 libdtrace/dt_dlibs.c    |  1 +
 libdtrace/dt_prov_fbt.c |  1 +
 libdtrace/dt_provider.h |  1 +
 7 files changed, 25 insertions(+), 6 deletions(-)

diff --git a/bpf/get_bvar.c b/bpf/get_bvar.c
index 71eef277..ea5dc6b1 100644
--- a/bpf/get_bvar.c
+++ b/bpf/get_bvar.c
@@ -28,6 +28,7 @@ extern uint64_t STBSZ;
 extern uint64_t STKSIZ;
 extern uint64_t BOOTTM;
 extern uint64_t STACK_OFF;
+extern uint64_t STACK_SKIP;
 
 #define error(dctx, fault, illval) \
 	({ \
@@ -64,12 +65,14 @@ noinline uint64_t dt_get_bvar(const dt_dctx_t *dctx, uint32_t id, uint32_t idx)
 	case DIF_VAR_STACKDEPTH:
 	case DIF_VAR_USTACKDEPTH: {
 		uint32_t bufsiz = (uint32_t) (uint64_t) (&STKSIZ);
-		uint64_t flags = 0 & BPF_F_SKIP_FIELD_MASK;
+		uint64_t flags;
 		char *buf = dctx->mem + (uint64_t)(&STACK_OFF);
 		uint64_t stacksize;
 
 		if (id == DIF_VAR_USTACKDEPTH)
-			flags |= BPF_F_USER_STACK;
+			flags = BPF_F_USER_STACK;
+		else
+			flags = (uint64_t)(&STACK_SKIP) & BPF_F_SKIP_FIELD_MASK;
 
 		stacksize = bpf_get_stack(dctx->ctx, buf, bufsiz, flags);
 		if (stacksize < 0)
@@ -89,11 +92,13 @@ noinline uint64_t dt_get_bvar(const dt_dctx_t *dctx, uint32_t id, uint32_t idx)
 	}
 	case DIF_VAR_CALLER:
 	case DIF_VAR_UCALLER: {
-		uint64_t flags = 0 & BPF_F_SKIP_FIELD_MASK;
+		uint64_t flags;
 		uint64_t buf[2] = { 0, };
 
 		if (id == DIF_VAR_UCALLER)
-			flags |= BPF_F_USER_STACK;
+			flags = BPF_F_USER_STACK;
+		else
+			flags = (uint64_t)(&STACK_SKIP) & BPF_F_SKIP_FIELD_MASK;
 
 		if (bpf_get_stack(dctx->ctx, buf, sizeof(buf), flags) < 0)
 			return 0;
diff --git a/libdtrace/dt_bpf.h b/libdtrace/dt_bpf.h
index 3b9fc633..5b2df264 100644
--- a/libdtrace/dt_bpf.h
+++ b/libdtrace/dt_bpf.h
@@ -55,6 +55,7 @@ extern "C" {
 #define DT_CONST_RODATA_SIZE		21
 #define DT_CONST_ZERO_OFF		22
 #define DT_CONST_STACK_OFF		23
+#define DT_CONST_STACK_SKIP		24
 
 #define DT_BPF_LOG_SIZE_DEFAULT	(UINT32_MAX >> 8)
 #define DT_BPF_LOG_SIZE_SMALL	4096
diff --git a/libdtrace/dt_cc.c b/libdtrace/dt_cc.c
index cb07b8d6..d1ee3843 100644
--- a/libdtrace/dt_cc.c
+++ b/libdtrace/dt_cc.c
@@ -1193,6 +1193,9 @@ dt_link_construct(dtrace_hdl_t *dtp, const dt_probe_t *prp, dtrace_difo_t *dp,
 			case DT_CONST_STACK_OFF:
 				nrp->dofr_data = DMEM_STACK(dtp);
 				continue;
+			case DT_CONST_STACK_SKIP:
+				nrp->dofr_data = prp->prov->impl->stack_skip;
+				continue;
 			default:
 				/* probe name -> value is probe id */
 				if (strchr(idp->di_name, ':') != NULL)
diff --git a/libdtrace/dt_cg.c b/libdtrace/dt_cg.c
index 27246a40..a1c24e37 100644
--- a/libdtrace/dt_cg.c
+++ b/libdtrace/dt_cg.c
@@ -2597,6 +2597,9 @@ dt_cg_act_stack_sub(dt_pcb_t *pcb, dt_node_t *dnp, int reg, int off, dtrace_actk
 	uint64_t	arg;
 	int		nframes, stacksize, prefsz, align = sizeof(uint64_t);
 	uint_t		lbl_valid = dt_irlist_label(dlp);
+	dt_ident_t	*skip = dt_dlib_get_var(dtp, "STACK_SKIP");
+
+	assert(skip != NULL);
 
 	/* Get sizing information from dnp->dn_arg. */
 	arg = dt_cg_stack_arg(dtp, dnp, kind);
@@ -2644,8 +2647,12 @@ dt_cg_act_stack_sub(dt_pcb_t *pcb, dt_node_t *dnp, int reg, int off, dtrace_actk
 		emit(dlp,  BPF_ALU64_IMM(BPF_ADD, BPF_REG_2, off + prefsz));
 	}
 	emit(dlp,  BPF_MOV_IMM(BPF_REG_3, stacksize));
-	emit(dlp,  BPF_MOV_IMM(BPF_REG_4, (0 & BPF_F_SKIP_FIELD_MASK)
-					  | (kind == DTRACEACT_USTACK ? BPF_F_USER_STACK : 0)));
+	if (kind == DTRACEACT_USTACK)
+		emit(dlp,  BPF_MOV_IMM(BPF_REG_4, BPF_F_USER_STACK));
+	else {
+		emite(dlp, BPF_MOV_IMM(BPF_REG_4, -1), skip);
+		emit(dlp,  BPF_ALU64_IMM(BPF_AND, BPF_REG_4, BPF_F_SKIP_FIELD_MASK));
+	}
 	dt_regset_xalloc(drp, BPF_REG_0);
 	emit(dlp,  BPF_CALL_HELPER(BPF_FUNC_get_stack));
 	dt_regset_free_args(drp);
diff --git a/libdtrace/dt_dlibs.c b/libdtrace/dt_dlibs.c
index fe22616a..bc883e11 100644
--- a/libdtrace/dt_dlibs.c
+++ b/libdtrace/dt_dlibs.c
@@ -96,6 +96,7 @@ static const dt_ident_t		dt_bpf_symbols[] = {
 	DT_BPF_SYMBOL_ID(RODATA_SIZE, DT_IDENT_SCALAR, DT_CONST_RODATA_SIZE),
 	DT_BPF_SYMBOL_ID(ZERO_OFF, DT_IDENT_SCALAR, DT_CONST_ZERO_OFF),
 	DT_BPF_SYMBOL_ID(STACK_OFF, DT_IDENT_SCALAR, DT_CONST_STACK_OFF),
+	DT_BPF_SYMBOL_ID(STACK_SKIP, DT_IDENT_SCALAR, DT_CONST_STACK_SKIP),
 
 	/* End-of-list marker */
 	{ NULL, }
diff --git a/libdtrace/dt_prov_fbt.c b/libdtrace/dt_prov_fbt.c
index 0ddffa20..fa888ed8 100644
--- a/libdtrace/dt_prov_fbt.c
+++ b/libdtrace/dt_prov_fbt.c
@@ -431,6 +431,7 @@ static void kprobe_detach(dtrace_hdl_t *dtp, const dt_probe_t *prp)
 dt_provimpl_t	dt_fbt_fprobe = {
 	.name		= prvname,
 	.prog_type	= BPF_PROG_TYPE_TRACING,
+	.stack_skip	= 4,
 	.populate	= &populate,
 	.load_prog	= &fprobe_prog_load,
 	.trampoline	= &fprobe_trampoline,
diff --git a/libdtrace/dt_provider.h b/libdtrace/dt_provider.h
index a24b1d00..17b1844c 100644
--- a/libdtrace/dt_provider.h
+++ b/libdtrace/dt_provider.h
@@ -44,6 +44,7 @@ typedef struct dt_argdesc {
 typedef struct dt_provimpl {
 	const char *name;			/* provider generic name */
 	int prog_type;				/* BPF program type */
+	uint32_t stack_skip;			/* # of stack frames to skip */
 	int (*populate)(dtrace_hdl_t *dtp);	/* register probes */
 	int (*provide)(dtrace_hdl_t *dtp,	/* provide probes */
 		       const dtrace_probedesc_t *pdp);
-- 
2.42.0

