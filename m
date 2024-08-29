Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2C0E446A2
	for <dtrace@lists.linux.dev>; Thu, 29 Aug 2024 05:23:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724908983; cv=fail; b=ckul5GCdq1dFAZftW6wZ5b1G7GDtJH6BAHRzOG0FB4jbuNPKM3G/EWzRgJ1OMeZ+HjB7+7DFBMkWyKzRQ1MUI2LhO8GtMO/mE5WuW1Y3TLc6BKgP6n9CHqem7PRCYks+biLAFU4DsxW8Xpe2gOLZe46cRrXaEMtHCdSuwdbodQI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724908983; c=relaxed/simple;
	bh=4/Vju5GeujueYari1a3/n/lcwzvQYOQS4zy68KCWuGU=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=etWWaeVNLr/sbKkk+Oo1qKndABFFBJFhlZxF0WojVappTWQqhhbuhfJ7IO+Jds2bKtoChHspXEMKJ02GgIo1DoKaiypw9h56SVU22RBiih0IXrNkmzdOilH+ycPgIWiszRGkUjl4PUwyhid54T5PNdUkIsC3APJYdUhxOATnmMg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=ZJwQmb0u; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=Vw0wXWtP; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="ZJwQmb0u";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="Vw0wXWtP"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47T1fWx5010634
	for <dtrace@lists.linux.dev>; Thu, 29 Aug 2024 05:23:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	from:to:subject:date:message-id:in-reply-to:references
	:content-type:mime-version; s=corp-2023-11-20; bh=AY0RqFHslAcqwL
	9JFinIYKANmD5N5JccNl6d/rwYiP4=; b=ZJwQmb0u6bBUL0nE6mZ+7IthJFTruG
	GevXBWvdoknpCUuQMe6VmxWumbTFEtablD0P37GAIAhZzEdvNgbBZtjLxzSWGSxw
	TqmtWSSjCoEkonh3rBwUC2yLTIVG0BeHvrlBUdREqtnTd3GmPaUF8x5oSJqALWvo
	3zUIg44enqYY2dHBMLAwmczK/HDxkGGXR+SqavdGYTzqm3eBgQtODsFFrHVS4O48
	u+HybTew9Ti+pCt3fNPuT01MImVbfyKC9XOAxWgDp12ySz/mY/oOaBb44LB5JyFC
	el7vdOOECffkPmbCInyAJp8izT+M6X+RhfzFgCnKlSEkXH4ErvbgPedg==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 419pugucbr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 29 Aug 2024 05:23:00 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 47T5CO2N031763
	for <dtrace@lists.linux.dev>; Thu, 29 Aug 2024 05:23:00 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2045.outbound.protection.outlook.com [104.47.55.45])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 418a0w813y-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 29 Aug 2024 05:22:59 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=y6SniouYUWftI9ql9AizxVaiDBcxrAKJOPcZ3cOJp3bYEkLblhMb+Bpg8NLUzonUwl/phd68XwOusJ0eLYAsvi9A8FAfxgeeEXjeH3xTsrB7yAls2wb5wLDlRvdugnCt58ZkRopC5RmW6ZQGz2pagQGF45BGnJIIlpMes/QGfQQuBZgMNCjkc108PYa25Fp3P+Ipu+HWkwGoo+HL+AZj9xQxclCYK/7zLn6+IsEuAE6NfsAdsWs7+5q6ivhNCYjTL9kfC0GG9nD3Dkk79RosxjZr77A/G1TZxxTQddSpCvUfDCmC11aYSyOWwNC/tjXYbSauSlwiw7flWt8KBSHc4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AY0RqFHslAcqwL9JFinIYKANmD5N5JccNl6d/rwYiP4=;
 b=DbT0uGiQvCjma6oMX4vGQNBCT7UUGUy+9OX//tzQX5QOEICzvHFNBsPYGQwFkGDvhq9Ne1jdZw5laqC+BGrYbA670CPnSzeIIJHSDCNbpJk6tep2jyojzE6r80tdGi/rgHG6DH4QOCduhAum8JudOuDmh2d1lTFhWu8113BZEWNWokHbaqgGDaJPbnYmASwDprcKZ79arlAQQoA+re7QeI12nnWd9kNsKHN2S2slMQ7Ar0hhlPLsRysPYL/OsMbw3HZzr7ij/Caca1GZdsFXYl3vX4BQaeS/6wVU4uqOCt1MtZ1Hp4uAcUv4WBQH1DRZ/8RefHOaFwozQO5UG/hXuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AY0RqFHslAcqwL9JFinIYKANmD5N5JccNl6d/rwYiP4=;
 b=Vw0wXWtPWNxdxAZc52HeyY0Xq3+N/H6DQfAFEM3hGv/nFMAzaiBA1kfFOgAPeImLge6FcWmAi0YRoa1HB51Aqm6du4Dq/v+BSdgPyxX17qOcNjA+gVvq5+d8m3Xycb9BnXQrFwnShcR/yL4fk21jpNrpFTshjikGHMLQ2pyqEgk=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by PH0PR10MB7008.namprd10.prod.outlook.com (2603:10b6:510:287::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.18; Thu, 29 Aug
 2024 05:22:56 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%3]) with mapi id 15.20.7918.017; Thu, 29 Aug 2024
 05:22:56 +0000
From: eugene.loh@oracle.com
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH 16/22] test: Fix the speculative tests that checked bufsize
Date: Thu, 29 Aug 2024 01:22:13 -0400
Message-Id: <20240829052219.3234-16-eugene.loh@oracle.com>
X-Mailer: git-send-email 2.18.4
In-Reply-To: <20240829052219.3234-1-eugene.loh@oracle.com>
References: <20240829052219.3234-1-eugene.loh@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: MN0PR04CA0025.namprd04.prod.outlook.com
 (2603:10b6:208:52d::24) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|PH0PR10MB7008:EE_
X-MS-Office365-Filtering-Correlation-Id: 33ee18e3-2e0c-465c-8f0b-08dcc7eaa3c4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?sGmFmGuV8Ck4QgG3/O9a8Ev6e+qOnQ3tVLQlXDRoAYb2WyP6d3f/XO/jtE8e?=
 =?us-ascii?Q?HYJfPVTRV8OvMy0UNHRhSeqw8cOr9fz+OuW0/GVI1I1XTTBo/w1D2MyGUBcy?=
 =?us-ascii?Q?Iw0fe+L31fzryRbkG7JMF+c6+pBh1CiyXyzvaoIK48Cg1Ckg723KlpOXbFuZ?=
 =?us-ascii?Q?lD/uZMXdAzxZjWQMC+/R5dyg6TPie9lgskNS3m3mxgP0Mh20s6jqnDghSsy1?=
 =?us-ascii?Q?o40G2ktiDZaxIewfq4CV9Tn9tgS4MjCqMlBhEtMcZNaTiBNE4tA/EjuDW6YO?=
 =?us-ascii?Q?Tus4w0xMIBDDhCJr1Oxs7rcl5Vi/EjnRgRhwc3HfhwA+iJ0VLeQDXEWNtsSb?=
 =?us-ascii?Q?pblnOTn2e8K6YP6DJUXWV+dN9rvQhvNiIyEvaKKC/Y5qYq3SIMYIc5UuLDfD?=
 =?us-ascii?Q?gapKZD8QM2r52sinIE9WX4IwDmv/jmaBzRo7hoxqlZgluv5uMTC4e2toikTH?=
 =?us-ascii?Q?5FwpPfJvzflNqIEpNPUOy8pFfnp3+CRltdgeGqebyZTd1VQmTeOvQMhRN+w7?=
 =?us-ascii?Q?X99rgg58mCaJi948aRHipyeJ2IRj1e6BQ/HuxF+M2pVa97iPiTaZCYEvi7U4?=
 =?us-ascii?Q?kEKArHooh+Mwnj0xY0LYwYdmiS0BwRVBuiAKRoK4o37rICmKnlCUU1LTFB/a?=
 =?us-ascii?Q?J+DW5fkckmNDf4BMVmodM79YsIn+bhMJdHxaLosE2XJ6cMQJvLCGQ2rUx5qK?=
 =?us-ascii?Q?mfQKowDYiPe3La0WaVZTHN87qVCzg1nf0AMtdixfg8LsbhPThuj8VhsFbV5L?=
 =?us-ascii?Q?d8uccwMfEs91O71ZZwaShK7+1hVaACt35uQA8vv0NyJG/502ynWGO31jLPol?=
 =?us-ascii?Q?uy4H9+dOfGF+S2/84/PCE/HQEiVcFf49Zgo65CDbir7iowL7t5tTIz+dyxSd?=
 =?us-ascii?Q?YRxs5z89Uom3Mw5vn+NSTyWesxicnaK1n+xAXKfz4l3vhO5YRksg8zZCLYrm?=
 =?us-ascii?Q?sPDrB+4AIsWkwz4In2GylveWeGcR20YjjlCEYScmZHaF1QJGsoZA4OVRlxZ7?=
 =?us-ascii?Q?a79McnBDnJXa+jczy2aizU1BMz5fWNboW3z9qQbXdY/BbUNgjlsp1lKXmZT8?=
 =?us-ascii?Q?+QJ+mTBfac7hxkkrVotbFzB65VzdnU9isn8fnKe+aC9MYu9ZnKSTPZxqIuAs?=
 =?us-ascii?Q?u3Snu27Ul4IEWCd/9bUKT7s2jvX8/1pVrTkCuqCorFfSOLttlXdtpv1qaSlH?=
 =?us-ascii?Q?4ceJcTYZM0TaRvi3hPcuH4XqQJgyKvCxyfE/4PTGsXWk+WP4rVPi8YLLBOCk?=
 =?us-ascii?Q?3k5MvS+aK0KyuMpAk5Va2WpnI92Hp0/mO3LuXeFpuyRPJHR3fZAG8xBjyR5F?=
 =?us-ascii?Q?GYA=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Jb+JwZsWECWtT19grhIzk8wUMUu5sTiqOfk9Zv9Z3kgAXEXxIcuwsj14L8X/?=
 =?us-ascii?Q?6Cy//2atERMlJRUmBSB2HjjMj2AKSdQGECCOoyNVexF0M99BzmfdrQxwDzMX?=
 =?us-ascii?Q?R6AU9fMGn9kCCFlBMMCFkP7P7NB7rtmSF45IoN/uIAo2sYPL//N8xexaTug6?=
 =?us-ascii?Q?5UvlnPsm74WapocBqbEiY3EMdCLdXlpSR4IGsQR7QfPlszhMkzkOQPAHJNCy?=
 =?us-ascii?Q?+bwKQFkfpl0JuJxAArGfHWp44/KEz1OC6RTGbCH2MVoHt0Hsku8hJVLWVa/9?=
 =?us-ascii?Q?0hM1WNC0kXOP7FeAo3MlScNyUKR2UC/4bpLikxsLQqpv2pyZgczi7rJTrJ/E?=
 =?us-ascii?Q?iu1OGpeuawKjO/dRP1b+E9rDWrJAIjb8gu+Uj2i9+1hPe9wWWXefCcMJ+S0l?=
 =?us-ascii?Q?GX3GpeQUP6EgN4aSDEV4WP9/FabAoW8E09vicsOHQ3VZsLhGT2E7RjGgmWkZ?=
 =?us-ascii?Q?Yv0F8SRy7EU8vLDfBF67KqSR1zzAvsb5wClnDrJSUoQpc8G9plvUAJzjy6/0?=
 =?us-ascii?Q?80Go2amrCOYn+XDPtvwznK4QdMXZXTvapRoVg6SfFieCRczjEDnkI0WTKfVv?=
 =?us-ascii?Q?os82T17SDOuzjpwhqkDtUAXZ8p05BFPs5xZErdN8YPtvTvOOkVkm7L4irmyT?=
 =?us-ascii?Q?759FP1hkz7ZjXbwU49yl7ohGpAU4vpHqwn9d+A3/hfwA9eQgbfp2/p+PV2Rz?=
 =?us-ascii?Q?D3qXA5tjno9BmT9Y+vHhb3HyIfWeSzbfwvXg0ZZ5M7a4Z5sg1bqRC4erO1SI?=
 =?us-ascii?Q?qn/eWZvR+FR5GysGD7ukLi3lyNOX48eUqRrb3EVAGR8+nsrbJi7IGGvboFj/?=
 =?us-ascii?Q?yAA+sIUPsDoolp4nQfaTR6i4IvcY7lSlbk+1J/IzadaDjrYrG0YcPp9XXn1J?=
 =?us-ascii?Q?ZOxBWPvfGZolkvhm+ULqiVKLjLysKY9GpSwOS2xo4Nkx//+tds41LWD1T/ZK?=
 =?us-ascii?Q?qBwlnE57Eg0SqMryEjNMF6T/Uqg7xkGqp9YYTEj2au7NQJ7PCCgmkpc/gLF3?=
 =?us-ascii?Q?Dvloar+V3PnnoQoZmDOxl9Cwpn8RUf9ZwF0igd9VN8ZiLEcGtuHGVwV04rYt?=
 =?us-ascii?Q?ZL7xjNjF4GQtUhqNzZcos7OP7Pdca9M6dNL9KHhUlBkCjT0FPbx/Ymf651rU?=
 =?us-ascii?Q?ec1bF/EjIMuAYolm8w+bTPlQsF15KcuLI3Kz8oNY7FfS4/35jYjm/Fw2z+Rp?=
 =?us-ascii?Q?Jl0G2WezPRwLVhJx3XwCD1G6R15s6MfaQaJmLdMXKHhYK3vp5AbBJxAz5je5?=
 =?us-ascii?Q?D4dQrOEBJU5KYKlNkSRhInT7PYntRGkgyX2BX3q2eBsMd1OT/q4Q1wpyl9Ep?=
 =?us-ascii?Q?EIJTKB5eO5RCVS9824Z1qoSGYEOhEIzT63WT6/146sJmNaPMDwkFV2kab86C?=
 =?us-ascii?Q?ioZZwROGvskxVkq/446/8xDtc1W7hFsRP0/r6rf2mXepgNUg4rwBVexu4NTx?=
 =?us-ascii?Q?gikAHtzBwXJUpvj035X8WaCDnfooSf/qYFG1leLB+fISLM/0XnU59Ul2dklr?=
 =?us-ascii?Q?+gzfkJTR/gy1sKPOHAKGu1Snl6WeUKdjqDr0JPWPFTqcpCvuQ3vtUJI+5LuC?=
 =?us-ascii?Q?lqWfS+cDgg5KY2R48pV5Qd8y8YYBfacAgdlqrC2W?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	TTtdKfwTyoSn++BZ0X+GOyO0Pkbi7y6eraIsVqdvqNmrjDOlkSaxFM3cuneqtlm+auG8TlNRCySC9VYW7qrYFbowljZwDdpSapfjOSatRWKLFE/zviM8le5pcoF9VcTaFY/AXhY3yl/QiWvJ9KL1w9JJcbJ7uTNHKNoEAO6tQJ/xsgB8qtqKFCfMyCI6nQ5UYr8LEHlJq6Swvi8VB0rm/zxxn2rsx/mGUw3XEOEDn3vUqWKElLl5ajAX3n2MGXRBI8Z7jmz2gMMG9iApLWHwqsC6nwgqfqn4raofW8B2yeVxXrXP45wc+CJRzb/ZmI67s0w6iV2hgPKONdoSPwJaATtwwEx0c2FF5SsOBIUdSvQ59rlXBqHWTDQfTQByxboCMMianbGOjBS+11xlzddKKjFg/idCKhNi+73HvBp1sZRQ+0l5jP3U48i8BDMq4h83kUW8L0QVegNGYJvRJOUfaOgplUDHMmZ+Ni4BK0tmvmC4DKYuBySfjkWWTSK71pjhCHeOJ3uoUpZasSx9AS/ABRclwrUXRPsqtnqieQVAv4mngHn4JBPJLloUoLOmvlriXgHigG/ccfxyPE4CmoKXeHNp4P8UiJ5rUjL1jDH7anE=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 33ee18e3-2e0c-465c-8f0b-08dcc7eaa3c4
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2024 05:22:56.6300
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CVuYZMc6eaLYYf4E5y3tgkgBtKuvBfToFldCaBs1kc3Z30d4+iLIrzwBbx3+fgCqrw9eZpl2lgiyahybFaAehg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB7008
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-29_02,2024-08-29_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 mlxlogscore=999 mlxscore=0
 suspectscore=0 malwarescore=0 spamscore=0 adultscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2407110000
 definitions=main-2408290037
X-Proofpoint-GUID: iK17ngHPKlrpHvlXn0kVfgWSdsaZLt6K
X-Proofpoint-ORIG-GUID: iK17ngHPKlrpHvlXn0kVfgWSdsaZLt6K

From: Eugene Loh <eugene.loh@oracle.com>

Ever since speculations were reimplemented, these tests simply were
not testing what they claimed to test.  Among other things:

1)  There is a simple dependence on bufsize that is independent of
speculations.  So speculations have no special role in bufsize tests.

2)  The messages in the print statements were not taxing bufsize.
(A single default string would be enough to exhaust 60 bytes, but
the producer wasn't passing the consumer these strings at all.
The bufsize is being set by the implicit ERROR probe.)

3)  The various size ranges described in the comments do not exist
and were not being tested anyhow.

So remove these tests, and just rely on the other bufsize tests.

To be fair, there seemed to have been no other "negative bufsize"
test, but add a more straightforward such test and add it to where
the other bufsize tests are.

Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
---
 test/unittest/options/err.bufsize-negative.d  | 24 +++++++
 test/unittest/options/err.bufsize-negative.r  |  2 +
 .../speculation/err.BufSizeVariations1.d      | 67 -------------------
 .../speculation/err.BufSizeVariations2.d      | 67 -------------------
 .../speculation/err.NegativeBufSize.d         | 67 -------------------
 .../speculation/err.NegativeBufSize.r         |  2 -
 6 files changed, 26 insertions(+), 203 deletions(-)
 create mode 100644 test/unittest/options/err.bufsize-negative.d
 create mode 100644 test/unittest/options/err.bufsize-negative.r
 delete mode 100644 test/unittest/speculation/err.BufSizeVariations1.d
 delete mode 100644 test/unittest/speculation/err.BufSizeVariations2.d
 delete mode 100644 test/unittest/speculation/err.NegativeBufSize.d
 delete mode 100644 test/unittest/speculation/err.NegativeBufSize.r

diff --git a/test/unittest/options/err.bufsize-negative.d b/test/unittest/options/err.bufsize-negative.d
new file mode 100644
index 00000000..ac194dc8
--- /dev/null
+++ b/test/unittest/options/err.bufsize-negative.d
@@ -0,0 +1,24 @@
+/*
+ * Oracle Linux DTrace.
+ * Copyright (c) 2024, Oracle and/or its affiliates. All rights reserved.
+ * Licensed under the Universal Permissive License v 1.0 as shown at
+ * http://oss.oracle.com/licenses/upl.
+ */
+
+/*
+ * ASSERTION: The -xbufsize option sets the trace buffer size.
+ *
+ * SECTION: Options and Tunables/Consumer Options
+ */
+
+/* @@runtest-opts: -xbufsize=-1 */
+
+BEGIN
+{
+	exit(0);
+}
+
+ERROR
+{
+	exit(1);
+}
diff --git a/test/unittest/options/err.bufsize-negative.r b/test/unittest/options/err.bufsize-negative.r
new file mode 100644
index 00000000..ea3089e9
--- /dev/null
+++ b/test/unittest/options/err.bufsize-negative.r
@@ -0,0 +1,2 @@
+-- @@stderr --
+dtrace: failed to set -x bufsize: Invalid value for specified option
diff --git a/test/unittest/speculation/err.BufSizeVariations1.d b/test/unittest/speculation/err.BufSizeVariations1.d
deleted file mode 100644
index c6e29b78..00000000
--- a/test/unittest/speculation/err.BufSizeVariations1.d
+++ /dev/null
@@ -1,67 +0,0 @@
-/*
- * Oracle Linux DTrace.
- * Copyright (c) 2006, Oracle and/or its affiliates. All rights reserved.
- * Licensed under the Universal Permissive License v 1.0 as shown at
- * http://oss.oracle.com/licenses/upl.
- */
-
-/*
- * ASSERTION:
- * Verify the behavior of variations in bufsize.
- *
- * SECTION: Speculative Tracing/Options and Tuning;
- *	Options and Tunables/bufsize
- *
- * NOTES: This test behaves differently depending on the values
- * assigned to bufsize.
- * 1. 0 > bufsize.
- * 2. 0 == bufsize.
- * 3. 0 < bufsize <= 7
- * 4. 8 <= bufsize <= 31
- * 5. 32 <= bufsize <= 47
- * 6. 48 <= bufsize <= 71
- * 7. 72 <= bufsize
- */
-
-#pragma D option quiet
-#pragma D option bufsize=41
-
-BEGIN
-{
-	self->speculateFlag = 0;
-	self->commitFlag = 0;
-	self->spec = speculation();
-	printf("Speculative buffer ID: %d\n", self->spec);
-}
-
-BEGIN
-{
-	speculate(self->spec);
-	printf("Lots of data\n");
-	printf("Has to be crammed into this buffer\n");
-	printf("Until it overflows\n");
-	printf("And causes flops\n");
-	self->speculateFlag++;
-
-}
-
-BEGIN
-/1 <= self->speculateFlag/
-{
-	commit(self->spec);
-	self->commitFlag++;
-}
-
-BEGIN
-/1 <= self->commitFlag/
-{
-	printf("Statement was executed\n");
-	exit(0);
-}
-
-BEGIN
-/1 > self->commitFlag/
-{
-	printf("Statement wasn't executed\n");
-	exit(1);
-}
diff --git a/test/unittest/speculation/err.BufSizeVariations2.d b/test/unittest/speculation/err.BufSizeVariations2.d
deleted file mode 100644
index 8094cd0b..00000000
--- a/test/unittest/speculation/err.BufSizeVariations2.d
+++ /dev/null
@@ -1,67 +0,0 @@
-/*
- * Oracle Linux DTrace.
- * Copyright (c) 2006, Oracle and/or its affiliates. All rights reserved.
- * Licensed under the Universal Permissive License v 1.0 as shown at
- * http://oss.oracle.com/licenses/upl.
- */
-
-/*
- * ASSERTION:
- * Verify the behavior of variations in bufsize.
- *
- * SECTION: Speculative Tracing/Options and Tuning;
- *	    Options and Tunables/bufsize
- *
- * NOTES: This test behaves differently depending on the values
- * assigned to bufsize.
- * 1. 0 > bufsize.
- * 2. 0 == bufsize.
- * 3. 0 < bufsize <= 7
- * 4. 8 <= bufsize <= 31
- * 5. 32 <= bufsize <= 47
- * 6. 48 <= bufsize <= 71
- * 7. 72 <= bufsize
- */
-
-#pragma D option quiet
-#pragma D option bufsize=4
-
-BEGIN
-{
-	self->speculateFlag = 0;
-	self->commitFlag = 0;
-	self->spec = speculation();
-	printf("Speculative buffer ID: %d\n", self->spec);
-}
-
-BEGIN
-{
-	speculate(self->spec);
-	printf("Lots of data\n");
-	printf("Has to be crammed into this buffer\n");
-	printf("Until it overflows\n");
-	printf("And causes flops\n");
-	self->speculateFlag++;
-
-}
-
-BEGIN
-/1 <= self->speculateFlag/
-{
-	commit(self->spec);
-	self->commitFlag++;
-}
-
-BEGIN
-/1 <= self->commitFlag/
-{
-	printf("Statement was executed\n");
-	exit(0);
-}
-
-BEGIN
-/1 > self->commitFlag/
-{
-	printf("Statement wasn't executed\n");
-	exit(1);
-}
diff --git a/test/unittest/speculation/err.NegativeBufSize.d b/test/unittest/speculation/err.NegativeBufSize.d
deleted file mode 100644
index a0154ccb..00000000
--- a/test/unittest/speculation/err.NegativeBufSize.d
+++ /dev/null
@@ -1,67 +0,0 @@
-/*
- * Oracle Linux DTrace.
- * Copyright (c) 2006, Oracle and/or its affiliates. All rights reserved.
- * Licensed under the Universal Permissive License v 1.0 as shown at
- * http://oss.oracle.com/licenses/upl.
- */
-
-/*
- * ASSERTION:
- * Verify the behavior of variations in bufsize.
- *
- * SECTION: Speculative Tracing/Options and Tuning;
- *	Options and Tunables/bufsize
- *
- * NOTES: This test behaves differently depending on the values
- * assigned to bufsize.
- * 1. 0 > bufsize.
- * 2. 0 == bufsize.
- * 3. 0 < bufsize <= 7
- * 4. 8 <= bufsize <= 31
- * 5. 32 <= bufsize <= 47
- * 6. 48 <= bufsize <= 71
- * 7. 72 <= bufsize
- */
-
-#pragma D option quiet
-#pragma D option bufsize=-72
-
-BEGIN
-{
-	self->speculateFlag = 0;
-	self->commitFlag = 0;
-	self->spec = speculation();
-	printf("Speculative buffer ID: %d\n", self->spec);
-}
-
-BEGIN
-{
-	speculate(self->spec);
-	printf("Lots of data\n");
-	printf("Has to be crammed into this buffer\n");
-	printf("Until it overflows\n");
-	printf("And causes flops\n");
-	self->speculateFlag++;
-
-}
-
-BEGIN
-/1 <= self->speculateFlag/
-{
-	commit(self->spec);
-	self->commitFlag++;
-}
-
-BEGIN
-/1 <= self->commitFlag/
-{
-	printf("Statement was executed\n");
-	exit(0);
-}
-
-BEGIN
-/1 > self->commitFlag/
-{
-	printf("Statement wasn't executed\n");
-	exit(1);
-}
diff --git a/test/unittest/speculation/err.NegativeBufSize.r b/test/unittest/speculation/err.NegativeBufSize.r
deleted file mode 100644
index 9d7be6c0..00000000
--- a/test/unittest/speculation/err.NegativeBufSize.r
+++ /dev/null
@@ -1,2 +0,0 @@
--- @@stderr --
-dtrace: failed to compile script test/unittest/speculation/err.NegativeBufSize.d: line 27: failed to set option 'bufsize' to '-72': Invalid value for specified option
-- 
2.43.5

