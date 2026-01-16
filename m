Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F16CB2DCC04
	for <dtrace@lists.linux.dev>; Fri, 16 Jan 2026 22:04:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768601052; cv=fail; b=U3vFnuhsV8gfyeiU1gv8glShZaKp0cF1bSegv0RMTPPzXd9HwVnzp0evaEeVuSc7abjGGvyO/Xby1HSdCVNyaC2n7ETQ3ybRo6RNlN0CQHI6xHriI7LaBsLt4TvtlJjHaOEyhbYPCyXjttOuVegH/N75MY4SPahaFe2imYFuv7I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768601052; c=relaxed/simple;
	bh=ikA/t6tn63Do7D/Xn+ASqGZCin9NOJaZ4IQoXdCvugs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=V7GxbU9eXc+yn+o7NL6w4hhPklssfVqmSlwQKdtsvt8qDpsgLSxaadJ/PD5gVvDkxc8yGv4KVJm/mQBg5U9Agdin8a1Tbtl6c3xMe5C9qbQ/RY9xfqsrsokxZvJs6rLEDmSHxTIJRmq/W9iR5s2hQQwekz4L0mNugHEA4jHHXHI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=HbTSPV9j; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=l5syOO9+; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="HbTSPV9j";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="l5syOO9+"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60GKYr5C3916295
	for <dtrace@lists.linux.dev>; Fri, 16 Jan 2026 22:04:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=LIlhxAE9OQtYlEIUvw
	Jj3QvA0WyjfvmQgfJ/Q0cM+x4=; b=HbTSPV9jiCAgAQkb2npCGOyHHwlrPMCzle
	d61XjzymyopVlXa0cNoeQgc+mX64gS0AFpa/xGZAVj2r2RUM295BfT7is3EiMI98
	lNeOpBLCqQ8sqCRnKVBP1T/6XNZ/PbQVXy8obBGSeFCZuBvipqgvx84rw5B0CbuJ
	sj9K2AvlWvyqGHcAlMY0qXJEB1yGfTQhzgKUjCYZzhYlXWhYBrtIVAvnA+mlYBwZ
	FJko2TS3HNElsLS0Ko20zTZFLs6vuVOZ6rqceovp6YB0PkoiYBQHYZba3eSo9CwW
	3aISPjbovMraCKn3VIJ2JAqS5nwErMVpNSfMAVZisyta7x+AfUQw==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4bqvg4r3n7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 16 Jan 2026 22:04:09 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 60GKFdIl012713
	for <dtrace@lists.linux.dev>; Fri, 16 Jan 2026 22:04:09 GMT
Received: from bn1pr04cu002.outbound.protection.outlook.com (mail-eastus2azon11010039.outbound.protection.outlook.com [52.101.56.39])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4bqv7a35u9-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 16 Jan 2026 22:04:09 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SNQ3RfaAkChDbhEEJc64mSejm+VJh9D34OFtoKd1FNg9aYUw4LFZba0M5SUGDtVopAxGOh7Sz4lPnad1vjdkDzEppzQMrCUZ4xMSyGIU8uBqaLUKCFobc9/qoU6bFadJsGWShjBZUEBhegsNFbW2Kjg1YnaGsXQNwcqBU3mpfmBe2vVfiUL5KXbGLMfYutni3H5wPMD42fY8eMmD1qy4+dyj3KvA7SB3TSLjkuf4WZuUIPTsAPi+eccOUGJzlq8vPlLmHg0AtQci0DBBRNmVOhjmRc+6moMclI50Q7pRfK75jnJRE2pGAp6ePtEeq/zeUdujT21BiJ6ezG8cbHwd5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LIlhxAE9OQtYlEIUvwJj3QvA0WyjfvmQgfJ/Q0cM+x4=;
 b=d0Q8ZYsEUP1mKTAUDOks4fP40z0gGInRg+WAsLSGKydIroACfNZYZJJu5kUWu5yaOum+0rdSnqj0+Ovtc0w2LZnpCppr2qxea4K4b8tccL1N56B5pMkFIVcyl1mBsjUeZ7ER3dBd7bZK6+Dh5wWZbhLP/4tAU7nZ8DPcCa8/n2p/zX0TgZW+anr19ctocI1M6kodl2igdkbjXX/5cQYwukU+fNy8KZZjcROkm8No9Dj43Cw/QilOxfGUKBFo+VbdKKOKSoIp9z5RNY+ZLC0WFvu1FUeImrROsNwLxrV7kV1iO16RYVW0b6Z/8hTrruP7ewXoD/45v+r9lB7XRcIjZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LIlhxAE9OQtYlEIUvwJj3QvA0WyjfvmQgfJ/Q0cM+x4=;
 b=l5syOO9+N4LZICYm9XhjmIUViutQFRAjCL2XnnH0j83cAPKzMxOszzB3qyx27avVJP+hdi/SN36cB0bWN/NbJAhEXX5TDCMezIoXU8ZkckS5w3RzOJHKsWpep8Nm9t04D2hJOfMzc5amTaVPwcKUZA6USbsO00sXeAe5uWuGKFU=
Received: from DS0PR10MB7522.namprd10.prod.outlook.com (2603:10b6:8:15e::16)
 by DS0PR10MB6869.namprd10.prod.outlook.com (2603:10b6:8:136::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.7; Fri, 16 Jan
 2026 22:04:07 +0000
Received: from DS0PR10MB7522.namprd10.prod.outlook.com
 ([fe80::9668:955e:1688:ea7a]) by DS0PR10MB7522.namprd10.prod.outlook.com
 ([fe80::9668:955e:1688:ea7a%6]) with mapi id 15.20.9520.005; Fri, 16 Jan 2026
 22:04:07 +0000
Date: Fri, 16 Jan 2026 17:04:03 -0500
From: Kris Van Hees <kris.van.hees@oracle.com>
To: eugene.loh@oracle.com
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [PATCH] Remove obsolete reference to dt_prov_rawfbt.c
Message-ID: <aWq100-DkyHTJWhv@kvh-deb-bpf.us.oracle.com>
References: <20260116193228.20581-1-eugene.loh@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260116193228.20581-1-eugene.loh@oracle.com>
X-ClientProxiedBy: MN2PR11CA0009.namprd11.prod.outlook.com
 (2603:10b6:208:23b::14) To DS0PR10MB7522.namprd10.prod.outlook.com
 (2603:10b6:8:15e::16)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR10MB7522:EE_|DS0PR10MB6869:EE_
X-MS-Office365-Filtering-Correlation-Id: c025efb8-5c92-4028-dec1-08de554b2b3e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?c3p0CcXW+3DaHmU8mDkNhdU1rcqDyw7SBodoV6zNWQnGW/wXypIPIuIWzndR?=
 =?us-ascii?Q?jhN9T+hLPG1SD+LgUBRhzNlGq//uuF/Ru9BmxycLNt1EIWF8VtZvaELSawFl?=
 =?us-ascii?Q?xi3///6vS4fcmFBMEfY/xGCMgDO8OvQ1fUnO+v8nRF3WcfdLWrJycgKT49sG?=
 =?us-ascii?Q?BKI6ilQ+/4QuQ8XnZtjodYu3E3Qez38W09A/SCRmqlop7nXF1ah9zyUMV2qd?=
 =?us-ascii?Q?GvXxvwnChCjata9DrTJPCYNxuaRVITEybCB+BuL/hddFZDyR4BeR3Y16+Pme?=
 =?us-ascii?Q?uQKTf4pvu1+mz505E3YaKvsMM7Ej0JPYhetKaseA1xZ/U1R/sofJf4xN9e8k?=
 =?us-ascii?Q?qMxuR4TI+/r3J4IoIOdLHOndgSGXOlclxMR0LfjZ96AjQQHiFEyE1wAiGFkX?=
 =?us-ascii?Q?PmLG69lI3dPYBtXORTNfh9sHSAIW/Kto8SSZDykZYh0nV/q837WNAfp5NSUu?=
 =?us-ascii?Q?m4kKJhz3jzEgavMc6jMgl4saHP1cj62wrSARGCSghFUpdVA2/p9J7X6OzUxK?=
 =?us-ascii?Q?XWmfDJHRjBRIcT6N4kJGvsAo2RjD6oqAfD7ru5Yedw9FH+sbHDlepIatu9gE?=
 =?us-ascii?Q?ty9Rj9ubj/+Jc6w212pQ2MRWnlrumBcID4HIz7g9WdbVxGQOyJR6mEOofDpC?=
 =?us-ascii?Q?j6fAxI+lQTpKtbKe+y6sXhwLkZLJA4DUMdpcmop2vycy4jTMrYFgGfkseAzr?=
 =?us-ascii?Q?kGPVbdH1YZ9844zENLvLPiASIsp5pqvSoeu/QPPa5MbD2yaqQt9QmFCgZFB/?=
 =?us-ascii?Q?LiI5QqW6qvBbpwsSwSIEDgTEZHjjA0/P2I5vWkMGF84WeYfHY5tujeTpYo39?=
 =?us-ascii?Q?aatmqh4Ncx79EbjSqtprJDVgAnetyswqh8y8m2az9YocwjDnuPKvwNzlLtwW?=
 =?us-ascii?Q?VEwLVbynZEdJCwXwWXlS5Hz6SNGTWdAwx+Dtf1hrvDW5k74xlAihbHCPicst?=
 =?us-ascii?Q?RTbmKLl3WyjHorAZq34nEKgoQ8Hk1yEIFNNWNBgesTuYIr4IrF5acVcKLwpz?=
 =?us-ascii?Q?uH3Z0vrgr0qVbiSJECLocjqcGWKGkgFE+YFrAS1oh+qcSmu+oCKR3uhV/14H?=
 =?us-ascii?Q?BXDvqA/v/NbyjdFO2D+6pcE/tMcH58E7bnNM78M1GK8bl5tpCM2Z4XMHTgTK?=
 =?us-ascii?Q?Lwfl0SEQ7U5EB9g8p6evF2/E8agk1lAu6KyEjI7fMnkRcLlLUjeRHDDy2M96?=
 =?us-ascii?Q?e1IpUvdOSzaK4k3B8AmKZPePaKkrFsToXY5ATJUm6c0vqNbS57Yf2VcVRNDq?=
 =?us-ascii?Q?p1Qr7Fk1jmSd066ss8iO2wVSl3s4AfqMnNWVH6AYzu1qHzztU8IiOZB8sp3j?=
 =?us-ascii?Q?8LLaZd1A/w9BvSbfQIk9tyBqWQTWBRFysZxCTw3IoEHSj/0XdfI+l7NEOEr8?=
 =?us-ascii?Q?WxL4S6feTekHEeja5wTZ6ypUaFsK0UpKvFpULAGpqi/oi4ZAKTl1qTXp2wVl?=
 =?us-ascii?Q?MlgDs3m87G5mlu95MouhDMJiShemmQXBGn4iR60SzUXeDI+h4sh/aIiWkNR7?=
 =?us-ascii?Q?i4i82ZMnAk03AgsEhFpdroOEhEOTPKy74rTkaSoIeQYyWtgHp5CAPohDpX4h?=
 =?us-ascii?Q?mhKNBQnzZxj6dSfWiQU=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR10MB7522.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?MqyzuDBCNeT730+66e4Tgz8ACKgsI5czxRMhJpG2upRNIVFe2x222ERUFR8c?=
 =?us-ascii?Q?6/+OEduzzbcW8FByaSq3msU3Ojed6KKkLvduJfjOYk5UQDYwqv5rnSZWS6A/?=
 =?us-ascii?Q?Mq9G3DbeooWB+XQJ6orgLYmeagZ+uHZtH7TAE2kWIqOchI58qCKEf9/s88bW?=
 =?us-ascii?Q?EhoretJtUi3U5m3cAE7nlCIYSvbv2smVcLGGqiCwsvDDhCjaJSl7ifOdmCc4?=
 =?us-ascii?Q?0llEs3K+3Vt2D5wlMkT1QPMBppmBpjEq0v71gsattG9QQiCtP5lNdI3OfKvh?=
 =?us-ascii?Q?fguXpNCZN8LTLbgeKHXvrvFkLNhUlxuheqVpe7b6OrjfsI5DnxCmInKw2PjO?=
 =?us-ascii?Q?INIhyaJirv/gTfWhemhR3NYknjGf9v4Uh+Tor+NsTQUxdYWWZZTIdE509lB5?=
 =?us-ascii?Q?/8NsIQvD56lYM9FWo5+HILsavJG1iJB0G+yAw/ZwKavwYsK4qTCvUS5BCwES?=
 =?us-ascii?Q?c6M9uuv758xzY6W/GRJEeo/5e3VFbcwlb6XVdYrFQ/pBLgrOC95k24ulfikA?=
 =?us-ascii?Q?z92t8eZYRNgUnWI2ni49bCaNlcxqANrzvUNYj9A+vgnOoF6qh44IvLEeST+h?=
 =?us-ascii?Q?Zay6bBl+A9VyMjq8gEZq0ANITr7Ubk1sB4pEnTsxA3WlOVnC4U6x7ooJQqB4?=
 =?us-ascii?Q?XXNaFevPwfCg+qa/llSCytrOyjrIZBRVD1VE6V0ZdzUU1J+8J3HqIdHhAqYc?=
 =?us-ascii?Q?BWtVA9oNsY/PZ3f8iv/2srF8ZcNU5UNFrIbDtwORNgGSOn+mY6YN88Wvz4eu?=
 =?us-ascii?Q?fmnRmqB6V3vnZLaLTmP3bRJmq+WUcW8BEOLQ4DSMxU4OHTnZ3T0fkNV15md7?=
 =?us-ascii?Q?3Z3jb8bseVD6cx1AhY+51MxLrjDAgS2KqtZrbQEsC+axcgmluCKD1iexMRCs?=
 =?us-ascii?Q?k3nhag3y6LMbC0OTpJZKxe8dTv62NANCJvmRjtK5wb2St6zkVaMH8kE93eti?=
 =?us-ascii?Q?382DAnhyCe0uHP3j13kd7VuZ5DuzD5SZSOTBjm0MjMfOEv0r4ouEwwBvlI9U?=
 =?us-ascii?Q?m/+TYq88WAWjkMc/0pmvd2QacwfHqY/5k/avGtnTjZwnlHBOGGm3hhRCJ9ts?=
 =?us-ascii?Q?bVPctt4iYUu8i58L3FH9ks6e+N1/EOjIqRI5tbjAr4S9sa0EFFmSK6AU/EFs?=
 =?us-ascii?Q?blTSAeBmIs9TGIAn/Wi29V+6MOw9HIbe4tIYeKfpKYZEnLJLqe54VY17h8up?=
 =?us-ascii?Q?DuubbAn/jRXlpEgSowCvbl+wzy93tQ7hDapcZ0tuEw+4ow8TfodrrGq3Ae/A?=
 =?us-ascii?Q?8ucL5cx4bYcHGlVhvDboI05WMRF9FLhA5mydctfoBhH6Nw2jhLxnMK9wUva2?=
 =?us-ascii?Q?61cVGUFT3IVeCF1RFFKPLHuXRcphs+Bsc4SpJ7lYBGwTTswQhB8DAK6GuV2k?=
 =?us-ascii?Q?VEwHJQ4W/c7tHSEikg5ThLJ89lmr27w9G4Ec4xm2cn8eFulLIisNAhv7bvBg?=
 =?us-ascii?Q?X6rWmbZFJDf7iaVfHOm7SfhWT3umydCm45cRoKLNxVdZM3g0B+FPTVXL484C?=
 =?us-ascii?Q?+oN7QIrP22owMxVsGEehq3YSZRcxjGcfTBSVwM7bgVlROZBa0hT+psr13odU?=
 =?us-ascii?Q?LKuenXziyoBNWvXEf9To4hEDkR2JsYEbiMrhNmQSZWnZcZVZxFK94f2I+ohd?=
 =?us-ascii?Q?6QtLi78xmDLaIZnSihN0E9YnuN+SBVDhMEwxCeKI0XssUwr1QzUvGkSLdlPE?=
 =?us-ascii?Q?q1NnE7Jlcs0r2R0baXzhKcjqE46NuY7Uqj/ylX6q2VDhJgyj5e0dZKhxJQ9p?=
 =?us-ascii?Q?8C/yNeEq9KkhbuTYugcyRozL5neh5PU=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	/YmEYfRtRZVE4nmBsLnjJ9nhsYxdNpF64k6ipTgew2bDCiDMfbdTuAVvz+Kp5MNVkR6qCHK2nj+WsKIFta40KtvYISh5OYwVVQtVUetNWGBsESZ6w8CMsy5had0qLH48CSiN3z8a9rjOZPkGRfuC6W+SAEjqJcyVAWws3CDHrajpe9yPdByiybEO5JFXGPY7EAXfi3U6Hsxmfmlt9DSc9Ei1Wf8XWSpDPzk2LOsPerPo6BMxIGNJzfvItE4H5YEVrAgVtoufg1fZQCoonnlZa+bijUbSUhgFI0Sa31B0n6dLdlheya2vCJRuF6jefBYMJSiaDdn6SwXpjyNAMGFQCqfnNZ2JyBXHCcgMouT00t76Apra9GH5RrMx44jFo7gJI+vbPTUiFSiv0/5uImyaAInrWWRevl3qw7RHg7ethdEUFNz8FNpDVyW/eDtgca3rdjgQvOwS/WiKm4OVcKxcvXt+EtD7HoUpmC1+jpM6aWCxASjl6zGAFWcm8uLOKXL11KR0Z7jNuJ3oWmVgiU9OTaBLxrkLaTR+qo30Hm+lCpuPxCGhRE83guRW5MqA63JhRiZGUjRL1VLfQTl4EbwPHkd+RcUx51VPJN7mqEBbx0I=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c025efb8-5c92-4028-dec1-08de554b2b3e
X-MS-Exchange-CrossTenant-AuthSource: DS0PR10MB7522.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2026 22:04:07.0790
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BnoPKRyQNlCgPU9s/U+FNfoCNkzbeCvGIkqh91J9V1Sonu0ZRwfN9p0/JPvPUecjPb0bDm1OOfF24Q7NZkYLKoQp9F06pfn5IdAtR+tZ+gk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB6869
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-16_08,2026-01-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 mlxlogscore=999
 malwarescore=0 spamscore=0 adultscore=0 mlxscore=0 suspectscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2601150000 definitions=main-2601160167
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE2MDE2NiBTYWx0ZWRfX28gIXkeYdVzW
 YjwvTVL8pLtsNAqnK9jmsFcry18CrpTMJNErFwZeIVsxomms3CG/ybHsofs/I2KOUjjDdWMxy2D
 gOBudrhPvpfajZTl4TiP78/cZ2CD0xDEDpwDDF8AXl4CVWSMboaxS839HvOZ6sPwJ2qh5uV9OMB
 EnODc7lN8PdgpIcuTpXR2NHUArmviKaOvtzf9tcqNYbLCozMVrgScu6a2ycowvDnv/sjZ1gm0jz
 JQozYzIq/vUtVDH/HCrdzxJbLXtz29NPLrnE+dwXxSs85v+Kx2VnQwiR8DR1vRHDwLFo7jyziSF
 OE9tyWwKm6lk9JKy1U+JpyWzWZiMw7rO1jHPHn9KY3UiQvYQFeebzUiBLga4gqXMhV4EGF+8j6A
 FqG6tJnaNmrE+hWS9uWHAEVc5cc6pY5e4MlHRoTZbd6ZjLgZ6GDKFLiwW/UX3NmLUZ0D7ENb5Qp
 mCNNHMqfsEJoB7aCb+/fHEKxkdn4zZJRMzi1nr3Q=
X-Proofpoint-ORIG-GUID: BAx-Qsf-hbkfDyPw0tfi8xJ6HUzOBAIH
X-Proofpoint-GUID: BAx-Qsf-hbkfDyPw0tfi8xJ6HUzOBAIH
X-Authority-Analysis: v=2.4 cv=famgCkQF c=1 sm=1 tr=0 ts=696ab5d9 b=1 cx=c_pps
 a=qoll8+KPOyaMroiJ2sR5sw==:117 a=qoll8+KPOyaMroiJ2sR5sw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=yPCof4ZbAAAA:8 a=wI0BT-AHudYE2s8Lm8MA:9 a=CjuIK1q_8ugA:10 cc=ntf
 awl=host:12110

On Fri, Jan 16, 2026 at 02:32:28PM -0500, eugene.loh@oracle.com wrote:
> From: Eugene Loh <eugene.loh@oracle.com>
> 
> In commit 0b7c5a6327 ("fbt, rawfbt: consolidate code to avoid duplication"),
> the file dt_prov_rawfbt.c was removed.  Remove the remaining reference
> to this file.
> 
> Signed-off-by: Eugene Loh <eugene.loh@oracle.com>

Reviewed-by: Kris Van Hees <kris.van.hees@oracle.com>

> ---
>  libdtrace/Build | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/libdtrace/Build b/libdtrace/Build
> index 90613e9d7..3a6c04664 100644
> --- a/libdtrace/Build
> +++ b/libdtrace/Build
> @@ -1,5 +1,5 @@
>  # Oracle Linux DTrace.
> -# Copyright (c) 2011, 2025, Oracle and/or its affiliates. All rights reserved.
> +# Copyright (c) 2011, 2026, Oracle and/or its affiliates. All rights reserved.
>  # Licensed under the Universal Permissive License v 1.0 as shown at
>  # http://oss.oracle.com/licenses/upl.
>  
> @@ -115,7 +115,6 @@ dt_prov_ip.c_CFLAGS := -Wno-pedantic
>  dt_prov_lockstat.c_CFLAGS := -Wno-pedantic
>  dt_prov_proc.c_CFLAGS := -Wno-pedantic
>  dt_prov_profile.c_CFLAGS := -Wno-pedantic
> -dt_prov_rawfbt.c_CFLAGS := -Wno-pedantic
>  dt_prov_rawtp.c_CFLAGS := -Wno-pedantic
>  dt_prov_sched.c_CFLAGS := -Wno-pedantic
>  dt_prov_sdt.c_CFLAGS := -Wno-pedantic
> -- 
> 2.47.3
> 
