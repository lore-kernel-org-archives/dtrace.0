Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 446821E9067
	for <dtrace@lists.linux.dev>; Wed, 30 Oct 2024 12:13:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730290402; cv=fail; b=T3vU/QGnd4w7+quJSgK/I9HBkb2g5Ql88FwIPkPnfXW4hr+rSyfksPiyeOZReCXpEEQ+eq6yYDNz0CTbfycaLFYsDUE5tW/GiaAvUnOkXgxeoGWVW7w6jO1WL/Mr/VXemOOTC/xUUWMfhp45bTlSeD9tu3TUpAnAQ4VjxvLDCAc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730290402; c=relaxed/simple;
	bh=9MfXijDytb0B8Gcp5mwbk9FnWFlSMJIK8PCqt9SPgxo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=iEv83jT0CrQBX6Z8Ra6pyvFUoZuLxWawysKicyZALeBQ4y8QYw3UIlfRojf73Ds+DGJUNyb2YNpcO2O4BY2sqYPvyhLHbjyUuPAVJZ+q8N+8tjcw6hk2XHcm1qy1bzzNNH4KZofU13+rV8EbvA2GAJBp+1kkh7Rfx8T/J4g7Y/I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=H0JUpIta; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=YZ0jdLj0; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="H0JUpIta";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="YZ0jdLj0"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49U1gXkq010279
	for <dtrace@lists.linux.dev>; Wed, 30 Oct 2024 12:13:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=5iBPzEsPk8ubMtvSEKvxFVBtvTlNLwx2Rw+CO1IpIxo=; b=
	H0JUpItaXJLRNjB4u7IRvYM3mDekJUxjbQb2+VLZnK2gcHtP9DsHZSt6pg657GYK
	JzXTCUtGnAQYCXl25PC9B0623uwg4Zs3I41StJ4K26X0wjbHlmoliyBDLmrKdnZT
	X0xC9ndH+z6tySRjNfA4sFEzGQM4+5mPGKPFfJtYUR4QHF8XCK9FfBqjz/eh0s6/
	KLUHECb5wAGaeMeGdPXhMhUt9TuPunD3661tdPE/H66Opa584G9EqN4Mt4Ez5/O6
	/Wdls8N1bChxeT279LrD9HqsTbWHiHz4gwtzz25CPqrRjdsQU2BfAGD3qg4DuTqm
	witOjOEkIeXlJVdMTs7NqA==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 42grdp7udf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 30 Oct 2024 12:13:16 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 49UAF0Wv040216
	for <dtrace@lists.linux.dev>; Wed, 30 Oct 2024 12:13:15 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2045.outbound.protection.outlook.com [104.47.58.45])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 42hnaqfk1m-4
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 30 Oct 2024 12:13:15 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mqW5b8BF92VUOn9YWyodQmRbhW88Y9VoFJWqedNsRu0USkeqFusphK1XqrdmAM8JMHFAQGKNRb4DUTcNHNNYRvKFHJGw3BYdYQU3BpC+SMdRv3ooMihWhBaw7XlanlS+tsrRLxK3aA+/nhHx05v4VYZ5g+1M99K1sGVjhBVT4xQaGpWqEAHjcFgDReNWncyNkZGLhcvK2NrZoaf9zbbkgIvYx3N62pLHz3/VC8kOMpKcLqe6NdSiqlnCf7TUerNsrWBLLXxRLWxvp53wT3wKfuK1+SbeFHJAYXZ650FASs8XFexQaHZyJhzckhPL0HgtntJ81V4sSv0Yo7PJg2PKtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5iBPzEsPk8ubMtvSEKvxFVBtvTlNLwx2Rw+CO1IpIxo=;
 b=cAvNFe8vJHS94ekzigawS+kGlTlKx3sMG6X3n5kQ1XlhyIaKEKQvKoxBkHFlyly3sVofxd28zwWsJLDRs9KCrtQSZk2WluyMEHVmEFJzCT5Zu+DDmrY3WgWbTbAzTeV/FNGODFMhC//8dZy/wMGwsAdIxfdv1IjF/1Jgz9B3bqzItYmY4Oh9gDKvtV9hBSz+S2CcXWNRV4lMWkOYyQFa20yZzWnGdPXLAB3UGt7Egy57hs5mwDK11iV4EZ/F8VYfpVt7cVqpqvqMwDqkj2/9pV2TkM6Eno0LiFwVz/3MHNaiLhCatiyy9KdGYpGzJTWZOaK2uWQzooEap/sV9gLNKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5iBPzEsPk8ubMtvSEKvxFVBtvTlNLwx2Rw+CO1IpIxo=;
 b=YZ0jdLj0jGpJMcNbLesx2liOH7lq9Arw71LAHtj8eifGWhCXkYGa6Tv/ALz1bXMHVUo67XEXgPz6pGxXswY65zZ8rC4r+LrkqWsH3ty8mUVYEeaxuOIhRcMYRQ+NlrE+J1a9nb7tgcl/rMJfQxZLUm7o4EJgN24H0tWdCJ55BNY=
Received: from DM6PR10MB4091.namprd10.prod.outlook.com (2603:10b6:5:155::28)
 by SJ2PR10MB7111.namprd10.prod.outlook.com (2603:10b6:a03:4c6::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.27; Wed, 30 Oct
 2024 12:13:12 +0000
Received: from DM6PR10MB4091.namprd10.prod.outlook.com
 ([fe80::3b9e:5ef0:46b4:6e02]) by DM6PR10MB4091.namprd10.prod.outlook.com
 ([fe80::3b9e:5ef0:46b4:6e02%7]) with mapi id 15.20.8069.027; Wed, 30 Oct 2024
 12:13:12 +0000
From: Nick Alcock <nick.alcock@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Cc: Kris Van Hees <kris.van.hees@oracle.com>
Subject: [PATCH REVIEWED v3 14/14] man: \fP-ize
Date: Wed, 30 Oct 2024 12:12:36 +0000
Message-ID: <20241030121236.257803-15-nick.alcock@oracle.com>
X-Mailer: git-send-email 2.46.0.278.g36e3a12567
In-Reply-To: <20241030121236.257803-1-nick.alcock@oracle.com>
References: <20241030121236.257803-1-nick.alcock@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO0P123CA0012.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:354::20) To DM6PR10MB4091.namprd10.prod.outlook.com
 (2603:10b6:5:155::28)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR10MB4091:EE_|SJ2PR10MB7111:EE_
X-MS-Office365-Filtering-Correlation-Id: 5175c254-2ce7-4fe7-0725-08dcf8dc3970
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|10070799003|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?xTfRljlXcLCjNeSOP8iJFfbmwBFR4GwwPmQqjvdzf/PebbQXf7SIlOXliGRR?=
 =?us-ascii?Q?p0LP5/0/HAuI5uoYNaqI0B/ZQ3PcL9Zf3EbCPYPfglIVM5GsJA8Oqw633gtm?=
 =?us-ascii?Q?LR6htDV1+GerpRlNWe8IxRa+x/jtdejF7LIZi4C1YvbCUXskKc6OsG9I4t8P?=
 =?us-ascii?Q?xULm4EnWOwkqKKt9JtmkCY/9SjWiKB2MgUVqUgZZ02ouTV2JO1FR121GrNjD?=
 =?us-ascii?Q?aWCbiMBLDDrrFm0sIOoayyBYKuQeqFK9GIJbRiLMDJGAjqO5uiFRzSzq8mP2?=
 =?us-ascii?Q?nuOqY50I4qCeDOP8Hq4alZWwr34dwLHh0l3GGrAErxkVVmwRXe4Z4ctXecit?=
 =?us-ascii?Q?3EXqCtgIxJysGeUaPS6/YDycFxtJD+VDj+A41cRoBQGQ/eNqFoTU3HDjrTqF?=
 =?us-ascii?Q?IVCIk1tuMNWmmtqsTBJPnYmLAXcYwnv3la6IUEnIRD/jAln2KNhO/qAceNHq?=
 =?us-ascii?Q?hqvzmch0xJJ4FDH/VPudIW3myOQ1Tg7CR5Lmd5pT4npALB/9I5+lJ6Kz6NJW?=
 =?us-ascii?Q?7X4tr05H0ttFF0sCyLCfzxlkTzZMPO/Vml74/gBWwautELrGJP5dd7KeGcRO?=
 =?us-ascii?Q?nct5UqwH/+e2UtIgGbpyemOkpju15t3GVEHl43eIdTZvVbSPIn8cVY9DTd+M?=
 =?us-ascii?Q?L0DU0KQBOxxlacBzjyQjxsHXCVmtLSRar9tBXuWqvuy8RIJm0hOxSvLlqL5m?=
 =?us-ascii?Q?B0k2Zez5J3hUCG63FcHQhJdl6m02WnSwin2L5UWewqZzgid5eCpyjqLG0yol?=
 =?us-ascii?Q?BSesecNI5Fzm8G0QHbzU8T9rWxoqmQOtlOKCBJtxjSLrH7gI9KRIGy+dRvDK?=
 =?us-ascii?Q?mQSQxMruSWMVNF1jdL7oRwbv+UQj0jiDPjNx98wgnoQSEqtKP4oDKgG7yzz9?=
 =?us-ascii?Q?L2UVrIbnNq8eLelLS1WUYz8LcfAtRn0yhcuvAB+rCjo0zjhPPE2SJI49a9mm?=
 =?us-ascii?Q?EIssoVkHNU6oev+mIzyf3p72M7Nk4MCLQGt1wBridVfe8aYiDjnpNnYW2Fdq?=
 =?us-ascii?Q?2PcBlDZhJpTSx3q36ea1zXXqZzYWVAbs8o+PzbJ76R3NEp7BRV9FELxPrHT2?=
 =?us-ascii?Q?DygoVi3u1t1uYq7TRTmwoebtOlInxTQopSXpnv3RmP8emSE6M6/aIHEzrqMI?=
 =?us-ascii?Q?xkLDCtRCGA/h2GogGy9OkUBRFGCwToddiKYgAve5h6n7fdo1Jmm866aUMIrt?=
 =?us-ascii?Q?2Za2m89s1E7tCjEVr1H9Aa5Ec0+LtuFSDgRjs+yDycuFIOY2ujXvKZ0MWmOE?=
 =?us-ascii?Q?CojEFSyETiv2Erjk6hF7Uln9hvlZWASZoL06kCkIkHV2TxT5XqvlYTC+o3+O?=
 =?us-ascii?Q?hooBcztZ/YQOB9XsRdBulL9q?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR10MB4091.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(10070799003)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?JJcWBw3sKbO+D7dUnqbGZQ4xCRTfoCdbY0pF69gF/o9xcT4P5j26hoJJf44i?=
 =?us-ascii?Q?UgvCSexIJSSjnmBgsw2LypNd8YND1xLJr0klIUZF1ds4H4Um2vp7GjPQw+XA?=
 =?us-ascii?Q?IhKcfLU/TuLwnEvkFJNlqR4vIMBEP/ItecRAZMYrYwKII9dltJKTpPy5EDAN?=
 =?us-ascii?Q?D30XGwa+jkKX0bQDIfZEfff3R1B72C8AZr61jADV0AMI3nql5et6H3uvlJMM?=
 =?us-ascii?Q?ujRsW2a1QP12AB6aCvxkG212xt+EITkRaB8aXdHfXwjFqDEtgdCv1fsJtG7g?=
 =?us-ascii?Q?bniOGxabJDvwQlfjDug9+d4nwVjcXWN+l2eYkj98r6iA2K7Sm48xm+FOckew?=
 =?us-ascii?Q?Iup/qIxdqjIQ8olFYPUYjauinUS28adn5yCTf/VmCqVbPOSg4xAIwgj/oyt2?=
 =?us-ascii?Q?xPUf62mWrgu6avtHaPBl7EVU7JM/UblxFHbQsJsT4bSRJjP4DBE4lSWarx9p?=
 =?us-ascii?Q?xFzaN261/QPP4RtWFETNaGzel6iolZQcLde9SB2x7yw0P8SB7UKsLk5Bnakq?=
 =?us-ascii?Q?4gusmt410h2fMZAb4g4FQ8vdt3kO+8ZXinNnB3HmjKFJ5R0kKfp8hDGx+15V?=
 =?us-ascii?Q?Ow+P5lbFha1CddxbxDIZDpvVoHyNfjRWaTptEEpmSM5xbmhDyTQlrH1OvAev?=
 =?us-ascii?Q?DArAb9ey7qJXUX3kj4JWqXIXQXpS5DB5Mah/URqlqDFaGaj+YAv8YFpPv16z?=
 =?us-ascii?Q?bQfNQN/cpemg9vdQ3eNBikRm27s4q39s2NhmpmARQwBHV/tSMNgQgl7MigLo?=
 =?us-ascii?Q?L9jBBu8ojYW3Z1qaDVy1bzIGIh8gx2sKl9iv2pQzybf+LiOkQfMkj8RnP9vC?=
 =?us-ascii?Q?6NJYQz2ldmJiZWHE0aLEsWvKAlZwXNy+0PN0RXY7VJ/xl0lmgRGAuoyuB2VI?=
 =?us-ascii?Q?nnV/xVMiyn7if1LfoIEt3AfIZztlzwVMa0K/q3oXICS++mut0ai+qROxFQue?=
 =?us-ascii?Q?uKZx2Rws6IprONanQP5/VGcGEkur7Pud8LJjVKd0PWT3n7QeHB/acUP0kt0f?=
 =?us-ascii?Q?BJ9F4PExbaT0igQsMZGauc1TPyOeL0GYI7WZtfHfCbXOiWg42jclNJwFXl4A?=
 =?us-ascii?Q?4SGoQ+nHl8bPk5iEb7hG2JTwHqHRdVeawTTKfzQ1weaJu50Ok9MT+uKBqQez?=
 =?us-ascii?Q?2MllkNH27nnHu7JbvJ8s1wUODD6kchfZ14CpkjehrlFesZk84If3OmlInHGq?=
 =?us-ascii?Q?3VIaXARFuU3AIDjZWN7t+DRCAZiWud2+6zzak/4oH01+NHzsq91sCi1TPJEJ?=
 =?us-ascii?Q?m7RJKd+OGffgocjeNVTWIwudNMc7KdycOPfzsX4Q8WZMQpdkNFeAZ/rN6FsH?=
 =?us-ascii?Q?a992+sAeF8lNbbcMi442dsLz+5x4oVVquqvo15AT+Fjqz9f4y2ztNdAB6RPq?=
 =?us-ascii?Q?9rSnPFeuS2O8WNIUDXSarnY2vlO0x91t7tCi/UHrXrz/jC27cp6Gd3sUZ/tG?=
 =?us-ascii?Q?T6B3/iNdkmQyQu9UZdvQDwgsQ0TUmmOiBGf2eL+l6ReTliAPJpeGbuVOBRnr?=
 =?us-ascii?Q?ngNdmqztdDSYr/zAucA/kpxackQSnDEoBQqOweJ/zlUfmvhXaBRuIs/6Ry7G?=
 =?us-ascii?Q?W969h2co3ZDhDPtCIc/aM3rvKyNh/P7ZH5jQpTre5Hn4UpynEmY6foLs46yr?=
 =?us-ascii?Q?Eg=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	IrVXsDBNn02rRjK2fvDdkrYa4KUntrijXQ4M7zS0Z5I1dnmjuWbEwzgw979x/mbXxM0j6BcQ7fn8QBBkJHka7t4/ebW9XtfuHq8bHlhV3WvEYiBumJDIh768HMoTPRH+ItVJE9SkytRkKRRN0RCMF+WTVC3n1jr1XOucTY4/5qEO7aSjcep/fL0P2VI+nuBWuMj+Bw7GM28KeyBnw919C508fPRgB78g7riVy7G21DaZ3XbSjN11QOuk9DZ4kKkbJiXGCaF8waaF92dNwDbD0rGTX8r3ykO4M33ZK3pc37NWdXyBCWTXvGyR6oY2NsPmpqiKpyeda0LC1cTOH7SG5PIHSCgrY36mWmGpFubbA2MgRfO9H+pu9QV8MuADTp2D7pE6GStjZkTyULApwBRiEs5HDaAN93iyJUB3d8OuWLmI6TbqrFSxrRrc/49I52t1JIx5LUCu0b8e5xmO0Gcz4I+bHYKBpzwKUusbC2TUyTIz57MsBaVz3TZLipQpFgtIQ5ZKlJc7eRXufhpshbz/XPq+ilfJz685ICBprJ+Z1QKYDmjHZVRUi1SOrecgJahnlIMlgyskLIywz9DHZWgrZ/8V+5ty4We+7ipmoeEg+sA=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5175c254-2ce7-4fe7-0725-08dcf8dc3970
X-MS-Exchange-CrossTenant-AuthSource: DM6PR10MB4091.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2024 12:13:12.2011
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6g8Wtt7fNx0SDJ8kPBp+H2naGfwB52X1vXEAbUrr2c8KmspCxrtaAWTQEoDYPSf3UtG27nSwizTN24eR/KuJHg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR10MB7111
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-30_10,2024-10-30_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 mlxscore=0 adultscore=0
 mlxlogscore=999 phishscore=0 bulkscore=0 malwarescore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2409260000
 definitions=main-2410300095
X-Proofpoint-ORIG-GUID: WWONArp4zgtv65ULyXpLa0NQrBl3j6C9
X-Proofpoint-GUID: WWONArp4zgtv65ULyXpLa0NQrBl3j6C9

This adjusts everything to use \fN...\fP rather than \fN...\fR everywhere:
the few places that were using \fP (usually \fB\fIfilename\fP.ext\fR) were
re-expressed into \fIfilename\fP\fB.ext\fP. \& was added in the instances
of this pattern that weren't using it (about half were).

No effect on terminal or typeset output, other than very slightly improved
layout around the filename stuff above.

Signed-off-by: Nick Alcock <nick.alcock@oracle.com>
Reviewed-by: Kris Van Hees <kris.van.hees@oracle.com>
---
 cmd/dtrace.8 | 72 ++++++++++++++++++++++++++--------------------------
 1 file changed, 36 insertions(+), 36 deletions(-)

diff --git a/cmd/dtrace.8 b/cmd/dtrace.8
index 355484bd0d34..1f2d48a07531 100644
--- a/cmd/dtrace.8
+++ b/cmd/dtrace.8
@@ -39,9 +39,9 @@ dtrace \- DTrace dynamic tracing compiler and tracing utility
 .LP
 DTrace is a comprehensive dynamic tracing framework for the Linux operating system. DTrace provides a powerful infrastructure that permits administrators, developers, and service personnel to concisely answer arbitrary questions about the behavior of the operating system and user programs. 
 .LP
-The \fIOracle Linux DTrace Guide\fR describes how to use DTrace to observe, debug, and tune system behavior. Refer to this book for a detailed description of DTrace features, including the bundled DTrace observability tools, instrumentation providers, and the D programming language.
+The \fIOracle Linux DTrace Guide\fP describes how to use DTrace to observe, debug, and tune system behavior. Refer to this book for a detailed description of DTrace features, including the bundled DTrace observability tools, instrumentation providers, and the D programming language.
 .LP
-The \fBdtrace\fR command provides a generic interface to the essential services provided by the DTrace facility, including:
+The \fBdtrace\fP command provides a generic interface to the essential services provided by the DTrace facility, including:
 .RS +4
 .IP o
 Options that list the set of probes and providers currently published by DTrace
@@ -57,100 +57,100 @@ Options that generate program stability reports
 Options that modify DTrace tracing and buffering behavior and enable additional D compiler features
 .RE
 .LP
-You can use \fBdtrace\fR to create D scripts by using it in a \fB#!\fR declaration to create an interpreter file. You can also use \fBdtrace\fR to attempt to compile D programs and determine their properties without actually enabling tracing using the \fB\-e\fR option. See \fBOPTIONS\fR. See the \fIOracle Linux DTrace Guide\fR for detailed examples of how to use the \fBdtrace\fR utility to perform these tasks.
+You can use \fBdtrace\fP to create D scripts by using it in a \fB#!\fP declaration to create an interpreter file. You can also use \fBdtrace\fP to attempt to compile D programs and determine their properties without actually enabling tracing using the \fB\-e\fP option. See \fBOPTIONS\fP. See the \fIOracle Linux DTrace Guide\fP for detailed examples of how to use the \fBdtrace\fP utility to perform these tasks.
 .SH OPTIONS
 .LP
-The arguments accepted by the \fB\-P\fR, \fB\-m\fR, \fB\-f\fR, \fB\-n\fR, and \fB\-i\fR options can include an optional D language \fIpredicate\fR enclosed in slashes \fB//\fR and optional D language \fIaction\fR statement list enclosed in braces \fB{}\fR. D program code specified on the command line must be appropriately quoted to avoid interpretation of meta-characters by the shell.
+The arguments accepted by the \fB\-P\fP, \fB\-m\fP, \fB\-f\fP, \fB\-n\fP, and \fB\-i\fP options can include an optional D language \fIpredicate\fP enclosed in slashes \fB//\fP and optional D language \fIaction\fP statement list enclosed in braces \fB{}\fP. D program code specified on the command line must be appropriately quoted to avoid interpretation of meta-characters by the shell.
 .LP
 The following options are supported:
 .TP
 \fB\-b\fP \fIbufsz\fP
-Set principal trace buffer size (\fIbufsz\fR). The trace buffer size can include any of the size suffixes \fBk\fR, \fBm\fR, \fBg\fR, or \fBt\fR. If the buffer space cannot be allocated, \fBdtrace\fR attempts to reduce the buffer size or exit depending on the setting of the \fBbufresize\fR property.
+Set principal trace buffer size (\fIbufsz\fP). The trace buffer size can include any of the size suffixes \fBk\fP, \fBm\fP, \fBg\fP, or \fBt\fP. If the buffer space cannot be allocated, \fBdtrace\fP attempts to reduce the buffer size or exit depending on the setting of the \fBbufresize\fP property.
 .TP
 \fB\-c\fP \fIcmd\fP
-Run the specified command \fIcmd\fR and exit upon its completion. If more than one \fB\-c\fR option is present on the command line, \fBdtrace\fR exits when all commands have exited, reporting the exit status for each child process as it terminates. The process-ID of the first command is made available to any D programs specified on the command line or using the \fB\-s\fR option through the \fB$target\fR macro variable. Refer to the \fIOracle Linux DTrace Guide\fR for more information on macro variables.
+Run the specified command \fIcmd\fP and exit upon its completion. If more than one \fB\-c\fP option is present on the command line, \fBdtrace\fP exits when all commands have exited, reporting the exit status for each child process as it terminates. The process-ID of the first command is made available to any D programs specified on the command line or using the \fB\-s\fP option through the \fB$target\fP macro variable. Refer to the \fIOracle Linux DTrace Guide\fP for more information on macro variables.
 .TP
 \fB\-C\fP
-Run the C preprocessor \fBcpp\fR(1) over D programs before compiling them. You can pass options to the C preprocessor using the \fB\-D\fR, \fB\-U\fR, \fB\-I\fR, and \fB\-H\fR options. You can select the degree of C standard conformance if you use the \fB\-X\fR option. For a description of the set of tokens defined by the D compiler when invoking the C preprocessor, see \fB\-X\fR.
+Run the C preprocessor \fBcpp\fP(1) over D programs before compiling them. You can pass options to the C preprocessor using the \fB\-D\fP, \fB\-U\fP, \fB\-I\fP, and \fB\-H\fP options. You can select the degree of C standard conformance if you use the \fB\-X\fP option. For a description of the set of tokens defined by the D compiler when invoking the C preprocessor, see \fB\-X\fP.
 .TP
 \fB\-D\fP \fIname\fP \fB[=\fP\fIvalue\fP\fB]\fP
-Define \fIname\fR when invoking \fBcpp\fR(1) (enabled using the \fB\-C\fR option). If you specify the equals sign (\fB=\fR) and additional \fIvalue\fR, the name is assigned the corresponding value. This option passes the \fB\-D\fR option to each \fBcpp\fR invocation.
+Define \fIname\fP when invoking \fBcpp\fP(1) (enabled using the \fB\-C\fP option). If you specify the equals sign (\fB=\fP) and additional \fIvalue\fP, the name is assigned the corresponding value. This option passes the \fB\-D\fP option to each \fBcpp\fP invocation.
 .TP
 \fB\-e\fP
 Exit after compiling any requests, but prior to enabling any probes. You can combine this option with D compiler options. This combination verifies that the programs compile without actually executing them and enabling the corresponding instrumentation.
 .TP
 \fB\-f\fP\fB[[\fP\fIprovider\fP\fB:]\fP\fImodule\fP\fB:]\fP\fIfunction\fP\fB[[\fP\fIpredicate\fP\fB]\fP\fIaction\fP\fB]]\fP
-Specify function name to trace or list (\fB\-l\fR option). The corresponding argument can include any of the probe description forms \fIprovider:module:function\fR, \fImodule:function\fR, or \fIfunction\fR. Unspecified probe description fields are left blank and match any probes regardless of the values in those fields. If no qualifiers other than \fIfunction\fR are specified in the description, all probes with the corresponding \fIfunction\fR are matched. The \fB\-f\fR argument can be suffixed with an optional D probe clause. You can specify more than one \fB\-f\fR option on the command line at a time.
+Specify function name to trace or list (\fB\-l\fP option). The corresponding argument can include any of the probe description forms \fIprovider:module:function\fP, \fImodule:function\fP, or \fIfunction\fP. Unspecified probe description fields are left blank and match any probes regardless of the values in those fields. If no qualifiers other than \fIfunction\fP are specified in the description, all probes with the corresponding \fIfunction\fP are matched. The \fB\-f\fP argument can be suffixed with an optional D probe clause. You can specify more than one \fB\-f\fP option on the command line at a time.
 .TP
 \fB\-F\fP
-Coalesce trace output by identifying function entry and return. Function entry probe reports are indented and their output is prefixed with \fB->\fR. Function return probe reports are unindented and their output is prefixed with \fB<-\fR\&. System call entry probe reports are indented and their output is prefixed with \fB=>\fR. System call return probe reports are unindented and their output is prefixed with \fB<=\fR\&.
+Coalesce trace output by identifying function entry and return. Function entry probe reports are indented and their output is prefixed with \fB->\fP. Function return probe reports are unindented and their output is prefixed with \fB<-\fP\&. System call entry probe reports are indented and their output is prefixed with \fB=>\fP. System call return probe reports are unindented and their output is prefixed with \fB<=\fP\&.
 .TP
 \fB\-G\fP
-Generate an ELF file containing an embedded DTrace program. The DTrace probes specified in the program are saved inside of a relocatable ELF object which can be linked into another program. If the \fB\-o\fR option is present, the ELF file is saved using the pathname specified as the argument for this operand. If the \fB\-o\fR option is not present and the DTrace program is contained with a file whose name is \fB\fIfilename\fR.d\fR, then the ELF file is saved using the name \fB\fIfilename\fR.o\fR. Otherwise the ELF file is saved using the name \fBd.out\fR.
+Generate an ELF file containing an embedded DTrace program. The DTrace probes specified in the program are saved inside of a relocatable ELF object which can be linked into another program. If the \fB\-o\fP option is present, the ELF file is saved using the pathname specified as the argument for this operand. If the \fB\-o\fP option is not present and the DTrace program is contained with a file whose name is \fIfilename\fP\fB\&.d\fP, then the ELF file is saved using the name \fIfilename\fP\fB\&.o\fP. Otherwise the ELF file is saved using the name \fBd.out\fP.
 .TP
 \fB\-H\fP
-Print the pathnames of included files when invoking \fBcpp\fR(1) (enabled using the \fB\-C\fR option). This option passes the \fB\-H\fR option to each \fBcpp\fR invocation, causing it to display the list of pathnames, one for each line, to \fBstderr\fR.
+Print the pathnames of included files when invoking \fBcpp\fP(1) (enabled using the \fB\-C\fP option). This option passes the \fB\-H\fP option to each \fBcpp\fP invocation, causing it to display the list of pathnames, one for each line, to \fBstderr\fP.
 .TP
 \fB\-h\fP
-Generate a header file containing macros that correspond to probes in the specified provider definitions. This option should be used to generate a header file that is included by other source files for later use with the \fB\-G\fR option. If the \fB\-o\fR option is present, the header file is saved using the pathname specified as the argument for that option. If the \fB\-o\fR option is not present and the DTrace program is contained with a file whose name is \fIfilename\fR\fB\&.d\fR, then the header file is saved using the name \fIfilename\fR\fB\&.h\fR.
+Generate a header file containing macros that correspond to probes in the specified provider definitions. This option should be used to generate a header file that is included by other source files for later use with the \fB\-G\fP option. If the \fB\-o\fP option is present, the header file is saved using the pathname specified as the argument for that option. If the \fB\-o\fP option is not present and the DTrace program is contained with a file whose name is \fIfilename\fP\fB\&.d\fP, then the header file is saved using the name \fIfilename\fP\fB\&.h\fP.
 .TP
 \fB\-i\fP \fIprobe-id\fP\fB[[\fP\fIpredicate\fP] \fIaction\fP\fB]\fP
-Specify probe identifier (\fIprobe-id\fR) to trace or list (\fB\-l\fR option). You can specify probe IDs using decimal integers as shown by \fBdtrace\fR \fB\-l\fR. The \fB\-i\fR argument can be suffixed with an optional D probe clause. You can specify more than one \fB\-i\fR option at a time.
+Specify probe identifier (\fIprobe-id\fP) to trace or list (\fB\-l\fP option). You can specify probe IDs using decimal integers as shown by \fBdtrace\fP \fB\-l\fP. The \fB\-i\fP argument can be suffixed with an optional D probe clause. You can specify more than one \fB\-i\fP option at a time.
 .TP
 \fB\-I\fP \fIpath\fP
-Add the specified directory \fIpath\fR to the search path for \fB#include\fR files when invoking \fBcpp\fR(1) (enabled using the \fB\-C\fR option). This option passes the \fB\-I\fR option to each \fBcpp\fR invocation. The specified \fIpath\fR is inserted into the search path ahead of the default directory list.
+Add the specified directory \fIpath\fP to the search path for \fB#include\fP files when invoking \fBcpp\fP(1) (enabled using the \fB\-C\fP option). This option passes the \fB\-I\fP option to each \fBcpp\fP invocation. The specified \fIpath\fP is inserted into the search path ahead of the default directory list.
 .TP
 \fB\-L\fP \fIpath\fP
-Add the specified directory \fIpath\fR to the search path for DTrace libraries. DTrace libraries are used to contain common definitions that can be used when writing D programs. The specified \fIpath\fR is added after the default library search path. If it exists, a subdirectory of \fIpath\fR named after the minor version of the running kernel (e.g. 3.8) is searched immediately before \fIpath\fR. (But take note: dependency analysis is performed only within each directory, not across directories.)
+Add the specified directory \fIpath\fP to the search path for DTrace libraries. DTrace libraries are used to contain common definitions that can be used when writing D programs. The specified \fIpath\fP is added after the default library search path. If it exists, a subdirectory of \fIpath\fP named after the minor version of the running kernel (e.g. 3.8) is searched immediately before \fIpath\fP. (But take note: dependency analysis is performed only within each directory, not across directories.)
 .TP
 \fB\-l\fP
-List probes instead of enabling them. If the \fB\-l\fR option is specified, \fBdtrace\fR produces a report of the probes matching the descriptions given using the \fB\-P\fR, \fB\-m\fR, \fB\-f\fR, \fB\-n\fR, \fB\-i\fR, and \fB\-s\fR options. If none of these options are specified, this option lists all probes.
+List probes instead of enabling them. If the \fB\-l\fP option is specified, \fBdtrace\fP produces a report of the probes matching the descriptions given using the \fB\-P\fP, \fB\-m\fP, \fB\-f\fP, \fB\-n\fP, \fB\-i\fP, and \fB\-s\fP options. If none of these options are specified, this option lists all probes.
 .TP
 \fB\-m\fP [[\fIprovider:\fP] \fImodule:\fP [[\fIpredicate\fP] \fIaction\fP]]
-Specify module name to trace or list (\fB\-l\fR option). The corresponding argument can include any of the probe description forms \fIprovider:module\fR or \fImodule\fR. Unspecified probe description fields are left blank and match any probes regardless of the values in those fields. If no qualifiers other than \fImodule\fR are specified in the description, all probes with a corresponding \fImodule\fR are matched. The \fB\-m\fR argument can be suffixed with an optional D probe clause. More than one \fB\-m\fR option can be specified on the command line at a time.
+Specify module name to trace or list (\fB\-l\fP option). The corresponding argument can include any of the probe description forms \fIprovider:module\fP or \fImodule\fP. Unspecified probe description fields are left blank and match any probes regardless of the values in those fields. If no qualifiers other than \fImodule\fP are specified in the description, all probes with a corresponding \fImodule\fP are matched. The \fB\-m\fP argument can be suffixed with an optional D probe clause. More than one \fB\-m\fP option can be specified on the command line at a time.
 .TP
 \fB\-n\fP [[[\fIprovider:\fP] \fImodule:\fP] \fIfunction:\fP] \fIname\fP [[\fIpredicate\fP] \fIaction\fP]
-Specify probe name to trace or list (\fB\-l\fR option). The corresponding argument can include any of the probe description forms \fIprovider:module:function:name\fR, \fImodule:function:name\fR, \fIfunction:name\fR, or \fIname\fR. Unspecified probe description fields are left blank and match any probes regardless of the values in those fields. If no qualifiers other than \fIname\fR are specified in the description, all probes with a corresponding \fIname\fR are matched. The \fB\-n\fR argument can be suffixed with an optional D probe clause. More than one \fB\-n\fR option can be specified on the command line at a time.
+Specify probe name to trace or list (\fB\-l\fP option). The corresponding argument can include any of the probe description forms \fIprovider:module:function:name\fP, \fImodule:function:name\fP, \fIfunction:name\fP, or \fIname\fP. Unspecified probe description fields are left blank and match any probes regardless of the values in those fields. If no qualifiers other than \fIname\fP are specified in the description, all probes with a corresponding \fIname\fP are matched. The \fB\-n\fP argument can be suffixed with an optional D probe clause. More than one \fB\-n\fP option can be specified on the command line at a time.
 .TP
 \fB\-o\fP \fIoutput\fP
-Specify the \fIoutput\fR file for the \fB\-G\fR, \fB\-h\fR, and \fB\-l\fR options, or for the traced data itself. If the \fB\-G\fR option is present and the \fB\-s\fR option's argument is of the form \fB\fIfilename\fR.d\fR and \fB\-o\fR is not present, the default output file is \fB\fIfilename\fR.o\fR. Otherwise the default output file is \fBd.out\fR.
+Specify the \fIoutput\fP file for the \fB\-G\fP, \fB\-h\fP, and \fB\-l\fP options, or for the traced data itself. If the \fB\-G\fP option is present and the \fB\-s\fP option's argument is of the form \fIfilename\fP\fB\&.d\fP and \fB\-o\fP is not present, the default output file is \fIfilename\fP\fB\&.o\fP. Otherwise the default output file is \fBd.out\fP.
 .TP
 \fB\-p\fP \fIpid\fP
-Grab the specified process-ID \fIpid\fR, cache its symbol tables, and exit upon its completion. If more than one \fB\-p\fR option is present on the command line, \fBdtrace\fR exits when all commands have exited, reporting the exit status for each process as it terminates. The first process-ID is made available to any D programs specified on the command line or using the \fB\-s\fR option through the \fB$target\fR macro variable. Refer to the \fIOracle Linux DTrace Guide\fR for more information on macro variables.
+Grab the specified process-ID \fIpid\fP, cache its symbol tables, and exit upon its completion. If more than one \fB\-p\fP option is present on the command line, \fBdtrace\fP exits when all commands have exited, reporting the exit status for each process as it terminates. The first process-ID is made available to any D programs specified on the command line or using the \fB\-s\fP option through the \fB$target\fP macro variable. Refer to the \fIOracle Linux DTrace Guide\fP for more information on macro variables.
 .TP
 \fB\-P\fP \fIprovider\fP \fB[[\fP\fIpredicate\fP\fB]\fP \fIaction\fP]
-Specify provider name to trace or list (\fB\-l\fR option). The remaining probe description fields module, function, and name are left blank and match any probes regardless of the values in those fields. The \fB\-P\fR argument can be suffixed with an optional D probe clause. You can specify more than one \fB\-P\fR option on the command line at a time.
+Specify provider name to trace or list (\fB\-l\fP option). The remaining probe description fields module, function, and name are left blank and match any probes regardless of the values in those fields. The \fB\-P\fP argument can be suffixed with an optional D probe clause. You can specify more than one \fB\-P\fP option on the command line at a time.
 .TP
 \fB\-q\fP
-Set quiet mode. \fBdtrace\fR suppresses messages such as the number of probes matched by the specified options and D programs and does not print column headers, the CPU ID, the probe ID, or insert newlines into the output. Only data traced and formatted by D program statements such as \fBtrace()\fR and \fBprintf()\fR is displayed to \fBstdout\fR.
+Set quiet mode. \fBdtrace\fP suppresses messages such as the number of probes matched by the specified options and D programs and does not print column headers, the CPU ID, the probe ID, or insert newlines into the output. Only data traced and formatted by D program statements such as \fBtrace()\fP and \fBprintf()\fP is displayed to \fBstdout\fP.
 .TP
 \fB\-s\fP
-Compile the specified D program source file. If the \fB\-e\fR option is present, the program is compiled but instrumentation is not enabled. If the \fB\-l\fR option is present, the program is compiled and the set of probes matched by it is listed, but instrumentation is not enabled. If none of \fB\-e\fR, \fB\-l\fR, or \fB\-G\fR are present, the instrumentation specified by the D program is enabled and tracing begins.
+Compile the specified D program source file. If the \fB\-e\fP option is present, the program is compiled but instrumentation is not enabled. If the \fB\-l\fP option is present, the program is compiled and the set of probes matched by it is listed, but instrumentation is not enabled. If none of \fB\-e\fP, \fB\-l\fP, or \fB\-G\fP are present, the instrumentation specified by the D program is enabled and tracing begins.
 .TP
 \fB\-S\fP
-Show D compiler intermediate code. The D compiler produces a report of the intermediate code generated for each D program to \fBstderr\fR.
+Show D compiler intermediate code. The D compiler produces a report of the intermediate code generated for each D program to \fBstderr\fP.
 .TP
 \fB\-U\fP \fIname\fP
-Undefine the specified \fIname\fR when invoking \fBcpp\fR(1) (enabled using the \fB-C\fR option). This option passes the \fB-U\fR option to each \fBcpp\fR invocation.
+Undefine the specified \fIname\fP when invoking \fBcpp\fP(1) (enabled using the \fB-C\fP option). This option passes the \fB-U\fP option to each \fBcpp\fP invocation.
 .TP
 \fB\-v\fP
-Set verbose mode. If the \fB\-v\fR option is specified, \fBdtrace\fR produces a program stability report showing the minimum interface stability and dependency level for the specified D programs. DTrace stability levels are explained in further detail in the \fIOracle Linux DTrace Guide\fR.
+Set verbose mode. If the \fB\-v\fP option is specified, \fBdtrace\fP produces a program stability report showing the minimum interface stability and dependency level for the specified D programs. DTrace stability levels are explained in further detail in the \fIOracle Linux DTrace Guide\fP.
 .TP
 \fB\-V\fP
-Report the highest D programming interface version supported by \fBdtrace\fR. The version information is printed to \fBstdout\fR and the \fBdtrace\fR command exits. Refer to the \fIOracle Linux DTrace Guide\fR for more information about DTrace versioning features. In conjunction with \fB\-v\fR, also reports information on the version of the \fBdtrace\fR(1) tool and associated library.
+Report the highest D programming interface version supported by \fBdtrace\fP. The version information is printed to \fBstdout\fP and the \fBdtrace\fP command exits. Refer to the \fIOracle Linux DTrace Guide\fP for more information about DTrace versioning features. In conjunction with \fB\-v\fP, also reports information on the version of the \fBdtrace\fP(1) tool and associated library.
 .TP
 \fB\-w\fP
-Permit destructive actions in D programs specified using the \fB\-s\fR, \fB\-P\fR, \fB\-m\fR, \fB\-f\fR, \fB\-n\fR, or \fB\-i\fR options. If the \fB\-w\fR option is not specified, \fBdtrace\fR does not permit the compilation or enabling of a D program that contains destructive actions.
+Permit destructive actions in D programs specified using the \fB\-s\fP, \fB\-P\fP, \fB\-m\fP, \fB\-f\fP, \fB\-n\fP, or \fB\-i\fP options. If the \fB\-w\fP option is not specified, \fBdtrace\fP does not permit the compilation or enabling of a D program that contains destructive actions.
 .TP
 \fB\-x\fP \fIarg\fP [\fI=val\fP]
-Enable or modify a DTrace runtime option or D compiler option. The list of options is found in the \fIOracle Linux DTrace Guide\fR. Boolean options are enabled by specifying their name. Options with values are set by separating the option name and value with an equals sign (\fB=\fR).
+Enable or modify a DTrace runtime option or D compiler option. The list of options is found in the \fIOracle Linux DTrace Guide\fP. Boolean options are enabled by specifying their name. Options with values are set by separating the option name and value with an equals sign (\fB=\fP).
 .TP
 \fB\-Z\fP
-Permit probe descriptions that match zero probes. If the \fB\-Z\fR option is not specified, \fBdtrace\fR reports an error and exits if any probe descriptions specified in D program files (\fB\-s\fR option) or on the command line (\fB\-P\fR, \fB\-m\fR, \fB\-f\fR, \fB\-n\fR, or \fB\-i\fR options) contain descriptions that do not match any known probes.
+Permit probe descriptions that match zero probes. If the \fB\-Z\fP option is not specified, \fBdtrace\fP reports an error and exits if any probe descriptions specified in D program files (\fB\-s\fP option) or on the command line (\fB\-P\fP, \fB\-m\fP, \fB\-f\fP, \fB\-n\fP, or \fB\-i\fP options) contain descriptions that do not match any known probes.
 .
 .SH OPERANDS
 .LP
-You can specify zero or more additional arguments on the \fBdtrace\fR command line to define a set of macro variables (\fB$1\fR, \fB$2\fR, and so forth). The additional arguments can be used in D programs specified using the \fB\-s\fR option or on the command line. The use of macro variables is described further in the \fIOracle Linux DTrace Guide\fR.
+You can specify zero or more additional arguments on the \fBdtrace\fP command line to define a set of macro variables (\fB$1\fP, \fB$2\fP, and so forth). The additional arguments can be used in D programs specified using the \fB\-s\fP option or on the command line. The use of macro variables is described further in the \fIOracle Linux DTrace Guide\fP.
 .
 .SH EXIT STATUS
 .LP
@@ -159,12 +159,12 @@ The following exit values are returned:
 .B 0
 Successful completion. 
 .IP
-For D program requests, an exit status of \fB0\fR indicates that programs were successfully compiled, probes were successfully enabled, or anonymous state was successfully retrieved. \fBdtrace\fR returns \fB0\fR even if the specified tracing requests encountered errors or drops.
+For D program requests, an exit status of \fB0\fP indicates that programs were successfully compiled, probes were successfully enabled, or anonymous state was successfully retrieved. \fBdtrace\fP returns \fB0\fP even if the specified tracing requests encountered errors or drops.
 .TP
 .B 1
 An error occurred.
 .IP
-For D program requests, an exit status of \fB1\fR indicates that program compilation failed or that the specified request could not be satisfied.
+For D program requests, an exit status of \fB1\fP indicates that program compilation failed or that the specified request could not be satisfied.
 .TP
 .B 2
 Invalid command line options or arguments were specified.
@@ -180,7 +180,7 @@ Print CTF type library debugging output on standard error.
 .IP DTRACE_OPT_*
 Set a given DTrace option.
 .IP
-Options set this way are overridden both by options specified via \fB\-x\fR on the command line, and by \fBsetopt\fR statements.
+Options set this way are overridden both by options specified via \fB\-x\fP on the command line, and by \fBsetopt\fP statements.
 .
 .SH SEE ALSO
 .BR cpp (1),
@@ -191,4 +191,4 @@ Options set this way are overridden both by options specified via \fB\-x\fR on t
 .
 .SH USAGE
 .LP
-When using the \fB\-p\fR flag, \fBdtrace\fR stops the target processes while it is inspecting them and reporting results. A process can do nothing while it is stopped. This means that, if, for example, the X server is inspected by \fBdtrace\fR running in a window under the X server's control, the whole window system can become deadlocked, because the \fBdtrace\fR tool would be attempting to display its results to a window that cannot be refreshed. In such a case, logging in from another system using \fBssh\fR(1) and killing the offending \fBdtrace\fR tool clears the deadlock.
+When using the \fB\-p\fP flag, \fBdtrace\fP stops the target processes while it is inspecting them and reporting results. A process can do nothing while it is stopped. This means that, if, for example, the X server is inspected by \fBdtrace\fP running in a window under the X server's control, the whole window system can become deadlocked, because the \fBdtrace\fP tool would be attempting to display its results to a window that cannot be refreshed. In such a case, logging in from another system using \fBssh\fP(1) and killing the offending \fBdtrace\fP tool clears the deadlock.
-- 
2.46.0.278.g36e3a12567

