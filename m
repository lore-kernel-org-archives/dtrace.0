Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF1681FCFEF
	for <dtrace@lists.linux.dev>; Tue, 16 Sep 2025 01:44:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757987065; cv=fail; b=CFlBSH4lHgwRb0tVgYA9XzJYmrNmjeA7Gtd198ZmGRebPsVvNe6Shd71XICPvd+yarC2zrFS4DSKG5dz2ahMf9ijCSgxmuJEwSBO772gSC87TNpuz1MFSxAT5kG+kC1GqP1IHIOdYTI0/xLpEZaNmaYebmsjqBWAgB60bB1EiR0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757987065; c=relaxed/simple;
	bh=gKCy4iSXE2lYDxfxaTipy0s71NCTMYThUd4/ZUxj70A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=sx15W1q2utxFwPaCGkqx2+bBEDXGlI9ERf6w4HS9pc2Rs1v4pcrvWbY5IB2KrL3wcAvHILg04Nn1/2YYBOg14OpWSpPMeRDKJMVIRK7Kg8d8Nn9yCo3h+M52qtwjwTXFNrxKVVO8brKrGGyzawDPcHbKunybDczC0UAW1PdKPzU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=E8kAoiYa; dkim=fail (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=LpoSJA// reason="signature verification failed"; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="E8kAoiYa";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="LpoSJA//"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58G1gIpS002766
	for <dtrace@lists.linux.dev>; Tue, 16 Sep 2025 01:44:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=NK1ycMvzYiMx6TjGBe/0BJKHuKdWb9ND0/VaKf/uYUs=; b=
	E8kAoiYaLOT3Ykvuyx/H0TOugfEK7WxnM2qyOwH4X0gmFx4FzdV85VyKwI4Mcdd4
	hOz4gBd6qSq68ndMB+pPOUooWJ98Q9o8q6ZyAB2ldQUSdUFfI7xAasTQdm5rlOPZ
	ScftJPlmtpYz17tFZL++xu1Q6+JX3QJzhvoU5J70WuVmbNpdfsUijbs4QzkvFHou
	TMVmpPytqgv8ajSgc7XOL2i8yMZTq9+eFTFbz4NLM4IB6aUkdzXI9O6jdFdOOQBQ
	TMzQly+u2hIAaGkNX0eQTktGsi4uwzE/iMpRYTX1gPXmYNU1PoPekyujKuEJFiK3
	EpGc8Lum6c0zELKhqmNnuA==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 49515v3jt8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 16 Sep 2025 01:44:21 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 58G117sX033739
	for <dtrace@lists.linux.dev>; Tue, 16 Sep 2025 01:44:21 GMT
Received: from sn4pr0501cu005.outbound.protection.outlook.com (mail-southcentralusazon11011050.outbound.protection.outlook.com [40.93.194.50])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 494y2bqtq6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 16 Sep 2025 01:44:21 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tlpiZ366WdHOGBYu69LSazLCecvF5yHHzn1JZWGd1U1mbnRnK/F8FXh05AVATBqHClS5FPPstTuXdTkwN50rIoVRIYP3O27Y9Yqn6YymTPldPQGRzlYZIyE/4VHOePK1KXHLXQ6jWMqMeQGvUqSgfc38TMI7h6hYPGRBFGDv/01S8RvteJlQlN2jbrn5MQd/by3I1oLnczFnzQ4OrSO8IA2cyB3FvLOmQA2TdZSXnfdWc0ewiRgBZf6fNljtA3k+WC5LUoLK2/uZKxNguBVRRYKznJLikPFgBSQGRjoTJx/nvtePNNRE8vqNurbvaq0/F4qwzMbSLA8EHnQFw8mNOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C9+wNk8/TMdwfSvQBLaqxBBOvpyzNZNXTOMJepyBIJI=;
 b=yND4+UGfWehlWr7edCJQV2E+PJObNlR/HAxVHAZpu7E9ADguSa/hNLBkg2gY2ublkE+3wLcsOxbwQa7CnR9QM1D/Nj8UCqdOiuQY+CoqF1MS7WTBvJzUVPZ97ha8puHm4vpo9sGA2+mwv7ruFhkF8tkJJlNZvLvSByy46TrGtNhRpFPG3LqPYNBcbvFcGMk99XhSWmWrwbRaR/xdbNqmwtXxpN3i383oYi3RKEBa7aXh8KNkQatvs8V2lpUvlucb1rtX2JltcR7iS2z6MpcmjXa6PA1FogSUgP/K5stKM+RSOeJiX8qlI2JAx4+EJX93ViXPry77woXQyt+vW/KrAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C9+wNk8/TMdwfSvQBLaqxBBOvpyzNZNXTOMJepyBIJI=;
 b=LpoSJA//W4we9WPLZHYyCqXETVWkYjZLZqghdJij4PZzv6wXYWhsx9ihJmieKy8DgN2llE3OV7trjfQbcYW958HFNJ19rH01j6q5H4OdRmFNj39efwz6eWF6H0dNuKDdM28CAPRQPtDYMzUKnXEgTr0xY4TVZLr5eweuBk2+69E=
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com (2603:10b6:a03:3ef::21)
 by IA1PR10MB6073.namprd10.prod.outlook.com (2603:10b6:208:3af::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.22; Tue, 16 Sep
 2025 01:44:18 +0000
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b]) by SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b%4]) with mapi id 15.20.9115.018; Tue, 16 Sep 2025
 01:44:18 +0000
Date: Mon, 15 Sep 2025 21:44:14 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Eugene Loh <eugene.loh@oracle.com>
Cc: Kris Van Hees <kris.van.hees@oracle.com>, dtrace@lists.linux.dev,
        dtrace-devel@oss.oracle.com
Subject: Re: [DTrace-devel] [PATCH v3] trace: print alloca pointers as actual
 pointer values
Message-ID: <aMjA7o55OLI9cATN@oracle.com>
References: <SJ0PR10MB5672162D698C139186ACCDACC215A@SJ0PR10MB5672.namprd10.prod.outlook.com>
 <487cd783-80c1-e037-0c28-c2ff94364a9d@oracle.com>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <487cd783-80c1-e037-0c28-c2ff94364a9d@oracle.com>
X-ClientProxiedBy: BLAPR05CA0007.namprd05.prod.outlook.com
 (2603:10b6:208:36e::7) To SJ0PR10MB5672.namprd10.prod.outlook.com
 (2603:10b6:a03:3ef::21)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR10MB5672:EE_|IA1PR10MB6073:EE_
X-MS-Office365-Filtering-Correlation-Id: 6d5a3ffd-c69c-42f9-9002-08ddf4c28cbe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?iso-8859-1?Q?XI4KeNc34VyTYl22/5Wa8s8p7quN8AXmk4pfG5xK1X24g0y61fQ3EVcvWT?=
 =?iso-8859-1?Q?vZ/mHa2IDGqMAWwaN/JKs6/BnfyMQqDxrTrUoo0dU3dh3k0Hh9uZtg/7Vo?=
 =?iso-8859-1?Q?7a9WzfA/AGofYywB2/6VPgh8aSweOmisZCiR4zi+WQw17Yf9koqeY3SIB+?=
 =?iso-8859-1?Q?7kXhfE7iCDuDdxqrBf2ju2RmbHxbJW1xOnS+2sYZ4JABq033rdHi9cJfvF?=
 =?iso-8859-1?Q?x6aDD6Vq5wQ3zFxtXmlnG42q7eeTBz8b8lON1Yw10+O+j3xpWss4T/trUz?=
 =?iso-8859-1?Q?WhbcfQyZrofFhXkUu04O5jFTtGoj+wfMnaiECk3b4aiXZn9JjWzpw75Mo2?=
 =?iso-8859-1?Q?nZOcFV+Z56NN4GKMUZnXecc39uZy3ZCG4x5zQxdA2kTA7pqZWBNQolOos+?=
 =?iso-8859-1?Q?W2ocEhwYk4HyZhDYtDALM3hllXZ+xPieEuu5OC5G4GxZs80pwtyrYmQKdL?=
 =?iso-8859-1?Q?erq5HrMz/XfS3cqvUNZYCYDTZv8ODGcapnA2J0+DZfS1ziQcYsPwuFAmJz?=
 =?iso-8859-1?Q?sKlH6tqbOKrMsoXHO6mwpr4p1pyqFhTHaU5Qna1kgOGnnqrtySL82J2F9F?=
 =?iso-8859-1?Q?3155r0q/b/7fC2wrhngIEWIhMyzFklveM3djbnJhPrUlTjrRsSmR30WfK6?=
 =?iso-8859-1?Q?qqxLXiUHRfJS8L02hvZTjl8IW+eZHJVNw1BRfkU16wchw/Z3vCxLzx23lr?=
 =?iso-8859-1?Q?fe3uh6Y/5U4s4ywQlTNaBTtHFEVXj8Oe+EPXe3YhxKpd6TbPhaMHnmB5mp?=
 =?iso-8859-1?Q?PLt2U5CEk4AVhWCKD8a+Qnfd7xGoRcvy975bAor+9L0es+QfSB0g6ktOXK?=
 =?iso-8859-1?Q?AeTUlTSYIKp6XVBG/nal/cjuEp8tz/Zz9ds37BqVMszEMNB8qraODg/y2j?=
 =?iso-8859-1?Q?Sva3BYVDg98lF+QK4H/dYwlnkbN3iVeEkrPCb/9NOqMEeNdDekQMevpiEE?=
 =?iso-8859-1?Q?bn0gDewweQfQ0c8CZ40KnbnjsCVVj2vH7yyKh3QMtNkNxxNhxu8hJgEQLg?=
 =?iso-8859-1?Q?v8zEdWfEjLMNgC3/iL654mNzSM8t5RTowL3NENePHHfma8O/kBK99apDz6?=
 =?iso-8859-1?Q?DEY2ITVYCxWijB0pojvXuww5NtJCXRezhJk1dzMBOP1/TmxCaa1K1OB/ML?=
 =?iso-8859-1?Q?ZN00lt9kG6wUpmB8XiIvtil8X/iLCJ5Uzx0W4A7FzvHKk+vvDH8h6v0Djj?=
 =?iso-8859-1?Q?r3N5a+E8E4yZNj57HQ6eFvL9goltn23h7KE8DUzTZdMv/9MLLMEtuN1o0a?=
 =?iso-8859-1?Q?+qRDsNbD6NufP3dXXaQFaWAxaAobNcl/n8XtWX0Z7HOkMllwJ+2ZYqJZeq?=
 =?iso-8859-1?Q?KjLQy1FIHc+mV4buAV2qmdW+Jk28dwvgC07jMwIvVlkOGpKo/eMK2qqUc5?=
 =?iso-8859-1?Q?YzM5Q7AFg8EhyYRUzyTqyBI/NkGacsSLguafmYVWKo7Iv4fjqILppc4BDq?=
 =?iso-8859-1?Q?V7vDVJV8+Dya+kBg8Zhn1ugDUxiUE63cA9459dsDrBADJPQLa7G6+qiRpQ?=
 =?iso-8859-1?Q?o=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR10MB5672.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?9xDbtGFSKWro0/5t9vmTJacbsXn44vYzKCNV2tOT6M4E8qk4W7+vZeiRFY?=
 =?iso-8859-1?Q?SvgwQ/DiCUtaNREl+C6IYW+JRujXbDQVW3YD5B1VdcMYbwjmNL8XfRc+6/?=
 =?iso-8859-1?Q?2xUa+PdK6feT6Wm2NN4MNuwKEXO0RvBKxjoAh/3gqHDq/c/C7WAym6jO8m?=
 =?iso-8859-1?Q?Sju8jBqzx4uF6gjuTrVOg7Utm087YlAM4VL91h9poL5idegWFoxV2bWiaP?=
 =?iso-8859-1?Q?22C1OuBga4zuvAqXj2WI2Nn8h+xy189I97e8q/R/XmLKF5OdfaIfdLd6BP?=
 =?iso-8859-1?Q?vL0hgl6TTuQl5G3XhL42LZTytjbisxUXXkZb9tEu+T9yvlUym742gOxt9C?=
 =?iso-8859-1?Q?U9Xx72wOsqTs0ei1uCX7ETcc/6Wl46QKT4Sv22d02qRQYHPUb+5cG7RbCU?=
 =?iso-8859-1?Q?Twq0Zw/BitCqAba2puJUQAamhfyYs7u4H2jJwKohxfpb+W5s+CF/xnWz/9?=
 =?iso-8859-1?Q?ivcSytSzNoC7tN/fIjFDQoFBm9VrxuQOybJ1ezmwd888BB95wNeHgnnzqO?=
 =?iso-8859-1?Q?hR4deID9dguC9kNQoDb0YxTpVXgL1sYARMYwBYcCTLWOYeU6oJ8Pp/e8u+?=
 =?iso-8859-1?Q?WpfGDyQuhlBiMFd+HESnU9quSiMoskumcNctd+mD+OevuVvdOSedIVly/V?=
 =?iso-8859-1?Q?iTw2yTMEwYwKu+IeEar8JSaY++IrBZOjcDSGWhX5BgsqsrcjIuxnset4N2?=
 =?iso-8859-1?Q?MHeq4/8p0nFc64llOaQTcoR8o76cdJsDSwEVcNytuxxcyxsE2onV9kKAOj?=
 =?iso-8859-1?Q?r1PIGUhv7ZE0AoLRVG5aiowqjtRXhWUTRf1tO2pqIbtVXXUaTuYQdV7Jwx?=
 =?iso-8859-1?Q?/2KGGXUV181YvQEUBRTpck+dvXLgU9lHybjMx0tATz4s12nrASQWfncfo2?=
 =?iso-8859-1?Q?wcHbNuYxrh5uups3eWjzr8bJziY7NHVgZnr+r6x7TVdv4oDpuVOQzNdoZm?=
 =?iso-8859-1?Q?2Z8UOU82vsee9O4cGhU8oeBDJirYy4jITc1Dpf335QFgpF4z2BUFMaMSUz?=
 =?iso-8859-1?Q?6M8PaaklkLvh3bQdKyLWjr5q7FhK4MFphnlKFDdC1fp8PQF3WEI7Zvdoyc?=
 =?iso-8859-1?Q?yhcSL4BmbCLpZcwVefr2b61PvBnZ+OdXu6Qz0YT5bIJm2rlBuriNSyLZTM?=
 =?iso-8859-1?Q?PQClUGxKf7uwqU/eWeW2zKOzSzJYawkeNooziZoLXal+00J5gbO0pnQBy+?=
 =?iso-8859-1?Q?UzKeQpU0ViWyB0GSawvaJq5eqocu4w3VUno2xxdinW3gk1m85nm3VEMUzD?=
 =?iso-8859-1?Q?qxoHm+a3aVYnhJ8+rVwoSvSAsxtw9ShDl7bJHK3539NnwQe4T1zoO6xdbN?=
 =?iso-8859-1?Q?YCuZd8/PqmYQ+Us92rcYs06yhK2Oe2VNLsWswg0Kg9AZXMpaFwi+kQIOe1?=
 =?iso-8859-1?Q?fhxp8ETCGXOALEwE6JxRNsookgpslCM/th6FqMW4FWiigyTXPYbAS676eW?=
 =?iso-8859-1?Q?RVRrV9uFU99Tl6JtZsshNgKMUR14pOPECOY0FcjGbAtNMMQ4nxNKCn5OoO?=
 =?iso-8859-1?Q?MGfhMTN1VxcdjYO9uwlvihfzeEf89NIQNiyQqolMZj6LjRwEsLFbhEL8F/?=
 =?iso-8859-1?Q?pIj3Bpm2Qa3exkHZPNMOAzcJfr3AhNudH/o+TdlVGRpg8NW6CpmklzA5EP?=
 =?iso-8859-1?Q?2R2LAj9n1AwiML1/DV5LPhuyqmTdYTxCT/Nw6fjrdV7B9lDUlUBIZ19Q?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	NMJx9YxbhmmnIihtIx2c+8bGW+rNP3cAFweCUkb7zais+iq1nl0n7o3tCD/CzkQa//mWk4NEJDJMqfw2D2fepFfuR2ncvsTP4fsSkhJBzdd9ih+srKW/CbJsFghRiTxmPglcwQENmr/xBCeAB1w70udbYz3pcy9xtr6CLtKP8AeQgs95Fyaj3Rav14cM1dgH27IUyAeKQ7HAmQXvNG0QB3nzcnLS9qtWPWihf9+wQfNACCwlo4w2OkzyhwHqBWTJ84H0LiKBsT/MCoo0MOugVqf+9vP8EF6POB7s39GluYR07IkypxkS2xCyABz50hb3y5tbrMtV9HBIKSg/yuvjF/O1TqgkR3JQi0UcAwUe5MBnV7z060E7cdMezEh6mLE9Bh9k67dtFu/voHRHdZbFXm3sG7uLP8ttjOgnhe1tfzH+pkkU9no8HcuZ3LC+j8TIpi7ZBqRa7RN4yvy0Ym40y2OW0CW4sfrCDZq5i57pp51I0gW9mJwow/bNZrDWqtRPnlg/Vg0m2XDtyTRtnCOuIvthQDy0A5Sx+uMcoTl3AAsOIDgKqkyxPIeDY802i81wJRzVQ6C+e6Fm4lr+dS1Y9nsly1w8KHuDG6X+VN3X7yM=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d5a3ffd-c69c-42f9-9002-08ddf4c28cbe
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR10MB5672.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2025 01:44:18.0321
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FYb8W33ioQYpXhNzlCH1grtV7sn+wPjGl912cCg6FCXx1rvhJrLQwrwgMMXiIf4ptzdJlOeGjp68WH/isBxMlJkX/LE2osksdqDxPl96le0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR10MB6073
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-16_01,2025-09-12_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 bulkscore=0 adultscore=0
 mlxlogscore=999 spamscore=0 mlxscore=0 suspectscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2508110000
 definitions=main-2509160015
X-Proofpoint-GUID: 1bkII8Ky-z_lfxuuj3Fg1tIp11MNt77B
X-Authority-Analysis: v=2.4 cv=RtzFLDmK c=1 sm=1 tr=0 ts=68c8c0f6 b=1 cx=c_pps
 a=WeWmnZmh0fydH62SvGsd2A==:117 a=WeWmnZmh0fydH62SvGsd2A==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=yJojWOMRYYMA:10 a=GoEa3M9JfhUA:10 a=iNyAA7dVCqxqn7Epd2IA:9
 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTEzMDAzMyBTYWx0ZWRfXzmYpod7YktpG
 sFlchN2DmKSMOwOFldDrX2qEPnom5RkikUimEIIkDx5+sD6v8TfHhXPpMIvNYgvRzcvxGZpm6S8
 ksb0mKn7XDRTL2N53cKACDxZbmJfeHgJ+QoGNcF/hZvIb3xERJGq/uHMdJpXvHTqy/F1IBGo7hq
 2r+xKp+vGvkLooNKKU215M9y0be0nNF/QPzDHnS/oB0TrxCJbnnC8yqHkWfruwaytVAnhSbQemM
 4kBDdx8u0qAreSEFbUtK3BzByzm6PBkVQu8gzxU1RdLPpMF6ZUPSHvJacrPrub89qUl3RoqJfX7
 vfVfdE4ejPsjtAz14539OlFmcEjjzbd8ndCFYnwOwJ4Q59CvpMA8k7h56Fc4o4MPxRxMW4xGbPa
 imhbV6Bj
X-Proofpoint-ORIG-GUID: 1bkII8Ky-z_lfxuuj3Fg1tIp11MNt77B

On Mon, Sep 15, 2025 at 04:41:43PM -0400, Eugene Loh wrote:
> Largely similar comments to previous versions of this patch:
> 
> On 9/15/25 13:36, Kris Van Hees via DTrace-devel wrote:
> > Because alloca pointers are stored internally as ofssets into the
> 
> The same as for v1 and v2:  s/ofssets/offsets/.

Ok, yes, sorry - been spending time on functionality over typos.

> > scratchmem area, they were printed as small integers.  They are
> > now printed as actual pointer values into kernel space.
> 
> And, again, the patch performs poorly against testing.
> 
> The new test gives me:
>     -OK 1 OK 333 OK 55555
>     +OK 1059965305 OK 1059965637 OK 1060020859
> which is to say that the dereferenced values are wrong.  (They are all the
> correct values plus some offset.)
> 
> And with this patch, these pre-existing tests fail:
>     test/unittest/builtinvar/tst.tid_pid.sh: FAIL: erroneous exitcode (1).
>     test/unittest/funcs/alloca/tst.alloca-bcopy-top.d: FAIL: expected
> results differ.
>     test/unittest/funcs/bcopy/tst.bcopy_arg_order.d: FAIL: expected results
> differ.
>     test/unittest/funcs/copyinto/tst.copyinto_arg_order.d: FAIL: expected
> results differ.

Hm, this is getting frustrating.  Tracking down why I was not seeing those
failures on my end.

> btw...
> 
> > diff --git a/test/unittest/actions/trace/tst.alloca.r.p b/test/unittest/actions/trace/tst.alloca.r.p
> > new file mode 100755
> > @@ -0,0 +1,11 @@
> > +#!/usr/bin/gawk -f
> > +
> > +{
> > +	$1 = $1 > 0x7fffffff ? "OK" : "BAD";
> > +	$3 = $3 > 0x7fffffff ? "OK" : "BAD";
> > +	$5 = $5 > 0x7fffffff ? "OK" : "BAD";
> > +}
> > +
> > +{
> > +	print;
> > +}
> 
> Why are these split over two awk clauses?  Can't they co-exist in the same
> clause?

Yes they can.  But they don't have to.
