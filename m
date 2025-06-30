Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB249246781
	for <dtrace@lists.linux.dev>; Mon, 30 Jun 2025 23:08:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751324887; cv=fail; b=HyctR1v2wY4egI+g2MeeCcXbGXE1jL7uxOuZNin41I8S6tMs5fkNoZ5EQ1hc9fPyn4YvGn3CX5BfRf6mhq4CDMmH1sgaFxev02Cj3UhOtBnDafbxxcOxH+4Rwx9bF/FzGcbFhHa2z2OZd34GmldM/3nZlNin/dTHRp0dBWOJCBg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751324887; c=relaxed/simple;
	bh=v9GASIFgw39kWtHEENAqhP7ToyyZdmJZuqKqiQZ76r8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Ckr7G0KpZPvOHdJlnfCK4opNRVYo0Uwog4YhA2dsRXqt0zp9G0h7/Vq0xu54zPTSKeMtQDK/WLcLaLMSyt+4rDfnblRSSxY5442KIwBsH3vx6PwlhzvCI9Ga3iS63+uZcTlAu2uBvyRRjWiUGvUdk/lwsUY9qe9Ix6fbNxViAV4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=nG3BNNk+; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=mYAt6qf+; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="nG3BNNk+";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="mYAt6qf+"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55UIBh5h006871
	for <dtrace@lists.linux.dev>; Mon, 30 Jun 2025 23:08:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=J87k0xbRKNpGkfdxxT
	wR6AyOlvIuDy6ggRGbKYb8IFY=; b=nG3BNNk+2bzAeAMKd7Sr6EMDj6y1I3eHYI
	bvjSwiZ+Zc17MSESG2kUCLS3dBvSiLVCeQCpsiLV3u0Elx82uRhAGyMjgpWe+0zh
	OAvFU9kyFxnOQpgPN+35LunMnbYyj36WnARReoRUYN353+J/xN7mlp0MlZ4B+w8S
	p7CN1ZF1AZMFPBWHGFifTlpstq1lI+mJpDwc+17JXh+3v60V2S67eAlEHFkEqbRl
	1quA/mie4/6VOJ6bQukbI54eAtlkgApp8f5umPqvUTHFL6B+P6ahVYqMblpU0F7Y
	lJTWeQbcb41ThYJ55izbCbFKUfhoKUOV4Gdh+CqjsCU7QuQPXkrQ==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 47j704bj0p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 30 Jun 2025 23:08:04 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 55UMwtoG009107
	for <dtrace@lists.linux.dev>; Mon, 30 Jun 2025 23:08:03 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12on2062.outbound.protection.outlook.com [40.107.237.62])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 47j6u90jpu-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 30 Jun 2025 23:08:03 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PjtomU+GZUfzFC+Tjzeiow3jMAcVbBqcz3oqddnsAR1q2cJOXLueTwv9LBUF+NidkNwplxWKDjVLO7KAiVpYj1wGfrOoe/p7LJJ7c2uA5wGbjHLZI+sPiFBUkX7vnKa3MHRy2kJIVM93aFGx6xLH05R0NNvT7hdK0Y2QIWihsSQVASS5hhNPWZYnVdFCo6opCabbUlj0yTPqfn8Dwgi24xpPYQb7psAiGM45dMqqgdUsRRmWjsHjID9AXmsmKnpbJ28tmAShIbmKFoJZ0w8i9KImmJotZqNububBh+aKs9UA1x5zpsTftw1uPahULnJli1+pB9L/x/tGOExxOfNL5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J87k0xbRKNpGkfdxxTwR6AyOlvIuDy6ggRGbKYb8IFY=;
 b=CEWBgcEAzBo0DZnIDRWv7OHw8tLO2TpCguHyxiqcnQJKvjBX3Hnde35C8Zo0sslsgaSHrIsXxpDLPufXB+YNL/EF+qqNio5lZnIskQSKIVuwvOkZ0YQJ40L9X0STPe484cxrDg4NzFrzHahfo9OrCn591ffuZscL5MLxrnZYVJrNwzRS9WRGPbU0ipoQTMsUSHJ9ulhG/9XYtR6mG455huNNzDvl/Fhz1wgPWaIQgeSaO0hJI025zqgnyKk7miYSzxL+e39hP9hFcNMcYGXZr82PoBEfO+MOg2ULAyl5/gdaKbKyz3keQmNBpSH1QJSzCAyNveNJW4ZQWvEEI+G13g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J87k0xbRKNpGkfdxxTwR6AyOlvIuDy6ggRGbKYb8IFY=;
 b=mYAt6qf+4bUL4r6dCdcAQyO/P5m9aSiwS82f94yravkmpuf+A1QqtihgZwUxWhxN2ZfGMgwHEWi/oCa5BusSKefb0dqvXKMcJphHZzcgZ9XhoJ6qn4sFnWXYFbdF6FN0A2OLVUmRMZlgBbMIagPEIWLA/Z+Tkspr3rRNWT/PWNU=
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com (2603:10b6:a03:3ef::21)
 by IA1PR10MB5969.namprd10.prod.outlook.com (2603:10b6:208:3ef::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.29; Mon, 30 Jun
 2025 23:08:00 +0000
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b]) by SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b%6]) with mapi id 15.20.8857.026; Mon, 30 Jun 2025
 23:08:00 +0000
Date: Mon, 30 Jun 2025 19:07:56 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Eugene Loh <eugene.loh@oracle.com>
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [DTrace-devel] [PATCH 2/3] usdt parser: handle encoded hyphens
Message-ID: <aGMYzHUs5f30mNnP@oracle.com>
References: <SJ0PR10MB5672B6C002E022B838F4E832C278A@SJ0PR10MB5672.namprd10.prod.outlook.com>
 <2a9a08cf-8261-e09a-abf4-0a3eb0f8db80@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2a9a08cf-8261-e09a-abf4-0a3eb0f8db80@oracle.com>
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
X-MS-TrafficTypeDiagnostic: SJ0PR10MB5672:EE_|IA1PR10MB5969:EE_
X-MS-Office365-Filtering-Correlation-Id: 506f5074-259f-484b-987b-08ddb82af4ff
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?8X7dk5zaD6J9S8+Ljt//mSbct9EalpckC94x8qQeltEFuW4YtpTZfLQ4qamS?=
 =?us-ascii?Q?5gbz6Hv91mi7x03yrHARyMX2dQf61EVJO27/e/EKrnGOSbZCwxZgspKH9K+A?=
 =?us-ascii?Q?VR7f8Shw1jIw/hWGxoUbk9LWQNlcCHMIPsIdhodt1G0k8LDJSmQFRCy8OzZo?=
 =?us-ascii?Q?zxJeI66lFXP3OhhDbXJhYcUyzGbSV6+A806hXR3ULjKMo/Rjz9gbGtdxN1NS?=
 =?us-ascii?Q?viWi48mAaPPANlXJKWDsnM8dz5462wRysVIOpnN/38WPnsM3FBVG7Pnzpf28?=
 =?us-ascii?Q?cEn9JbXs0lOotFPpFwewSKiQVtOYBQXHTaLrlkqaOdxNRWtCogZPua5HAp7/?=
 =?us-ascii?Q?M+3y3nusRrTL4xbZzmLDn/tM2SXZ/Q0JDaj3z2BooEtvdpKmAqG7URN7BKYS?=
 =?us-ascii?Q?8lxK5gmkjoLB39rRWUfjrbqAIiu5RmS1aX94y8pkwM+XF6fr05vDkodUOeEJ?=
 =?us-ascii?Q?99NOxBB3q6XstJR0tITPm4VXYy87gde/1XT9/rHfcwzBaOIgV0W+HfwVzeI8?=
 =?us-ascii?Q?nGk0j7VPhNOx7eELEapRkxPV6LuVQGUfWuJIOvgX5rywc4AiEri8xQ/Wzpu6?=
 =?us-ascii?Q?0+D+QKwLNspgze78VAXzlrEO1bPcvB/YNgAUFKUHmxIpRS8Gm/ig3lYWylwy?=
 =?us-ascii?Q?mbCGxO4Xj0fnfa/ZZqjRAaTmYFkFdfbCrc0+GTIP7cY38naY7J8nJhmtQLxy?=
 =?us-ascii?Q?PM96ReFx2sjH1cs4eYUej+TFUb8K+naExJyx7E+vQDl2g85/Wy3dodFJksaH?=
 =?us-ascii?Q?ZmZEYAEfyozzhMUJcMG41KGx5RI8/2FnoNPHs/DKPlIB3CK6l4gq7bWhZtuc?=
 =?us-ascii?Q?cTDm2KDwiKCNRSwO2rLc4tOxS3EzZyk/+m/B0zQcZo7t1rwuBX5V2MOCICPm?=
 =?us-ascii?Q?PnS0LgRYdZ0UltLBwi1yU2Ltu4ho9EG894pCgaryAE1/uaZaLp77SakoI2yF?=
 =?us-ascii?Q?dCHc1MjzXzKNCb1AfEYTvbKWLC+TXrA9HgiXg12weUGHUGw5hyjlNJ9oU76O?=
 =?us-ascii?Q?+DF9zodj2FrbV94lb+hulpWR000rb3YKO64n05ugWJI4B9e0x0sYOYzXDJOm?=
 =?us-ascii?Q?36TTKupDyiyPEEnyVRBpLejxOL7V7QlWXgRZRwjfLU3gdKoQmYDAkVnUmKP0?=
 =?us-ascii?Q?1KMKZm2z1UdjAZv9aia9y6GJsFadNYtfyTTdbAs1QfQfofrnZvCG4OVvQn/J?=
 =?us-ascii?Q?n5GAoR+Oyr6fgzsRRsGdLjuWbLfQ0vcRuAwZKlBgBuViAVaFAzYfnfosta5x?=
 =?us-ascii?Q?+fN6PTXi9nXRX2mmNW+EWIxb4vuiM7MHE54Nsjacx1h3VFv0Beb+XCpk7gEa?=
 =?us-ascii?Q?j/ruFfs1TsrmOwzbZZlSvoqRUAgwx6S/XwAMf5iYCBA6OlKiwgynEsR1ISja?=
 =?us-ascii?Q?vgeH3xOrQkVRdLnvZCb7/3TI5Pg9THxbnsDDYk8vzXi39S5VU2T7MB9Jyy1L?=
 =?us-ascii?Q?WcyLq4TTeLs=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR10MB5672.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?SQYp4ZtmwWFPbDZvTkTkwgKLZZLxq4xodxTKsOWXcZI3STFwpWwC6/gYdU97?=
 =?us-ascii?Q?J3uXJpfE2zkJYnNXZlidBEJBkd229+u9oVd2Dx4tOTyAf3/IBUivVKcajxGY?=
 =?us-ascii?Q?yN9SjwTK36ckOkftmqej/O4y+nafbCkRod1KgjadPaE49onJ1af0tysInQu5?=
 =?us-ascii?Q?gSq40W9Hwqur4tgKtsFvO/OEIV+RzaGAV3oVHDyJTfXuMVXX5GL8Udyi2bjB?=
 =?us-ascii?Q?LhGHtlW9/K5Yga0tIsw5MRGTc71zHqTbZlYlFHTDYNT1Xl1Ww1pnywFCVjzL?=
 =?us-ascii?Q?5+ci0eWVPmr0arI2aBNpGuha/Goda3gLA3er0EQ0rAySYaRClpzdH+Y0GJNv?=
 =?us-ascii?Q?oFjgG88GxkG/lfJSmuIpfucGgoz72KfTr+JIRocGyUhqCdariN/olIZHwwb5?=
 =?us-ascii?Q?BNfngdh+P9IktDrHRKj4VxXiAeibE7ppx8M8/VoLdY5avr1pxYu4UOGGBIUT?=
 =?us-ascii?Q?crhwssW52XdxSPQ6fT6gcgGT6WnflKnczm3a9BX0d0kH2cM2aVxROEtADFKf?=
 =?us-ascii?Q?cosvCz0GPEBjrpuFr3pGy2n9Ns9plne29+aEQ/jKG6srKg/KAUf+VtQMcJNM?=
 =?us-ascii?Q?7nuG2UdVWMWtOjbrA/4rBYOOxwzg8BJBA9eOR+AW9/fc6pnxeSiXSt/MomqA?=
 =?us-ascii?Q?aOqg+bF4Y7aPovh/TcB9o41zTqy8MZkCS1KIFjW9JMnBMqi0ebEJsHC50Cdz?=
 =?us-ascii?Q?ZcXeXOCs0zSnq1OQI0/4cTHLbDP31mtnw74nVAOUKv0vhV1S8X/3OYyioT8e?=
 =?us-ascii?Q?RtzDc9+DeAt4/kOTMoUwiLvpesdVxWbXUn34z78/JNyctkA9/knDeMenQg/b?=
 =?us-ascii?Q?dZVEcMduYA79jLJLIdC48urBUNWIWU4DpEHjGO+D5nwML7vz4Xm0J4RRN8Z2?=
 =?us-ascii?Q?6RBPnAWdFtnfCjd1Dehvdhxy0cXItkBss2C1wLGJmkG/wKoREJnXXVXyv5qG?=
 =?us-ascii?Q?Xnr+DXKf8K3Qrrph/Le4xSsHfbdgIEio5Ps8ENSazcrHRHF0OkzkYYCqmt9H?=
 =?us-ascii?Q?2FPkHO8TfqOXeTq9hqAiwxoA5x4n+/XJFdcRW2yG+wxGL+fwhYSsZFf1agUB?=
 =?us-ascii?Q?h88ELXZnPCl4sWPnEyXOSxVaozGetmCt359YqNU661by2N6PlEvUOH2ijKfF?=
 =?us-ascii?Q?2YK5dwCbXar5w/K/U+sPVrYqrKCqaijiikpSyUqnflRiKiVONhdwjgTcAVtT?=
 =?us-ascii?Q?mnxQsCntZQ2FV/YKxZLDdtXu6HwGDZuQ3p3kf9xotwaF479tYqPh/L9ipjwr?=
 =?us-ascii?Q?YyCkm59u0CZljTvmcRL8UsOluZq32tLziBZZ1gfgXpBYbVXvbsdu4TwXbaJS?=
 =?us-ascii?Q?Z0t5jmXtwW8Wzktr0oGLvJxWv5JBo5zpnVJv3Cq6jTMzKmKwr0v3zzNvfo/M?=
 =?us-ascii?Q?pB4IiyKDcLZH6Q6f8jQhViW7dJ/+wvaEMp5iwQy/HF8mI4B82RJ/jmt5oEUM?=
 =?us-ascii?Q?EAUxK0cybgJmKNIGo2Hwon8vXmcsEylcnIKIywH617Sf7QHBPCchhsVYPPwa?=
 =?us-ascii?Q?P/et48y0hnku7LC0Oc9KW/WT/Kp3ufdJ1nFsZNVDJgInvmAqOYprOuD537ZF?=
 =?us-ascii?Q?tOfsgwz9F4PD4GGM+ovkq3vXKSBduY4PFZtbR6bjSHYD3ZGj1Fw3sF6Yq+1R?=
 =?us-ascii?Q?UA=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	AspLDc4xm5LdvlRIRbPpQgo5HjbueO773A+TJfwnEH38nGEHsk5ilFvTJYayVzjWt77D4OnzGCtHZpwcD2VKisvHq17V1TGbotCpX9EkiNWnF2KDS0tr5YpG/rxjPsa1ovExuJ/2Vu13di81kaQ5FbtPwJNXoizibVIEfN1nPNU5ouRqZZxPS+Ro6TU+J3g2FR39H2LiOWigGuVyQxr2j8NR9nZKqAK+0ouuhu6to44ElI+Cy9MBhOaHeFIu2zcrg1YYn8YrjSfNGKRnd/u+FNquI/UxorwAIvE7a9dR+p8geKL9D5iy8dkbh4Sa2+Jsf1aB7kJs74B6MhHWB2xK+UFRsHrqrNtNJxqfVvBraXbqrH1HAEuKfEdPyeNdAR2TICmuPt8hNyej9z3yc9jrBo3BmA0OlO7LdB8mB6VQeR86GGVvkOAVRIazzCXOTSkRVxvP0uBh5kQGs2JcR8FVl5fNqhpb6E8w4EBl7+cTR5NwJCxIrI0xMuesH8st6QuX8FS6/WnWqLrbqSOP0t2HR8gwfsc9YK99sI+ju2SHFZKHTd55O3O6btmO7g3PSOmz4FRiLMhTPfp/qgOW2YjLbYvdBWOhIEoo3zog5thgNMI=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 506f5074-259f-484b-987b-08ddb82af4ff
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR10MB5672.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2025 23:08:00.1928
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xsDzb6y+Lcb2kbNQDHoqtA1uIBk9IZwRjx4cLL/EU48xcZeC92HjWfd+u7QmT49C2TMjjZWSHO2+5y6c6vw9D3l/mN81V/p/Cw1O78IiHdM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR10MB5969
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-30_05,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 spamscore=0 suspectscore=0
 phishscore=0 mlxlogscore=999 mlxscore=0 adultscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2506300190
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjMwMDE5MCBTYWx0ZWRfX7LfxNzgGPQfs kMRHCjnVZs1yD1ylGGm/hCdtnbv9Em9AuCWureoJTQPjIk6GrIZ10lJKOa9eZFQF+VBx03PLVFz aO0qZlDfINTbWQsGGTrpYpxX4AykTvSGTYrySmlOSps07Wok3XRnTiUYBBgOukIA1zinavJnmex
 nL88AWU+MbdHj6ydVafUbH9oO3Gh4Cjr5gn/aO+q5b/j+wFJse1uHh0uMmiiUhFc7FcyDxAfnEJ 6KBY0xH+N9WATxy/nzMi3sjivwzijiPoUjE2MBpASKFCp8o3CjMSTkVI7CKaZgiQavApCn/qg1Y wSKZLQyflFAv2+TUz0jGhGKz2v8Y8S8v4hc0WEwMI9efUgLBKM4KQybTBA+JejWLFf96iomiqg+
 aCfLAlsdwVp7X9dCW1pPWrf7ytqO35b8UvuQabrSp9LBlkGLH8OzN7OCuGdPRHTxORnkn1u0
X-Authority-Analysis: v=2.4 cv=LcU86ifi c=1 sm=1 tr=0 ts=686318d4 b=1 cx=c_pps a=e1sVV491RgrpLwSTMOnk8w==:117 a=e1sVV491RgrpLwSTMOnk8w==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=aIz_Co64duF09TpWQkwA:9 a=CjuIK1q_8ugA:10 cc=ntf awl=host:14723
X-Proofpoint-GUID: _OmI2x-cwfSPuyS6TapTM-kOFaokRlQn
X-Proofpoint-ORIG-GUID: _OmI2x-cwfSPuyS6TapTM-kOFaokRlQn

On Mon, Jun 30, 2025 at 05:53:04PM -0400, Eugene Loh via DTrace-devel wrote:
> I would expect a patch like this to have a test to checks the behavior.

It does not need one because we already have one:

test/unittest/usdt/tst.entryreturn.sh

thoug that test does not quite pass yet due to other issues (still xfail).

But that test no longer causes the parser to complain that it cannot find
the probe (and abort).  If you prefer I can certainly add a test for this
bug explicitly, though it essentially be quite similar to this case, but
it would be able to capture whether we encounter the parsing error or not
I think, so possible if preferred.  But the test mentioned above certainly
cannot ever pass without this patch.

> On 6/24/25 17:40, Kris Van Hees via DTrace-devel wrote:
> > Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
> > ---
> >   libcommon/usdt_parser_notes.c | 17 +++++++++++++++++
> >   1 file changed, 17 insertions(+)
> > 
> > diff --git a/libcommon/usdt_parser_notes.c b/libcommon/usdt_parser_notes.c
> > index fb57f119..d3d744fb 100644
> > --- a/libcommon/usdt_parser_notes.c
> > +++ b/libcommon/usdt_parser_notes.c
> > @@ -471,6 +471,23 @@ parse_usdt_note(int out, dof_helper_t *dhp, usdt_data_t *data,
> >   	}
> >   	prbt.off = off;
> > +	/*
> > +	 * If the probe name has encoded hyphens, perform in-place changing
> > +	 * from "__" into "-".
> > +	 */
> > +	if (strstr(prbt.prb, "__") != NULL) {
> > +		char		*q;
> > +		const char	*s = prbt.prb, *e = p;
> > +
> > +		for (q = (char *)s; s < e; s++, q++) {
> > +			if (s[0] == '_' && s[1] == '_') {
> > +				*q = '-';
> > +				s++;
> > +			} else if (s > q)
> > +				*q = *s;
> > +		}
> > +	}
> > +
> >   	if ((prp = dt_htab_lookup(prbmap, &prbt)) == NULL) {
> >   		if ((prp = malloc(sizeof(dt_probe_t))) == NULL) {
> >   			usdt_error(out, ENOMEM, "Failed to allocate probe");
> 
> _______________________________________________
> DTrace-devel mailing list
> DTrace-devel@oss.oracle.com
> https://oss.oracle.com/mailman/listinfo/dtrace-devel
