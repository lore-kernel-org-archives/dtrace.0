Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B86525F7A5
	for <dtrace@lists.linux.dev>; Wed, 14 Jan 2026 16:34:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768408482; cv=fail; b=mvZIN9mLdVdej5tHWJhc4/k7NeDvFUCbYBpIPE0d+tVs41XbPoMm9umsu3rvNcnK/I76WhhS+b0m90tnKRrUUa9A5XDhzz5Y+2AVd/RbHw2rGs43SrIIBLcINGAAx2ufbxBplAmjRyp4VP/BXCzmSkP12wYswTju8JkxBQOptwU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768408482; c=relaxed/simple;
	bh=x52R2kmnexoEfLVQaERhigoFgGaUSn1Laue6CxiYmbI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=QM9eIgVOTLvQDI29va8eZqDJoS7Y3Q6UkBu54WGm8UmQacVutBBQZn6YC89q+0UxZxMNyS0hoPTZOoboOJoVmMthhJwKuYs3eEXpgSPN5Bmo+Pv7cqF37jlGD/lh4za2jrgxd+uG7sB/7BzQ8wtrZ18H7LdIZKZ1a2fMDUXCbP0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=dPRr5vXZ; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=BG9wsBlU; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="dPRr5vXZ";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="BG9wsBlU"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60E6RQKN1362564
	for <dtrace@lists.linux.dev>; Wed, 14 Jan 2026 16:34:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=I6PC4NbXNe6+xC+vOU
	yaUbd8Fihb4p045PIRArELPrw=; b=dPRr5vXZXZ2ebeIlhwoKVTnqyrPgvhAQiW
	96OIc4r9WtnKQ68hrzGDgW/41jbHSrNDMo6ECQsFGCOuO4jk9FJb9yaFSYan3xJc
	ggGFnFitw4j9SkmP14MB8F6tsVSTJeErCoiAL3Y13biVzda3bfGHpIcfkR9AmOWt
	7DQjC4SPydxnsDdZlXLyiCBB5Dk3MyWG9iTgmTc93hBkde31Braf+Vh4uS99eGbT
	wO0FMKUIFjoQNpDZXNfHhxcrmdc/rCVCOFTAYIODqC+G7yYGjbZYRh3OUgS8MZR/
	pXB6+MIcmhOinlTucncsAXjkQ/avNblgtW4MdWGk4XGJkqyM2nhA==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4bp5vp0st5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 14 Jan 2026 16:34:37 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 60EG45ac034710
	for <dtrace@lists.linux.dev>; Wed, 14 Jan 2026 16:34:36 GMT
Received: from co1pr03cu002.outbound.protection.outlook.com (mail-westus2azon11010022.outbound.protection.outlook.com [52.101.46.22])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4bkd7a8mnd-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 14 Jan 2026 16:34:36 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qD4mDD7w/s9apNPTvqUD/Hulrx1Aevx6MXyBphS/lQRTf756l6GwE1ehUEQ2VQdtFEjImJzAIDBC6WagneGkVuTaTdvfevDjyzxZDFhjO+Wz3Y5a4eYmxZ3I1+7I/P0mMFNrxYz++UYYAl5GrXuxCjbxRAYTYXF6HPnnAHLE31iwIg29s5BVGTtvfMvz09t9SLNLRG5D106AYjmkBhycOU8SPG1McxUCmcVsMTz1rMvS+qLg8QX3wBumAwKp/+cmXxIA2ZdYQjkTDfocCwiK+LZCUdrM1BRxA+89KOSLXRsYhdTSzrFTfc0tTAisXmw849JK4rlkuRdXyYM61C6YeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I6PC4NbXNe6+xC+vOUyaUbd8Fihb4p045PIRArELPrw=;
 b=w9X6lnyx6k6rJpUEhETqRBEKV1+rad+C7Z6w6sky9ktqEx7vw3gNZ77FJrQsIIqPa487Ta/BeJdShV3lsSpadRifNOXYB47kCazhRvrEm8BNjs2Qj74X16XTE+yZ7mXA5U2b6kL84VdCSAuo9FXPMXF9kkB8RRIeXFiu6HvcexxuZ8pnO3ROzSjqVDmTVK4ig/Q8dprhZmvcV2VL44qI/k+NL2bHUB6TaRNTDh6rxagN5kJ++H7OaiPtzFvodQeEeRoN1I5ukZvhM9gsLXa1pn1+uIO0Rzea/z6pcIA/xhoPSmWT8xJYlwDyXS5HVCfXPc/yGDW4HcnDZANRbm3wsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I6PC4NbXNe6+xC+vOUyaUbd8Fihb4p045PIRArELPrw=;
 b=BG9wsBlUFxKVF8YJpe8p3FIufP7kf2dXWWYGE16St4Hd4e55tyu1z+yS2VXLEgih69aoKR9wK6YnPgPFzvslRxlbhE9rrCjAzwNMQ1Hm+m3RyS5iwVD7X2tERiud4/7AmjgVyLhm2jsDQ2Hk/+P6i+FhxAf0yJrBdhyShp03kJ8=
Received: from DS0PR10MB7522.namprd10.prod.outlook.com (2603:10b6:8:15e::16)
 by SN7PR10MB6547.namprd10.prod.outlook.com (2603:10b6:806:2aa::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Wed, 14 Jan
 2026 16:34:31 +0000
Received: from DS0PR10MB7522.namprd10.prod.outlook.com
 ([fe80::9668:955e:1688:ea7a]) by DS0PR10MB7522.namprd10.prod.outlook.com
 ([fe80::9668:955e:1688:ea7a%6]) with mapi id 15.20.9520.005; Wed, 14 Jan 2026
 16:34:31 +0000
Date: Wed, 14 Jan 2026 11:34:28 -0500
From: Kris Van Hees <kris.van.hees@oracle.com>
To: eugene.loh@oracle.com
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [PATCH] Add support for printf formatting with non-monetary
 grouping chars
Message-ID: <aWfFlMk3qXLzo8+9@oracle.com>
References: <20260114050936.14847-1-eugene.loh@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260114050936.14847-1-eugene.loh@oracle.com>
X-ClientProxiedBy: BLAPR05CA0022.namprd05.prod.outlook.com
 (2603:10b6:208:36e::27) To DS0PR10MB7522.namprd10.prod.outlook.com
 (2603:10b6:8:15e::16)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR10MB7522:EE_|SN7PR10MB6547:EE_
X-MS-Office365-Filtering-Correlation-Id: caf45b08-6662-4ab7-393f-08de538acad9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?tDqRXMFZj2RvvZz64/s/Zwc/ZNWNNLU739r0/ehRUcqSlNrghvXzl897f393?=
 =?us-ascii?Q?BOdzsTN7DmHd/5od07341KdM1izgUEpWQXFJ5aDEMrWVnpGDsbn2uCk4FDB0?=
 =?us-ascii?Q?Z5CfZEU9wCq8ikRBiqGhpla2FAXnfTRSj5fTV9C7EMQugY1FdilfApnW0erS?=
 =?us-ascii?Q?xfvcgy0V7M5kLf1TjrTHp/UtXaZM5RfGGoXBx2usI84Ie087ib4Hv7N2HhNC?=
 =?us-ascii?Q?c2AjDjHsxjBYMdmRu1fIGOo3h8NBsxlo3OgZcEG6dBpjnxKFspfwcfs/HjGS?=
 =?us-ascii?Q?NLa/+RYM5+Mc5dxsvxFgqr87/9KnRSnDUFQl43pK2FuHE0i3v19Pcq19gjXn?=
 =?us-ascii?Q?QwTSYBdKvJdqRRzQKcVcOUnobQBOx4z6d+VY9qxLcvQjrbpLn7E0s/vNrsrO?=
 =?us-ascii?Q?JEeAzRsQi+QWlsyZPxhk3jQbB2H/qgtAhzBosrkUM8Jx1qMYrEwTyOyRsBpB?=
 =?us-ascii?Q?ZFubR46TORmjQJoU1FETc21QnvHXNROi2rNQneVotzQRV0idgQeAFHy4QHAM?=
 =?us-ascii?Q?YCoeH1lREnLagmW8d20CdW6jvoE8MiVpClaynZKEJueikPQ0kOqDzHAhmhjY?=
 =?us-ascii?Q?xbIF8wNYZCm8HjR/vyaPEh0MKnF58p2PgrhwXs+nwcD1OP9pOwn6dg9FFLp1?=
 =?us-ascii?Q?0t+XpmKt6EwwM0e6pNjfEYC6LRIKdMc/BSHG5fSBnw3QpkRvLL1+DE4ZRyH6?=
 =?us-ascii?Q?mobJoQgH6jTST+0Ne5otHTciUGqVBi4VsOtHIfpoORkerPv3JCHFfmFDMvBv?=
 =?us-ascii?Q?ZulToqeaAVPmjkPbFsK8ticBOVw0mHVzYzTol55p8skcI+gmGbUgPcC/w6Po?=
 =?us-ascii?Q?N5GsOa+QQd5D5KJwOESkpzjlvucP7hZvGGxMkxsx0Vn4BEwBzGAfuqjwKZw9?=
 =?us-ascii?Q?Vm/zgTc2PkESYDBRUQjb9qIotZom4DGOgJCH00SrFUIxcaF4KAmow9i03wqo?=
 =?us-ascii?Q?5mlIk2zIHllAQ9GeulzVE7ARAVrqSbqT8ZdiKpeQ2MHsctTxR1EFb4ry49Zf?=
 =?us-ascii?Q?hyLt2hqk8LD3/0OWz0nifoB1cLKiHT+uM1Ikua0eOrv+NfeY9iL0YOvS/A6p?=
 =?us-ascii?Q?4DuQR0MZe3vYp65+c+xPdCQtoGqrvurTxtMxMNYfxnmxPh7HFLvXGO4WUGm1?=
 =?us-ascii?Q?Im4TbjtdfWRTAH75rYkbZGzRD6JdunhDkZUAcdyEVtfruZ0lQAo9kDgJazGp?=
 =?us-ascii?Q?owCNaMpJOyP9yqVin5yBAAXQ78TUAcYV40ytR0j5dB1oq13YgBVbn5l6exzY?=
 =?us-ascii?Q?+6Qwdout05VlAiHNqbTTf9XSow37jqcC7x+GYHEhEqYq2k6FyXG0JY2hqv33?=
 =?us-ascii?Q?8y/BK6lEcJiVwNuDA30OZlSbOV6H+csOVVuMwfl/497ehLICaR8FMtrb2TI2?=
 =?us-ascii?Q?+VJxiX/zQWiKFwVpcttwdsVLXkejUSIPA927TJ9yp6ZlhODJD4va4I1rmOVU?=
 =?us-ascii?Q?2D5Apmruxd7ih98Agm4vCb82R0WVAIEXiDwAbj1jKlH51odlPTIApm2UCda2?=
 =?us-ascii?Q?zUbWvyF0WHCN/v3PYMUbnYvffk1gPW1s4xQBTxPkx1l6x4SLVExBu7zPLT+/?=
 =?us-ascii?Q?PlX1hlvMJqQ4LKBzEvQ=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR10MB7522.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?gZ0cyXPG8YyVV6b8ANNa/eeXIqc4moD5TGckl8Ekz5UZq+BfRSgVpTBK/JN4?=
 =?us-ascii?Q?3kxio6uSRfXCsxWU8PAgYj4OJyJQbHtDSPoKO71Q9xC32N85ziVdSCe7dOv4?=
 =?us-ascii?Q?8MEfj3sHMXELTWAJdHCu5ztK879J0VR+QYWI+yD/yl+uOfHTi8M0vlV46arH?=
 =?us-ascii?Q?k949bhwU5UDVAbxGLlx78t7E8lW2Aaj6aTMtxr5CG062Gx8DERMjeaxwH6TP?=
 =?us-ascii?Q?18R0Z+E3yb3IVYTeplF3C4fgOZ0rLTwElYN4y9f3mHoQyGPkdwMs9URMQ+1R?=
 =?us-ascii?Q?1IhNVDkksSQJhWN87XxxFppZTqJN2MlpPASIbQvsHMrEOh0+HX2HWUhcnRX7?=
 =?us-ascii?Q?6Av9t6NDpGMtCoo1DLWqhbUSgv5AYZYoGteLr1zbSei8UfbmC1GxykrviogT?=
 =?us-ascii?Q?sAlqJcTnXYkTC5hlMOuiu3uxsNiEEd5ZUzhZQooRRALTYjeXKNrDO/2F1zhr?=
 =?us-ascii?Q?V39TL2mzb7ahOO4YU7LNhz8yCLz+oUS4GOHLUHv3RmobHGzixSyNzk2IuAR+?=
 =?us-ascii?Q?t76SZezayPtCeTAxxPqNFXh+jZP6GCKknVWjCp/pQHQG/oHjoWyEYZAtphRv?=
 =?us-ascii?Q?ISSgF52vFRm5PjV0LPhKDQQuQX0rwINt6/k6qX3zFdj39UAiYqYpZlyJO8G6?=
 =?us-ascii?Q?OXMA4g+TilkrhrfVeh5RwNk8VC43y62zWjPND/9CzV5cDk2Vk8p6ZlAvcnx4?=
 =?us-ascii?Q?j1LSRcw1clh7tDMhChP7yiMI5v5iwdygrRRERe0hfFAlY9/Zi3KoiwtB7DMS?=
 =?us-ascii?Q?x1ntt0mtOvMltq9VIYRKz3HFSckgJTBJWoUcNIf5UfVJlLgJejJv9x9yJm6x?=
 =?us-ascii?Q?M8l+pJGuM0NGEbXSQP80EQrNsJQTvSii4Gmvz5d3hfuDBGHiLnzocO1MhrXN?=
 =?us-ascii?Q?+CUB/3PerT3XXWKajlBhbnaJye1mizySQIAwRc2oYQMxvs/9FmOTgF8h/WYB?=
 =?us-ascii?Q?ZtuHnpzMmCzyU3p4kF1CSbsbU8Ki3gZOIa0kmxOX7Aq1C1VcgwdRR+04da/K?=
 =?us-ascii?Q?oUJ+na7781C478J3YJOc8j313QH0J2I3dFUkwGEI3tST6nAwmMEued0MmiMA?=
 =?us-ascii?Q?vd1QjbBPNvzD12tMQr0D5nPuJmIyIYVcGesyDQ6H8ToeSzl/aL7b8zHip/Bj?=
 =?us-ascii?Q?q8HjKB4BYcpom1tFgcabG53kUAct8ufkwD3lwfQaR8Fmp4n76xZPhqAeTu8N?=
 =?us-ascii?Q?pu45jhz+1VMPa7Rt6KIpCYeha0gWjLIyayagg/dqW+rBhuiow+K7T+PCtbe3?=
 =?us-ascii?Q?CquYBmcnn3jvwwE6MYPnOZJTupxNMWADW/XPvTVWrM064PAKG/zyU6bBcSAQ?=
 =?us-ascii?Q?zLG+7JwoeCwiZ1yWmMAnNl5qiFUykSdgerNcy2i/urJ1t/iFIcjfj6acf82Q?=
 =?us-ascii?Q?CoZYM/if781zVKqT4UwPIEFRFvjgmCKSbEJxLrhH4vQP5fC++ZceUa0j5Lgb?=
 =?us-ascii?Q?fVmvlQ15I3HOQU6+11o9KbzrPmBUhjqYp8FVQiopypZh3aM1yvLQHmJnd7vo?=
 =?us-ascii?Q?HuqWhg30OhVq1LixOR4+VCuerBtipw9bhF/QjM4hEVg6qrMjmZk+618Rhkk1?=
 =?us-ascii?Q?P4pTf6b1P6KsnKw0Oizb0D+YgQXxek5o6+M+sx2C2hweOxzlNlCsQxdOVh5e?=
 =?us-ascii?Q?+/sGGX7/8QFaIRu5EEN6FAZPWSFZdd00ct8exNinUQnnGZp3VznBNZRo8NXN?=
 =?us-ascii?Q?WvDGNFSmFMiTA6UA/fBOF59it+W/eIxZ/Sz8RgxW/IzSuSEkVoG2C/uu1Pkx?=
 =?us-ascii?Q?V+Gt0jGGAA=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	inLZeAEF4xLgYMeJriwiM0qluNMabIfZMxo+AIqvxOCSvvmQSKTKcP5HECom40dON4vfQ6tjhx6v3VjgYVHwUVf7LhHZN8Lbx+FtuXBXITkAMNWkmMSxv6gL18eUM4iwbUoVMIHg6AlqPgKOFuH9fervvp76d0wgtIUwIeKw8PjHmg+PO6B+8jqWu18Cf3FTAI72bC1aY15DWWbvE7Hh7zTcayO7FwWFNDNmhyiDkYyFp1LAEOlD+BAnH5Pal0T8A77aMsPPcz6QDpwTYVdlj4RtvY4MLcu8QSeHyxTsRhz2OxzNPfGFT6opDo2jBgCEREk+WkS25olLzE7vcfoaVyLTtD4kgWNZrETFPhJsAwy/9LqosKJl3P+DBdRS7wMMRyCdafyFPI/n1aRIOVqqnyLqfNFMTemHkb30wwQmeb0xZ/bDPdcXwFvgTR4NNaUPWUtlK/ZXLRdI9da9Bq6KmFUjpcfl64S/1SoqIOV7pEh4g2JRWqudnwIUtJs8qy0Kz3ZyvOHd/QBWeLllg9urdAFM/AA8ndCpbqoAFjMJkfowET2/hvkuU3HzJaeQ1JxIrNunehKDihI6y6cOXe4O1vDpS7oFU/XT8a/MB2W76WY=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: caf45b08-6662-4ab7-393f-08de538acad9
X-MS-Exchange-CrossTenant-AuthSource: DS0PR10MB7522.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jan 2026 16:34:30.9712
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5fMHo+D9ag5hdlbs+v/3/f1QKCiVeLQhDmSeinx1E3w2oZzO3phMFkxhgJANS65OzParFrl8e8FKWwySlglqDlnSAYM42F2YSIe5mQnvUck=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR10MB6547
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-14_05,2026-01-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 mlxscore=0 suspectscore=0
 mlxlogscore=999 bulkscore=0 malwarescore=0 phishscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2512120000
 definitions=main-2601140139
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE0MDEzOCBTYWx0ZWRfXxW6LfFNzxHVu
 1PHhR7vaCYYqss3dAQeQhoJa3qGJyWphKKAdaGwKJYtpCG7FmMmxz/rAzh8bGomW0u6E74CX/SL
 DTZZituAJwX4/d12oZRmxzmT1A20eC0TaQa8eUMgNDS8uYcUolXBU3Z4SwBlPcdxe5OV2qzzJ05
 WbaZuJX/OXEqdPsyJ7bfUZlo/ou6ccpqsJA1EMFDtKhdl4PrciwjNBgRMyYa7IUetYPRt8CyxIi
 dJt8882sVgtM5T+XTAXc3DrUex/USr4Bj7vLE9ZCz06M8fDv24M4wBIWWdBypttsyZpFJjSQRz3
 x8uo896t8TlEVRRGO+GXvQteI3HzrlWKV/jeBMKlj/xH60CkiuMQxYG5Ggp+ZQnM6RwJLVnzZzv
 LD9NxMqzDrC+61bPVgPmxyGIbIzQbXYc2DJNP/Ua3jeaGo5T/62dKtNO7rpMfzIq6o1NCfrQaH5
 b4ILjrJtZuamtGVlgPg==
X-Proofpoint-GUID: ahRNkehCH0npO9x7K1lrzw9LQKwoFkF-
X-Authority-Analysis: v=2.4 cv=aZtsXBot c=1 sm=1 tr=0 ts=6967c59d b=1 cx=c_pps
 a=WeWmnZmh0fydH62SvGsd2A==:117 a=WeWmnZmh0fydH62SvGsd2A==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=yPCof4ZbAAAA:8 a=nKx4WYB34fKL7F58cb0A:9 a=CjuIK1q_8ugA:10
X-Proofpoint-ORIG-GUID: ahRNkehCH0npO9x7K1lrzw9LQKwoFkF-

I would update the commit summary (one liner) to state that this patch fixes
the non-monetary goruping rather than adding support.  The code was there to
implement it - the only thing we missed was the setlocale() call to ensure
that setting the locale with an env var would actually have an effect.

On Wed, Jan 14, 2026 at 12:09:36AM -0500, eugene.loh@oracle.com wrote:
> From: Eugene Loh <eugene.loh@oracle.com>
> 
> Non-monetary grouping characters are used to separate groups of digits
> in numbers that are not monetary values.  DTrace used to document
> support for printf formatting, using a single quote, for such grouping.
> 
> Add such support.
> 

This is also a bit misleading I think.  Not only does DTrace cocument the
support - the code actually supports it.  Just the setlocale() call was
missing.

I think the commit message should point that out rather than potentially giving
the impression that this patch implements it.

> Orabug: 30430270
> Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
> ---
>  cmd/dtrace.c                         |  5 ++++-
>  test/unittest/printf/tst.grouping.r  |  5 +++++
>  test/unittest/printf/tst.grouping.sh | 29 ++++++++++++++++++++++++++++
>  test/unittest/printf/tst.grouping.x  | 13 +++++++++++++
>  4 files changed, 51 insertions(+), 1 deletion(-)
>  create mode 100644 test/unittest/printf/tst.grouping.r
>  create mode 100755 test/unittest/printf/tst.grouping.sh
>  create mode 100755 test/unittest/printf/tst.grouping.x
> 
> diff --git a/cmd/dtrace.c b/cmd/dtrace.c
> index baa73e9d7..6cd7aeadb 100644
> --- a/cmd/dtrace.c
> +++ b/cmd/dtrace.c
> @@ -1,6 +1,6 @@
>  /*
>   * Oracle Linux DTrace.
> - * Copyright (c) 2006, 2025, Oracle and/or its affiliates. All rights reserved.
> + * Copyright (c) 2006, 2026, Oracle and/or its affiliates. All rights reserved.
>   * Licensed under the Universal Permissive License v 1.0 as shown at
>   * http://oss.oracle.com/licenses/upl.
>   */
> @@ -9,6 +9,7 @@
>  #include <sys/stat.h>
>  #include <sys/wait.h>
>  #include <sys/compiler.h>
> +#include <locale.h>
>  
>  #include <dtrace.h>
>  #include <stdlib.h>
> @@ -924,6 +925,8 @@ main(int argc, char *argv[])
>  	pid_t pid;
>  	struct dtrace_proc *proc;
>  
> +	setlocale(LC_NUMERIC, "");
> +
>  	g_ofp = stdout;
>  
>  	g_pname = basename(argv[0]);
> diff --git a/test/unittest/printf/tst.grouping.r b/test/unittest/printf/tst.grouping.r
> new file mode 100644
> index 000000000..077a0b7f9
> --- /dev/null
> +++ b/test/unittest/printf/tst.grouping.r
> @@ -0,0 +1,5 @@
> +123456789
> +
> +123,456,789
> +
> +success
> diff --git a/test/unittest/printf/tst.grouping.sh b/test/unittest/printf/tst.grouping.sh
> new file mode 100755
> index 000000000..13b953758
> --- /dev/null
> +++ b/test/unittest/printf/tst.grouping.sh
> @@ -0,0 +1,29 @@
> +#!/bin/bash
> +#
> +# Oracle Linux DTrace.
> +# Copyright (c) 2026, Oracle and/or its affiliates. All rights reserved.
> +# Licensed under the Universal Permissive License v 1.0 as shown at
> +# http://oss.oracle.com/licenses/upl.
> +#
> +
> +dtrace=$1
> +
> +for mylocale in C en_US.UTF-8; do
> +	export LC_ALL=$mylocale

Shouldn't you test both LC_ALL and LC_NUMERIC, especially since many sources
seem to suggest that setting LC_ALL is a bad idea, and that people should set
the specific sub-areas they need (since LC_ALL is an override for all and
might have other effects people do not intend).

> +
> +	$dtrace $dt_flags -qs /dev/stdin << EOF
> +	BEGIN
> +	{
> +		printf("%'d\n", 123456789);
> +		exit(0);
> +	}
> +EOF
> +	if [ $? -ne 0 ]; then
> +		echo ERROR: dtrace
> +		locale
> +		exit 1
> +	fi
> +done
> +
> +echo success
> +exit 0
> diff --git a/test/unittest/printf/tst.grouping.x b/test/unittest/printf/tst.grouping.x
> new file mode 100755
> index 000000000..9993fbcd3
> --- /dev/null
> +++ b/test/unittest/printf/tst.grouping.x
> @@ -0,0 +1,13 @@
> +#!/bin/bash
> +#
> +# Oracle Linux DTrace.
> +# Copyright (c) 2026, Oracle and/or its affiliates. All rights reserved.
> +# Licensed under the Universal Permissive License v 1.0 as shown at
> +# http://oss.oracle.com/licenses/upl.
> +
> +if locale -a | grep en_US.utf8 ; then
> +	exit 0
> +fi
> +
> +echo install glibc-langpack-en yum package for this test
> +exit 2
> -- 
> 2.47.3
> 
