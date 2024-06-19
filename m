Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A01182495
	for <dtrace@lists.linux.dev>; Wed, 19 Jun 2024 13:15:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718802932; cv=fail; b=XneqHL7JoJOmWt+H3yAhkMoBjpo2+QuzBqCSF9CKnR9E0kK2i5KOINL/U51+sXNKTw6xKuZWas/Avs5eQIqY5cznsT7dFpcRExuTuCqn9OY6MoHbVVmifbA1Y9yhrNYXNMwoTMboWHD0WwcVolt1oBjDatzQCgYRwlDbACbToLo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718802932; c=relaxed/simple;
	bh=VWfr34ykHbrKOZ3U4O7hENn08K9hIC9QBqrmfNTSk68=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:Message-ID:
	 Content-Type:MIME-Version; b=O4ckFWO/q9IX0eYENJcGR78a/8yxGcIGMrMxAXm4z7J/9QhtiAhXT9nI4K470DMFHYGWTwWLRylSZziRQ392AOxSAZNVeu20Z0OlhpUT/JMEF5Ttdp3D8RnPFPcsSR3mcuRUzDDcTrAg3HTTRULasRPHh4Ngwgz0P/E39YYxsdg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=lt/sNox1; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=Q062jvRh; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="lt/sNox1";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="Q062jvRh"
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45J1tT2r031210
	for <dtrace@lists.linux.dev>; Wed, 19 Jun 2024 13:15:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	from:to:cc:subject:references:date:in-reply-to:message-id
	:content-type:mime-version; s=corp-2023-11-20; bh=fl8/cVTLt7KeXQ
	vGsUkSXaKjOYAK6CkC5ZdOIf1ei5U=; b=lt/sNox167mOTXhjG24aTT9I0jxEgu
	yvKidlkVEJReV2weZoh9cjHbviWCSFZEYq9Tq8VGQukbpierFdd0uw9kNxCiyywX
	y155Op9VYPwW4XmTO2VrGVnem6fNhPfx1IOdXIG4b4L1CzKiF768A90jLRCJ7Zjh
	eP0txJSwYgDLi54evqPMQ4girEFqolqn7H2tatHvF2huug4bJ07eSIaCnoCZD23O
	lIVVPN6ul9boIf+q+8IPsa0giyBq+bg04zxAXHn/eQXb1TukewzrBF+PYhXPMcik
	qXx4aYMB7VJL1c+jalEJ16N0uDPpxs01P5B9/aKWtEuMGdjx7zlDuIag==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3yuja017fp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 19 Jun 2024 13:15:29 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 45JCVqST007438
	for <dtrace@lists.linux.dev>; Wed, 19 Jun 2024 13:15:28 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2169.outbound.protection.outlook.com [104.47.57.169])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 3ytp8fvdn0-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 19 Jun 2024 13:15:28 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HkKs8xFnPNRoRwglYAiizvph+PTg1MfR9AYrPMW45fsmkpcIeDiavs+ZUXFPeC3heafekPHDiwro9GJCPyc53ts4z12dF3jJsMFgqKSTeeoo8AZPHgIAwb90ywW4ZOexX8t8uWsBaqR8v/yHFQFoB0urDeEyUquPHUuBgd96q77Xlj8AT7DncWyiuX3JBJgkgamDfDVOrDhOHQhcatb5OawP+k6OreWX7vxjQ1LjkH3cSk9/+ATaP9UwH+9RXQhnnU5aBJUoNX6DTnnDjvivco+t0x4hyx9UcYxRiMqqg1z82hzLOI70mk5IaLeEKLe4aVCVYMv4C0MaWXTX5vA8wA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fl8/cVTLt7KeXQvGsUkSXaKjOYAK6CkC5ZdOIf1ei5U=;
 b=klBwXFZ50ZsrrHwJZYQlab9hDQ2hpkUtnTMz7HoGt25gtJvoAksnu96YFVQ9rhTLdxOVfGiKE6aDA4KEqqGECpr7m1Dwy5mXY1X4RfPD5F5ByQkxs6C6yTnwDY+0DEG//07UKCq+JgVkGfN3mYYyPBPs/DsqQERMuQZNKXGEt7lkakowlXrUfykxtWXSp9Y0MDWAtQufJp2NAM6cvy0KQVhXS8oleoHVRm15wAzuSm+nQP3qbTqL/TSUYGo10K3KL3HzzPpoxAaTPrvzp+P/bvBFgpsf3vCUElAAt07sbHeXEEyl0aDOcyWGZLXbmQFppeXiKOkz/nUpXOjzJN5RDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fl8/cVTLt7KeXQvGsUkSXaKjOYAK6CkC5ZdOIf1ei5U=;
 b=Q062jvRhmHlmAGAYW4cBCjvK6BrXZh1yHP2yrTVHMS/8SHr0d5ngov6Pi+2oiJlaU/Zq+bemQBKYbJrkl+TA78HCwMCp9zhzlu1p2isasbzS2fa066R79DIiEicV5pgxbvhRuROmHqd1ZsSzsu8GpdJpV6hHb4sithQeyh3P36Q=
Received: from MW4PR10MB6608.namprd10.prod.outlook.com (2603:10b6:303:22e::8)
 by BLAPR10MB5091.namprd10.prod.outlook.com (2603:10b6:208:30e::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.31; Wed, 19 Jun
 2024 13:15:25 +0000
Received: from MW4PR10MB6608.namprd10.prod.outlook.com
 ([fe80::b53a:ccc1:c190:c5df]) by MW4PR10MB6608.namprd10.prod.outlook.com
 ([fe80::b53a:ccc1:c190:c5df%6]) with mapi id 15.20.7698.017; Wed, 19 Jun 2024
 13:15:25 +0000
From: Nick Alcock <nick.alcock@oracle.com>
To: Kris Van Hees <kris.van.hees@oracle.com>
Cc: Nick Alcock <nick.alcock@oracle.com>, dtrace@lists.linux.dev,
        dtrace-devel@oss.oracle.com
Subject: Re: [PATCH v2 1/2] translators: support 6.10
References: <20240607184155.316904-1-nick.alcock@oracle.com>
	<ZnJRYDRrlwAsNRr7@oracle.com>
Emacs: if it payed rent for disk space, you'd be rich.
Date: Wed, 19 Jun 2024 14:15:21 +0100
In-Reply-To: <ZnJRYDRrlwAsNRr7@oracle.com> (Kris Van Hees's message of "Tue,
	18 Jun 2024 23:32:48 -0400")
Message-ID: <87cyodaxau.fsf@esperi.org.uk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.3 (gnu/linux)
Content-Type: text/plain
X-ClientProxiedBy: LO4P265CA0208.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:33a::6) To MW4PR10MB6608.namprd10.prod.outlook.com
 (2603:10b6:303:22e::8)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR10MB6608:EE_|BLAPR10MB5091:EE_
X-MS-Office365-Filtering-Correlation-Id: 2726280b-1f9f-4a91-c988-08dc9061e1bf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230037|376011|1800799021|366013;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?EtO0Fv9FZ8GXe6j/5h3gU6MD/v/Htpsp/R2JNBPlfL+2Lhs9S4s+DQnkSFeO?=
 =?us-ascii?Q?02dK0hIXaJ3jDFpgIf9DE+os6EKoDEwyLX0wXv/6NjZ7OaAh2HrQ2D5BeQgu?=
 =?us-ascii?Q?A5/psedYSsZdtYlejMFMRx4CrxcTaKMSbAQWMDpLeLNHRuFw3KJT/huM333E?=
 =?us-ascii?Q?NdM9D82sfquXFzhNQoMkkM+Bn8wE0FyyAi1sV75DcTnyRuRWgMjHwdXEamc+?=
 =?us-ascii?Q?MWfOKAltwA6aql9LMb5hZ1Eg6jUbQqU0jlATzDQEGtxEQBOBrToZR8WdVdHh?=
 =?us-ascii?Q?kwM+P4qVI8G0dt2aONwGKs1GmKx21uhwMIXrQAybcn/NqTeTa1K9DMLrkBry?=
 =?us-ascii?Q?b5FQBK8dL50N3JOHBkTTP9POZPdvXf+YLlQgI20MIycgZAK5jON52Bda4sTS?=
 =?us-ascii?Q?XYbe1ODm3RhHpVkV1pjl2EN6YSHzc5iMQu8exqE6XpD4ZHI0qsSWJDAXMuGF?=
 =?us-ascii?Q?wtSPgPWRhWwmquzO8IGo7b1kg7k5OGifiAcWjLQmtQPqFhRDT7jgOD6sFgso?=
 =?us-ascii?Q?0GN3xgIY2E9r8/5jWi9gREe+ps4/GtdJuJcPiHgsR1But91DfYBTXj2FaWFv?=
 =?us-ascii?Q?INTGEoAF2r20s+l8qM5PyGMeLIRKacEdL0k8rVE12RNRA46nRiU/CB3wMahV?=
 =?us-ascii?Q?GUOdYH/uxvW9nN0GdwXFk5Ch0Af1Xvn7tNTkiWGmaDBdSdbqAAJs9OEaNsTP?=
 =?us-ascii?Q?hcOF1jUST66buoFIHab+2ryyHuX8Sitj61B5EwnKn3H7pfbhhPbHOKb5ZFhI?=
 =?us-ascii?Q?xvbwUYKEpec1I+ealub8FFA100GU89MzjaTpk7KEIxRAJZreqwDgQDJDr7lv?=
 =?us-ascii?Q?wRrqAm7rosoXRYJd6irINCpq54Qg8MSiZqr2Whn6S0VXWgL1w+A/jvDxp0Av?=
 =?us-ascii?Q?H/zSjLPCbohGd7AolbP4MNuH61r+HmtobXGCbvlnKp/Nt4GK5Dl4T/y4Loht?=
 =?us-ascii?Q?sAzQm92E5GW3Ae9M+fAZ7zKj7ZQe3d62OkZRwOYZSuQ8+0pcVC90kqDrCt9L?=
 =?us-ascii?Q?viybOB8GBuKEWmswz8yAuPkafjQTIXxlxllWkJ+VJLMBouxlLNKhJZgvIRVU?=
 =?us-ascii?Q?gIRnGlxXZHb79wlUjesajtTmIJhrzThZahHHS99dIn2eBesuZL0vxjDcCYJE?=
 =?us-ascii?Q?rwFS+LUKsieXKWtXt5gIMZkHyPffyDtJUDWYUwA2PS89j8QBsCTsMmjTFjuQ?=
 =?us-ascii?Q?MjQsM4XTAl2h0M1ighQnDfShctrW2DJ08urg+de+rDNjOKyQ4UsWPFFHXgbL?=
 =?us-ascii?Q?BBSuyMgeEAy1QxyZKTgK9p79GEwROP2PIrQChhBXcyQjyZ2zf/m2NT6YvudQ?=
 =?us-ascii?Q?SJ76ms7/LhYloQQMQcHapzD7?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR10MB6608.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230037)(376011)(1800799021)(366013);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Yy/r//HXim4AXDQjoXPkh8fjqmCBWCIQElz4LqtY1ifshteJ0NM0Ee4ZyvKx?=
 =?us-ascii?Q?7brsBulV/rlEKA4BjsUzyNQ9apAK7Qc/zX3IP1v+Rr0fkQzRZFTjY+iLs5TQ?=
 =?us-ascii?Q?PoJ0Ht6mDi9AtdrF58utXxyP0II7PfoTKGjAP4FKbLc7uydFWpUZZOHDfNAo?=
 =?us-ascii?Q?/9iEESxjP7QD0QpD7583dDZsC/7C/xyXn70IkjZJekwB4olTcNFnMYnIdeSC?=
 =?us-ascii?Q?6nGRZ7FqUGDsQYEsb4VPOo7sA1JMmDilHzH0anQ2QQxcVNpO1JIzDHnaeoz5?=
 =?us-ascii?Q?Lwyu+5CZ+ePG7C1o9wuedWa/BFxoThkSEsPW97Kka0snSjm8/x/oEEyhMCyk?=
 =?us-ascii?Q?sKRbsLlPcYqYP8JVYdT3bTL8iZVYgEqjQQk9KIiDxlQf1qs2sl3G2MbGu9b0?=
 =?us-ascii?Q?o3C4vFDHSdxJ9UtR+LTCuLiksvXLMdm/R9Zp0V3Yz61Ctyr4WMZm/lPE7U9p?=
 =?us-ascii?Q?HP3N/N5VTJyhf/7fW7+m6iATBewMk9l4hBEI6WEctaxqk1LDQaEcCKH1gErn?=
 =?us-ascii?Q?8Ij71Haeto+tKzvJMatbsPsdq/fVjiEdSWyPP/RqRxwNSw/+naczB+VW9kDa?=
 =?us-ascii?Q?LJkiWbWpPMLRyWOXNCI8cCyYT5DWSEYyJTPa4IAyezgmJ5rGktBCMKgbAh3o?=
 =?us-ascii?Q?deST18rafTY/JUaTLJElYPxHC5uDlVy0OQtPyaRqLsFXFtRl1r/Df2EEe/bN?=
 =?us-ascii?Q?szbM1STsVlNl4zsw9kgSMvQ8EPCkgEHl66YTM2jChHxYXuvxRikOGC0lqp4w?=
 =?us-ascii?Q?mPrLWuaN6M7vWBxRVL5Ttjhmp3ZmrRZciM292lgFHugoXicGVKKaxeZxQxjf?=
 =?us-ascii?Q?jBpgauC/7wcZDML4yXLXJCXt7e9qLZQZp4oS4na2GYVihybN9xKv+XocUrf7?=
 =?us-ascii?Q?yu/08R07DA+6F93qJf2xlxH6PecKcLzyYYahN8qGVY8wVE6nmf8CzPUX4qc1?=
 =?us-ascii?Q?0lUUNKFw+2/Td9myZX8KjInl/QbIFGrcPzPBcJ0b7S//afd1/U3EaBWQR+aq?=
 =?us-ascii?Q?B891qR9cIn+jDWxMls5i7FEBXs+jtc8PRokzt0psSK9/oJaJNgWdz5z34V+6?=
 =?us-ascii?Q?BpMb5ZLsVB7s1fx1yAzgPZFqtKcC6EAueNWF28tdnkywmvOJUxM8pVJJWRFG?=
 =?us-ascii?Q?X3pkNUdLkxDfkhkMYdMHTfaLmoPXlDQVaqDqkTUieQPjcscZrU0gweF1aVCx?=
 =?us-ascii?Q?pVIxrMOyGYhovcFOFch7765lDT5EOoeVBYvmnsHsfi/Tl5gczx1fex2gyKCW?=
 =?us-ascii?Q?ivf/nwPbybOrsT1mGp0X2mG+IM+4+Hpqgn0IOQI/QbytDjBoIC4UXMODeFjf?=
 =?us-ascii?Q?qVOzN8HZxjoiCbN6JEss6C7eKPZiTxJI+BpSkWl6okfE/PjhjAtLZeb6bmvD?=
 =?us-ascii?Q?Q9TAO9nCjyTir6hd9SQ5ya7cmiipW6imZvY4SZ5dDVjkeRvhoB/a3O+2CRHN?=
 =?us-ascii?Q?i7dBDemvDih+jHTUBhzjMinoUf9fysh95r1nb4EM5uJmshy0VjfSf7sH4alG?=
 =?us-ascii?Q?zyu4jvtn19T10FdTh6ZLdYFSDqxULgpkNg+j5x8oGF3GGatB/48PbXvJ4nqk?=
 =?us-ascii?Q?9i8xBWBFHaoVe4JISCtL1RusA+RaNOOixfYAoyMhi4zISbdKfAtUYAOfp0wx?=
 =?us-ascii?Q?bA=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	TxS63zObEEVqypqb+uCMvHwJOENTFXUjbqPZrOt/tHeuRLq5Etu3yAouV5mgGYJEXNKqpkZ8ivUVfqmY9OcNxIf93KdeV445oQsmp0RU1RseIemVRdfgxXd8sikXvC4NQHjhKaeF4YNSDYi6KyhQf1xoUv244ED7hc3A/rJ+eanlDM2RkPcFE03YrG4CTL0kMhJjq5cGMxWIouArh8AMDadF9dsJZfaIl9RhGw+UCKKJzlMzDsL6uHSfn6/9If1qpI2wL19UqVWVdk//MSshB+QZUX1RqCpPuJlJ5hyNPl0U0KT+rSmVJsqAlC2LOEHxHff7+Isc5M79Gv9rcnBedBqW+NN1DnonFLTK8mJCMlA+EW4OewrWQ3dpQ76GSj1FQ8Y+aXiQGrEE40cNSVzdu345EbzaSU2dqHp/IpzFhyR49mDt/pHl8bMF1hGuOnOHf/5Ns8JTJF+WEXprSDBLZ8DlkE1m/TdMLZX1Af54eZ7Q13jRf0b8HaKKxN/fNwDzn9y5zt/Y4QCM63Lw1HBGN3wl+HUwolKiAabNpyOZQCaPCqY/CQR2dpA6fneNkCxEjHpRk90eCA66MZaonfhgwcYQDGlRmc9yWRm5pbMhLGU=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2726280b-1f9f-4a91-c988-08dc9061e1bf
X-MS-Exchange-CrossTenant-AuthSource: MW4PR10MB6608.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2024 13:15:25.6263
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: P/unHpGJdhpY2jWtg5u2GnRx3Bd9Bd5txZZI1oQgajwdN1fQRyArF2UsS3iQjbydrvg03yNTWFC4RM2sfCqDsw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR10MB5091
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-19_02,2024-06-19_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 suspectscore=0
 malwarescore=0 mlxlogscore=702 phishscore=0 bulkscore=0 adultscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2405010000 definitions=main-2406190099
X-Proofpoint-ORIG-GUID: Y7bq4xCTexO84s2RWrZv1y2s1LweBdSN
X-Proofpoint-GUID: Y7bq4xCTexO84s2RWrZv1y2s1LweBdSN

On 19 Jun 2024, Kris Van Hees stated:

>> -/* #include <linux/buffer_head.h> */
>> +#include <linux/blk_types.h>
>
> This causing a dlib generation failure because this include is not sufficient:
>
> In file included from /home/kvanhees/linux-uek/arch/x86/include/asm/pgtable_types.h:380,
>                  from /home/kvanhees/linux-uek/arch/x86/include/asm/processor.h:21,
>                  from /home/kvanhees/linux-uek/arch/x86/include/asm/cpufeature.h:5,
>                  from /home/kvanhees/linux-uek/arch/x86/include/asm/thread_info.h:59,
>                  from /home/kvanhees/linux-uek/include/linux/thread_info.h:60,
>                  from /home/kvanhees/linux-uek/include/linux/spinlock.h:60,
>                  from /home/kvanhees/linux-uek/include/linux/wait.h:9,
>                  from /home/kvanhees/linux-uek/include/linux/wait_bit.h:8,
>                  from /home/kvanhees/linux-uek/include/linux/fs.h:6,
>                  from /home/kvanhees/linux-uek/include/linux/highmem.h:5,
>                  from /home/kvanhees/linux-uek/include/linux/bvec.h:10,
>                  from /home/kvanhees/linux-uek/include/linux/blk_types.h:10,
>                  from libdtrace/io.m4:14:
> /home/kvanhees/linux-uek/include/asm-generic/pgtable-nopud.h:18: warning: "PUD_SHIFT" redefined
>    18 | #define PUD_SHIFT       P4D_SHIFT

Not observed on 5.4.17, nor on 5.15.0. What kernel is this with?

> The cause seems to be that you should add an include of linux/kconfig.h prior
> to including linux/blk_types.h.  And in all, including linux/buffer_head.h seems
> to be safer because blk_types.h says it shouldn't be included explicitly except
> to break include loops.

Oops, I didn't look at the header comment because it's usually just a
copyright message :)

It works, but at first sight it's not obvious how linux/buffer_head.h
defines BD_PARTNO: I guess it's doing it transitively via some tangle of
other headers. I guess it's always going to include blk_types.h
*somehow*, so I suppose it's safe.

-- 
NULL && (void)
