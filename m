Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9867F8462
	for <dtrace@lists.linux.dev>; Fri,  3 Oct 2025 04:07:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759464435; cv=fail; b=i56ITCvVy/CWAinCusC8zbGfKCR4MoSoJq/O6wT2Mlp6DL+odEWzqOP5e6SkF4ThzbXuLxF4MhNU8tyLwPsQNqZZ4DEmkXnU3RqeOpNS1tgNBCJNlmuN9VTdcyeFFxSwpkBqve7gs2Yo/mM5w6jSyQUr0u1k6nu/PQXul3+PAVA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759464435; c=relaxed/simple;
	bh=6kOuv4IlnWJMckf8DgG3YU+rRJNRV1AaWScfE85vyg8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=bQrKMXT1UdB7sqsIpUgbtYHDywobskznnzbROLFYKpzRKi92WorLSgmPNPksF7Hcqarw/RoK4JE2a44FfjlkVmWffeV+nd/eqOUo1mbLJ6V0tr9UUd9QURzJxEZQ0BYRGuK1gRF8niS+LWvduXRU5Wwpoj0adQAeU0epjGokiOI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=HljvcUla; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=RAZnjG0A; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="HljvcUla";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="RAZnjG0A"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 592NuWNO028201
	for <dtrace@lists.linux.dev>; Fri, 3 Oct 2025 04:07:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=O/+Rgx26NVXxJ7g1ic
	VtavU+hgZM25WIIYntIifnOwA=; b=HljvcUlaCvozxW2gSvReRsAmVLWBJm7e+q
	zwumujbCqiLzH3wKRody675Mvt1LfNfrtd1HE0k0D+3AYpfH00AwyiPEfRXw+J2A
	ZodVZ5niKsDFBbdqk38JeB/Tgm2t3uFa//RRQY1pNIx5knraUibKOwyNrwiTJSW/
	oIsnN88pQQQ3nkHL7NW2E6Ov7W2rcu07KlO2LVYRzi44DHsyl1qHbtKIGpcSHRRb
	lhOT1N6Yf8DSaDfVS+AbW/8iZLcyIrd0LG5wFx5x7aUV32iZgkQDZqIXmVHbAaeV
	8yp7c+2mDhfKaM+9kHbSRF/hkFTZUCqaaWfLtNdWIIuPPxZonaaA==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 49gmacvgmb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 03 Oct 2025 04:07:11 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 5933e9JY021429
	for <dtrace@lists.linux.dev>; Fri, 3 Oct 2025 04:07:11 GMT
Received: from cy7pr03cu001.outbound.protection.outlook.com (mail-westcentralusazon11010052.outbound.protection.outlook.com [40.93.198.52])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 49hw0yt7gp-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 03 Oct 2025 04:07:10 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=F3m7rO4Tks+JwoOPvbdyVdzRQi2xLQYT0VACtvOJ34/jFtTd8Pn+9E8dMJvo0wTOBGQZqbhz5+otEKKkxET5COF7ApbbVE5GCVJY6Kj5Z6AO2atu5cHu0g9QJcB2WIvQ5XiUNrtCG0VvJ4IKysG3wAwg4jyus6C8AeaMYDO4gMQktvbFNIMAXL+1ARtfLWV2C7ChRoGO/3H+ZVo0pLRDXG5yHxrESl44jbD2B8EYbGRHqGbdX6EmeuzRVLWEZmBJkFWRQqWnIxlGReYd1X9P3TyhuiMXbDN72y7BZB/FzaFQp/HTmzIAAyKt2sOnA1Uap4S81Ze2PSiLAlSguSzYfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O/+Rgx26NVXxJ7g1icVtavU+hgZM25WIIYntIifnOwA=;
 b=d7Bevyh2/AX0YuXMjl5hNfCAlYYkIcfxdMfcsxQP0FNL1JNCY2y/LaX8taGA6JZCmmkcIcezc8apJAeLHFCl2jbNesykU0UNOBG99dbi0N72q4o6XGbsF8fRP+BrcHMJntqOSrMd3FfjlDFtmyDm3AsNgxnWbviCPTgkZ7ldqFhnWF6pKL0l3XO7HzdQ6E31LnrAfFWaLOimkbc9CWoPjT6rADCrmvJCPc5ZyeY1hLFIAWZ7Rz68QKVvCZUv9Bz22kj2aWbodPMb7lFIiTw9tuxfir1sxZff9EDRLGmh8PkrET1InaZHvxQNHFtsiBVlVbslVQQXr5wJv+QX77D/Fg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O/+Rgx26NVXxJ7g1icVtavU+hgZM25WIIYntIifnOwA=;
 b=RAZnjG0A5+GknpaxHjqxqs6X0bfO4h4ZPu0SZ6CofF8XrSwZnzPFjTr/PMDhK1Ucg5gRs8A2dfQ/qQlYBCEbgoubqoGOjZs9I4FYekKBsWS9/4SofcWmTRjxEazDxvCQR4AihE0IaVzesfyiDiAWdCCfRuj7JZMVdT6Nk/xkkHQ=
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com (2603:10b6:a03:3ef::21)
 by BL3PR10MB6091.namprd10.prod.outlook.com (2603:10b6:208:3b7::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.18; Fri, 3 Oct
 2025 04:07:03 +0000
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b]) by SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b%4]) with mapi id 15.20.9160.017; Fri, 3 Oct 2025
 04:07:03 +0000
Date: Fri, 3 Oct 2025 00:07:00 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: eugene.loh@oracle.com
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [PATCH 3/5] test: Fix some ustackdepth tests
Message-ID: <aN9L5MPaovKcMo7+@oracle.com>
References: <20251001062418.6902-1-eugene.loh@oracle.com>
 <20251001062418.6902-3-eugene.loh@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251001062418.6902-3-eugene.loh@oracle.com>
X-ClientProxiedBy: BLAPR05CA0008.namprd05.prod.outlook.com
 (2603:10b6:208:36e::11) To SJ0PR10MB5672.namprd10.prod.outlook.com
 (2603:10b6:a03:3ef::21)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR10MB5672:EE_|BL3PR10MB6091:EE_
X-MS-Office365-Filtering-Correlation-Id: 55ae7d8f-e6ba-424e-c9ad-08de02324f32
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?VE2w1hxFpBHSfxrqEm5wCHs/3q77+S8gxLYBMY4qRKIHMMMTVwjXWmsHO4JJ?=
 =?us-ascii?Q?lIDIU3FmYJ0Nn/9CEBDg2DQrQj5uXzCxuSOyoZqICZzTIbA9L/WPDUciAanv?=
 =?us-ascii?Q?EtG5VMYlv+Eh6vK/oMQYXx4FriPXqP2x35GosUypAW2zqcKdbxbLGr5tqZ92?=
 =?us-ascii?Q?uyfsVRgS645ItypwjSVTdimQkfpVqqej2svQVSJuKiXiy6ji7h2ku+yyyao8?=
 =?us-ascii?Q?RLMbPBtbt61i15snUx/c5GFbm69EZVomA0J6dKOJqHhH4SoONugS5lzMJr+U?=
 =?us-ascii?Q?N3Y6aM4SlWIO7n80ECq96HJ7YABbOaxN68ICB6WzkpIBnkKO+Y5EqS4dzJbJ?=
 =?us-ascii?Q?VhZkh9g99v6juCISRBT9JBzW/qxsCMsziJ72YmekB3BnU9OzX72oIzYN2nWb?=
 =?us-ascii?Q?duCJ9LF9EE1+S6IGn3nIgVKj+lH2N2p8507U0Quw3YHxxPbxXspEepg3Yw/u?=
 =?us-ascii?Q?ZqgR4YMpPKMQzRWqZE/W5Bue0PPRelv6grqhrdulE5o1Fpvyl3onFH61hE+M?=
 =?us-ascii?Q?oDkpiBtbgFptJY2PD5DxzPt5P1btLH3bJdw7NMaBg3tWp9sJ7MhSCA44H/E1?=
 =?us-ascii?Q?ya3Jyb040Yw2bx3ZON635Kgkb7Ep2Jl5pxm+Bjm/nfGIJskUw6SpwF+pQ7TZ?=
 =?us-ascii?Q?cY0zEyTEv1i7aQpQnsQKvzc2cf1ivSQvM6ZGA2LNqRsqSnvLRYc2OABaL51t?=
 =?us-ascii?Q?Oem4xKBugPtM33205AxFPS/237iQYChFj1W0qhpXHGvuRgvaEAzlhhjeNwuK?=
 =?us-ascii?Q?Xjo6HcuSdNx0HI/8xQPLhkqv5tzcdteRTQ/Q/BVcDfX5lXpBSKNJ5QatJd+x?=
 =?us-ascii?Q?K5WqHFcZtOBX6XZZnTcMWJdzA+TsUZBP0D+pJvasWIqeyAdf3RRY+Jc6ve9o?=
 =?us-ascii?Q?0Jh+y5Dxh3ZqHyPNdNmddlYPvX5LYvjVZzmRWVew6sLrbkK0IFOWQcsDC1/f?=
 =?us-ascii?Q?xb3UJLn2WEXHer3YCI8AP6MeNoX/gorhMdNF1Jv9E4xWtXIZ7VP9aGo9Bjqc?=
 =?us-ascii?Q?nAgLGm74YUNGJ4GwFVWSvefPc4rZ8VeDQakR+qiwmd87IW9y8tivGOQBL5nN?=
 =?us-ascii?Q?V+UN+4gILFrEtGA48YqgOBudEMrRIBQHab8UU4mWohTZazR0UN96tVP/xWpI?=
 =?us-ascii?Q?LwVVY0EQCflEwSksDvVTLpQpU06ZEQEA/yDJk/52y91jWlGqKwyXWyPBVJjD?=
 =?us-ascii?Q?w8ho59n3H+0pSIzxEnDuFBnL9lFrH0BhoqGjsuShH3G3qBbYIX2zJhKge/b8?=
 =?us-ascii?Q?1sZikf4LoDQkGtYVQ+jq6f9AYKAJ4jpwfpKm7sEW7hW5ksM8yzSpGXwuzeCO?=
 =?us-ascii?Q?Bke2M+L89lcmWrX1VnOtnGNINoSg3C+beeFT/OG0z0uOAFyxAt8nVDtJKXKY?=
 =?us-ascii?Q?cYYCiCWxu+1Ug3bOwp71TJVvt73DdlCNTTgZHQfciJn/JWeq2Fh4DpQYEY4L?=
 =?us-ascii?Q?JYN8gr+okzAsHufz+GWAnFcHW64VKNg8?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR10MB5672.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?GL+pe0Sx00tJecqyG8YPAfHCAJEjA5+fnpd5nx5wuJgO05u3v35lM65mUnGz?=
 =?us-ascii?Q?sF4KtPSNrVUlr40XxmpW/xBGwAeCseU8e+OP27RDnWsBQiCzcbzzVLJtefCs?=
 =?us-ascii?Q?i2zlZNT4HneCilpMsXvkoF0dG2foVDTHUsp5xlRXEO2ZFmwUp27T8ILQGKX1?=
 =?us-ascii?Q?BGyRQcSEgxKH3uWO+3XTDV2D5YjnUNMJx23XznbKw08xCqKK4CGiX37HmRdK?=
 =?us-ascii?Q?gAxHjNJK6eICyXMz3udyWA2E5Hfpkm55V5jwtXPNM3Qg/zjfXwB5LNMYBeoa?=
 =?us-ascii?Q?ZmL2xYhlqhKq2XQiB4ub6ogCeKqgr+/dqmtrmc5y3hVmQOIIZ6MZraCPiLQY?=
 =?us-ascii?Q?d7Qal08PI7n9Jr6dQi50z1ool5/xgBGOez2kbLxGrrtnqhoCQ2xShHQTdLnO?=
 =?us-ascii?Q?eQ8Mv8mM7QCIVnEyhq3aeBs3+nFqPYxNilJNy2lGky80dbsqK4U1f9zOMbdc?=
 =?us-ascii?Q?MU8tU3Tvaae7ykKk9D7DR8Ny0s9fghoqfa6IqvA2sEZNk5Omg+ddtpeR0mGQ?=
 =?us-ascii?Q?rdn5Sq0L2G8cw4Nucar7Owv0La4C15K0hT3rUgduh3BSWeCBTnAJJ8tJQVe2?=
 =?us-ascii?Q?q+fJpqpxgehypdqnGV/QxjQyWrD5Ko4k2Eatd/kpoCsvMGyltOqL5Rt0zQW8?=
 =?us-ascii?Q?1IzWWdZAeKlJ3LPv0Y0p+32ckXeynfTkV5hcEGl8y0JwjAf0ZJmtjKIqr9gA?=
 =?us-ascii?Q?pHINwyZtf67uFfXsiDaKfJ+NRzMkn1tTfHzHKm8mmG8QFdpdmbPxQisVFHvF?=
 =?us-ascii?Q?nautHybQmwt7kg0dabOhCpthWK1XUgOtU66Az86s8AanQrQlwT68O2QEVzjQ?=
 =?us-ascii?Q?pfTmPqZQwd/PxvDLuk0l70ANpKG+3gpWnUiZCd92zuPWEfBSRxzfD9cmV0aZ?=
 =?us-ascii?Q?Qc9+zKHKaenrh6FJA0KVitaht6UyGFk3cPSdk0fZMGnVZ9LXjgZOtv84dFQV?=
 =?us-ascii?Q?cnJjo4C96zDgPRG3xsyIPt768hihlw0wIlUCbojRFrbVMrGMIjxO9BRmAd5J?=
 =?us-ascii?Q?X4AAuAKXIgWUITRB+dKf9PExTQnGjIF6X3J+jXSlAZAQ7TXf4r+8vTPIPpZp?=
 =?us-ascii?Q?4jSWRwV6hAiLKLD8agxi+bmBSkwipDOvg+krO7ZW/KWjYIFLq1t+kE8Y0ZDc?=
 =?us-ascii?Q?ECHx8n6jjrSuwDwrNa0IHBBWp3CfCHzL99AbY+HtD4tDlwYbooi8rWSjFaGe?=
 =?us-ascii?Q?dOUqxaC4GPGQRrZ0omG8M1GKx6nnQFcI/oGCDjHQVL373nA5cxnWmA6UECqz?=
 =?us-ascii?Q?g89JI3nq5QoiokpELdjRPM1bGPaZyTHsxugu3zXgMmonSFCzfiiule9u7uVw?=
 =?us-ascii?Q?furYoHjH2KGqED3vb2L02ZXIAVguwmEWbm2GjUspyRPFXgdh5vNpAE2SqgBB?=
 =?us-ascii?Q?9rYgbsn1ohcuAgkUABNSeTofTgDeqIXqDpf3HQQVc/rTgm+qQI0yW7Bk2PMV?=
 =?us-ascii?Q?NOl/zhXv8oGoeCczwaLCzJiLEU7/iNlGbe+ECilErMu7AbinLfKZYR5SOSOW?=
 =?us-ascii?Q?LRLDWYt03NQwPKpt0z8Ark9RmPpcNd/9tyPujvWK+4wwTaYP9kJonG+YB39H?=
 =?us-ascii?Q?hIOZ0+uo563TumZHGt7uvvyyKpG4crKh049M0FINIR+WZLi+4qLzgH1zCEIO?=
 =?us-ascii?Q?Pw=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	RkN3LjBVPV/4yeX/8c2IF4tHfC57omB65hKX/EPIy9icWqPYYoTxTzmG/J0xO+eFXJXjPW/pxBxdrvWSXIcWAFOR928/J22PecYoT6eXCo+wOLgP6n/ZA9QP4+y2L8C4yJc3qDV3lX8BsjV4u/tashfsiW8/I4RQUMSdD60Zzt+x1rrGXWBJeA/xRkDWr28VdwXMY4Sl1ZY8IspcNFSw25V2zVkzXGaYMlv0qpuR69XX1CEJ9D2561Z10EFNGZsfFAobyuuV9nifbB9QNDWH7c4L/gFK/bOEzE/bECNvPmyKj5b827oQAZpc0U9TIx8hvIQODzqLEWJzYRKieS8CLNtrfiVeQxCLVP3/BB8cgTTHLS7T/RqFbfq83qV2wTzjq0AC7vaVMQv7ASqZejdRFAgtqTQHLZjqXBOrsxcQVM3EQ7jFXXDSPpsRxOiwEZ2tCkzX41UvLIWQBZ7VkOluYl32ymaGm69aBjMjO79IMJhOKJIXw5Td9PF/0uTCFpthyoz9x8EjuY4blwypsnFl0jRtSSN+PAPlH2rrJv96A8XpJ5L0GciduBhKwYNl0A1VPgCpopKM5q+t+73pgr4c8Fd+sZjMyHuxUbky0eqfc3Y=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 55ae7d8f-e6ba-424e-c9ad-08de02324f32
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR10MB5672.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Oct 2025 04:07:03.4843
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uIEtjNoIlHSNA3mE9tixKJnNf5+oR8DOnTct22dZ2My7pnANNxoKvXEaraUIF9fXa5c92fZPGylT0mT8yiyQ7uQqgnAMxdmYukKtGwaO9x8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR10MB6091
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-03_01,2025-10-02_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 phishscore=0 mlxscore=0
 bulkscore=0 spamscore=0 adultscore=0 mlxlogscore=999 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2509150000
 definitions=main-2510030028
X-Authority-Analysis: v=2.4 cv=P5I3RyAu c=1 sm=1 tr=0 ts=68df4bef cx=c_pps
 a=OOZaFjgC48PWsiFpTAqLcw==:117 a=OOZaFjgC48PWsiFpTAqLcw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=4h95A9A-TG1i0AyfzZgA:9
 a=CjuIK1q_8ugA:10
X-Proofpoint-ORIG-GUID: I-wmeW9qR1XSuedDyLbUcp2S7QJcjBXu
X-Proofpoint-GUID: I-wmeW9qR1XSuedDyLbUcp2S7QJcjBXu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTMwMDE2NSBTYWx0ZWRfX9Qg34su0suSp
 E8NTYaAyG85dZfg3v7srCllqJLL6jp9d9zoHiUD33ayEvH7Q546lWU2AEJ2wmLEpF9sGaYILwgS
 dnM1/Fx0nUjf44RynSrdobzM3Yy2Jm90OHNcGpKFwzHxJdZQ+e5PgAY29nHae7nNWlH5rp9Wz6M
 nfhOIxsLRiLy8JKaalvaVw/kWiLLEnfy3XKuNa/05HOYn/uqDxRYU6DIn3bit8c3hgu6csaAmMi
 XvZFGo43tHVaBhnCbRINrXJE66M2Q4f6D2XjkPAx+7cN0J1q8/RdzYDJWyyt5arn44pSIpX02Mf
 zrpXCrD2JdC+AkeSxpfbqXQQwALf1RzyK/CgNRqGJdn4XRKMXKmeNPl4jysMcoAbGyT/s42OpV0
 PECCRxPx3tMY7fomHvKz4+LVvSoS5g==

On Wed, Oct 01, 2025 at 02:24:16AM -0400, eugene.loh@oracle.com wrote:
> From: Eugene Loh <eugene.loh@oracle.com>
> 
> Fix these issues.
> 
> Issue 1.
> 
> In commit e48bf6a23 ("Add support for built-in variable ustackdepth"),
> tests ustackdepth2 and ustackdepth_big were introduced and their .r and
> .r.p files were links to those of the stackdepth2 test.
> 
> In commit 842eabc0e
> ("test: caller and stackdepth tests for fbt provider"), the stackdepth2
> test was explicitly renamed "fbt" since tests for many providers were
> being introduced.  The links of the earlier patch were not updated.
> 
> Issue 2.
> 
> The ustackdepth_big test modified perf_event_max_stack.  If the test
> were interrupted, the value was not restored.
> 
> Issue 3.
> 
> That ustackdepth_big test only checked that the stackdepth was
> consistent with the reported stack.  While this check is good, it missed
> the point of the test, which is that the system limit could be
> increased.
> 
> Signed-off-by: Eugene Loh <eugene.loh@oracle.com>

Reviewed-by: Kris Van Hees <kris.van.hees@oracle.com>

> ---
>  .../variables/bvar/tst.ustackdepth2.r         |  2 +-
>  .../variables/bvar/tst.ustackdepth2.r.p       |  2 +-
>  .../variables/bvar/tst.ustackdepth_big.r      |  1 -
>  .../variables/bvar/tst.ustackdepth_big.r.p    |  1 -
>  .../variables/bvar/tst.ustackdepth_big.sh     | 34 +++++++++++++++++--
>  5 files changed, 34 insertions(+), 6 deletions(-)
>  mode change 120000 => 100644 test/unittest/variables/bvar/tst.ustackdepth2.r
>  delete mode 120000 test/unittest/variables/bvar/tst.ustackdepth_big.r
>  delete mode 120000 test/unittest/variables/bvar/tst.ustackdepth_big.r.p
> 
> diff --git a/test/unittest/variables/bvar/tst.ustackdepth2.r b/test/unittest/variables/bvar/tst.ustackdepth2.r
> deleted file mode 120000
> index 5cc8498f8..000000000
> --- a/test/unittest/variables/bvar/tst.ustackdepth2.r
> +++ /dev/null
> @@ -1 +0,0 @@
> -tst.stackdepth2.r
> \ No newline at end of file
> diff --git a/test/unittest/variables/bvar/tst.ustackdepth2.r b/test/unittest/variables/bvar/tst.ustackdepth2.r
> new file mode 100644
> index 000000000..3bd29b8ed
> --- /dev/null
> +++ b/test/unittest/variables/bvar/tst.ustackdepth2.r
> @@ -0,0 +1 @@
> +Stack depth OK
> diff --git a/test/unittest/variables/bvar/tst.ustackdepth2.r.p b/test/unittest/variables/bvar/tst.ustackdepth2.r.p
> index 8320b603c..e50f12822 120000
> --- a/test/unittest/variables/bvar/tst.ustackdepth2.r.p
> +++ b/test/unittest/variables/bvar/tst.ustackdepth2.r.p
> @@ -1 +1 @@
> -tst.stackdepth2.r.p
> \ No newline at end of file
> +check_stackdepth_to_stack.awk
> \ No newline at end of file
> diff --git a/test/unittest/variables/bvar/tst.ustackdepth_big.r b/test/unittest/variables/bvar/tst.ustackdepth_big.r
> deleted file mode 120000
> index b6a2d6bcd..000000000
> --- a/test/unittest/variables/bvar/tst.ustackdepth_big.r
> +++ /dev/null
> @@ -1 +0,0 @@
> -tst.ustackdepth2.r
> \ No newline at end of file
> diff --git a/test/unittest/variables/bvar/tst.ustackdepth_big.r.p b/test/unittest/variables/bvar/tst.ustackdepth_big.r.p
> deleted file mode 120000
> index 0e8338907..000000000
> --- a/test/unittest/variables/bvar/tst.ustackdepth_big.r.p
> +++ /dev/null
> @@ -1 +0,0 @@
> -tst.ustackdepth2.r.p
> \ No newline at end of file
> diff --git a/test/unittest/variables/bvar/tst.ustackdepth_big.sh b/test/unittest/variables/bvar/tst.ustackdepth_big.sh
> index 777940ec8..e84850c02 100755
> --- a/test/unittest/variables/bvar/tst.ustackdepth_big.sh
> +++ b/test/unittest/variables/bvar/tst.ustackdepth_big.sh
> @@ -14,11 +14,19 @@
>  
>  dtrace=$1
>  
> +POSTPROC=$PWD/test/unittest/variables/bvar/check_stackdepth_to_stack.awk
> +TRIGGER=$PWD/test/triggers/ustack-tst-bigstack-spin
> +
> +DIRNAME=$tmpdir/ustackdepth_big.$$.$RANDOM
> +mkdir -p $DIRNAME
> +cd $DIRNAME
> +
>  orig_maxstack=`sysctl -n kernel.perf_event_max_stack`
>  echo kernel.perf_event_max_stack was $orig_maxstack
> +trap "sysctl kernel.perf_event_max_stack=$orig_maxstack" QUIT EXIT
>  sysctl kernel.perf_event_max_stack=200
>  
> -$dtrace $dt_flags -c test/triggers/ustack-tst-bigstack-spin -qn '
> +$dtrace $dt_flags -c $TRIGGER -qn '
>  profile-1
>  /pid == $target/
>  {
> @@ -32,7 +40,7 @@ ERROR
>  {
>      exit(1);
>  }
> -'
> +' > D.out
>  if [ $? -ne 0 ]; then
>      echo DTrace failure
>      exit 1
> @@ -41,4 +49,26 @@ fi
>  sleep 2
>  sysctl kernel.perf_event_max_stack=$orig_maxstack
>  
> +$POSTPROC D.out > awk.out
> +if [ $? -ne 0 ]; then
> +    echo post processing failure
> +    exit 1
> +fi
> +
> +if echo "Stack depth OK" | diff -q - awk.out; then
> +    mydepth=`gawk '/DEPTH/ { print $2 }' D.out`
> +    if [ $mydepth -gt $orig_maxstack ]; then
> +        echo success depth $mydepth exceeded original limit $orig_maxstack
> +        exit 0
> +    else
> +        echo ERROR: $mydepth does not exceed original limit $orig_maxstack
> +        cat D.out
> +        exit 1
> +    fi
> +else
> +    echo "ERROR: stack depth does not match stack"
> +    cat D.out
> +    exit 1
> +fi
> +
>  exit 0
> -- 
> 2.47.3
> 
