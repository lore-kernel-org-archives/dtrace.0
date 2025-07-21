Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF344223338
	for <dtrace@lists.linux.dev>; Mon, 21 Jul 2025 22:28:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753136918; cv=fail; b=q5mLkUiWpLYkVG8Velo4quf6/vabhA2C19vYo7U1Tl5wRWKi9EwKQFJGJeEqdSOapiRnXBk5DUaVLAP2EqHZSq32548745FfDEIfWmgrzvkiLE7CEUSPvXLGL6TluRDtOEsrxN1nguTcvYE3SEY141SZ3eYwI9xRLnTlof3/8is=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753136918; c=relaxed/simple;
	bh=JK53CEZ1RXUv/G4O8ofCcY3HTbnQ4v3Z12j5dMSFfSI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=UQgQ9i9QjCZav+4WWjPTrUiUCNCF0zAwtNjqrMZinwayPA2TjP6qwyWy0iZzEnOY53VgRshiK3LN0r2X8MQorFO7m2ahV3o7umuUt4ckC7a5hNnslI2DBn3qoEK0pTILmuSBSJRk0uLY9Og6jaAYP3mXWGKU4n6Zdf+v2qiitco=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=gMtmFECM; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=BD/4Rzd3; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="gMtmFECM";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="BD/4Rzd3"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56LLNRXZ018380
	for <dtrace@lists.linux.dev>; Mon, 21 Jul 2025 22:28:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=RZ+tYdaj9nDGXSv78v
	0VtYMAueo96LgjluLKN+yfih8=; b=gMtmFECMRsZWao3/6tfPS57u+P5NI23t/C
	krA+TqZhFU6luImckwfFXuNFGoS0x+5Ob9sXS1Bmq472GpcEi3l7WZBqOwQ74uZr
	rRSyh9kQ2qkYnKMN2Kla/sEINBYiu3s38c/iMJsGBPtDIATPZeSQOv6MTgLZrjpp
	sFWgqOpjQQ6yn18w/ZCmo+cWMvNxGaruAD0gn1LBIZ366COd+a85ICGGiyihSDGz
	o4ebfsKkGIu32NebYFHHhpO2h0CezJGBJVQ2DIZ6UG5eET6ucybVy/O8IQoh09Dw
	sTTXhCPacUtZGY60UNiWjXC6jE0GnB5qvvc/NnvnFydpB46N3Z+A==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4805tx3x41-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 21 Jul 2025 22:28:28 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 56LKJW1D031484
	for <dtrace@lists.linux.dev>; Mon, 21 Jul 2025 22:28:26 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10on2055.outbound.protection.outlook.com [40.107.93.55])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4801tevmh9-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 21 Jul 2025 22:28:25 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jxWcR1hZPn8pjQPO4zmDcom29s8LqsESwCgzRTw4yPJUffa3cnO82QdUzP0bCIz42xJBLj0X9PG2A7El8Ox+NEk7FrAHWx9vQjZzzoXM+O41QsU9QRMdgABl1RHsxWhDP83gT6496Obr3DWXdFryIDLqQgwCK5yfczxlnmXLOfl5R8C8dZM7kvRuOQ0DO4XQFKdDqU57uRxm9kEZbCKuRkc1gkIzWWe2gkzPL/OEY2KjAGb3Fg4FIAIpUjnqsiwj8Hd+BUF3tYoBe7LUJLhQI2Z4afInXlAMuGSeNSeYHczLK8PeT4PdJDkhmYGwGDVvCTy1WUwBM+agtY4guwCOPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RZ+tYdaj9nDGXSv78v0VtYMAueo96LgjluLKN+yfih8=;
 b=dUWDptuzZdoJ90fHlic2N7UR2t+a7oIL7q3k9qhkd09lS1Z5unRKzXwkOWyqIqUA9YCJ1KjMLx0c9vWwifB0Mg/dA/EVx/Gq/IWVlc65h/mdL7f382sI7fMdmyhJxvvPvC7o+jwnAqNOs+sqasmS5R5E5G7SjtegGuJZ5u5ijjTMgefNQFes/zQrXzq9JgGgfrFYhPi78Zn3Wyo+c+vpqbgEvjl1qLnE8UfQvesklVcMlxo455luL55HFnN8LpeqvowAawwl/4DpbSDb0hE8huMnpob9xda3JPu21PopoNIe8AvWxtTc0jb9TjB9yIo3PgBSaOFaXj19DDtM1zV1uQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RZ+tYdaj9nDGXSv78v0VtYMAueo96LgjluLKN+yfih8=;
 b=BD/4Rzd3foWUpUsShl1kRQVgEkVn4OsjBfucCnieZmIIwX4WTS8RsW1E9pbY6yU2uRUPlOjw6tOilZYuqFyffh2OoJ1tbcjYTBy/9VWUPsk5KMct41jE2CatIDI5elXjtD8yrET3FHT+VqPLxwjFkzd3i8KjIySKV9B6eWdOO4E=
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com (2603:10b6:a03:3ef::21)
 by IA1PR10MB7357.namprd10.prod.outlook.com (2603:10b6:208:3ff::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.30; Mon, 21 Jul
 2025 22:27:57 +0000
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b]) by SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b%6]) with mapi id 15.20.8922.042; Mon, 21 Jul 2025
 22:27:56 +0000
Date: Mon, 21 Jul 2025 18:27:53 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Alan Maguire <alan.maguire@oracle.com>
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [DTrace-devel] [PATCH v4 6/7] dlibs: sync ip.d, net.d and tcp.d
Message-ID: <aH6+6f92+gobHoac@oracle.com>
References: <20250709144700.20591-1-alan.maguire@oracle.com>
 <20250709144700.20591-7-alan.maguire@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250709144700.20591-7-alan.maguire@oracle.com>
X-ClientProxiedBy: BLAPR05CA0009.namprd05.prod.outlook.com
 (2603:10b6:208:36e::16) To SJ0PR10MB5672.namprd10.prod.outlook.com
 (2603:10b6:a03:3ef::21)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR10MB5672:EE_|IA1PR10MB7357:EE_
X-MS-Office365-Filtering-Correlation-Id: b2fc5ef1-73fd-4133-d06a-08ddc8a5d72a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?HsW5DgdBWbsb/xgQklODJK6GaOZMsKbkxEgfStkFvKE6z9XkHpZsdn2Y3VUu?=
 =?us-ascii?Q?vQLIiWNILsadKe8wzRMg8o9znwukYC56POg93/Z8l/NjlYPAFSbW8CERcorN?=
 =?us-ascii?Q?XckNcqaFlQpqsh9QG2N/WxydMEPfyxmQHwwHboFfjbl56SpNaSgq4/dKqGDb?=
 =?us-ascii?Q?O2zRCr6ngO9ouor0yiC7eSOl21hQfKJCwYDAQv7JKv2ItzqrV5JqFSeQYyIH?=
 =?us-ascii?Q?pJYIJ+6Pz0DUlo7IXVJIWPZT+uopGhwyLlu42qigAfj/Nl8gY7ikwS6KS2YP?=
 =?us-ascii?Q?rzelBbDWE3Q0RZJhgv5liK9IalZkIWwL5JiZOHqCqfShii2XPAGSC5tq+KNZ?=
 =?us-ascii?Q?t+eV0X+X5+4k5+Jd2TwEW+WqyyYfubILdIzphzqITPaMHOxCzg4NQH+kdYZP?=
 =?us-ascii?Q?L5lQ/Sq/CAqB4SP2a+9Qgq35TNyvP2y0CZa+jpHJdGeECqcCbTEMlH3xwZny?=
 =?us-ascii?Q?nXguNw4SPL3bvquvL7iVWbQaHlAycIweT4ZC1qZdzIA/J++X6lm0KXpKkE37?=
 =?us-ascii?Q?J5ppuKy7lWOHA0MbIKycUAolr57HEwDbaJWhyHQdOWmbko6aO9mLoZd4Dy4C?=
 =?us-ascii?Q?U+wpSDdwtmnIobdZg4pQ6T7gVDvB84wpXNZ+r49azlGnDiXlrsXBC1k8Egee?=
 =?us-ascii?Q?U8p0y7YZnor4Lm1LqruuEnVU5szCScC3jqcOVjw9aZEGbp7ZzbRdh01sbU3Q?=
 =?us-ascii?Q?c8Ye3/v5XCoBlUeZnsMfMLaQh/0j5YY0DB54cvzZcJYv16mDxrVv2HVAgbhP?=
 =?us-ascii?Q?NaYbjR1wUW7ARhm6BwV0xBE5BDy6xsUFmHBlzi06GnB0xdl4JTZp8M8Dgtf4?=
 =?us-ascii?Q?QjIifHxHF8bHj5UI0CliH5YtYtrOkVzWXG+CpwFWLP27+y59BqKUkxgz7sMF?=
 =?us-ascii?Q?ZlYF8a3n4gqsVJZmB1kfXhp09kNPDw5ZCwBSi6eidzm0/gOsgeTn1DC3VOax?=
 =?us-ascii?Q?tA9r3etW1zc+iu8SHLw2zciQUqG3qyHHSwOJi9NrHQrEJHZ90VuJWpcIdqFz?=
 =?us-ascii?Q?12Dr6ZHq63/FXDwRCEB3/kaL6cK6jCgsKCtzgL0zeZ8+BpZlHlDvesHsrBQo?=
 =?us-ascii?Q?dxTzMqKaxIy/ClH8WJN0elWoQp8XVHPYMBl1fX0V1KTT4O9UVmceSZ2Ht2dw?=
 =?us-ascii?Q?pzp+lCZp7VmhQgfY78JUuWUn6L+8HUz/2duz3cArm8kbOASONLRLu7EtNfGA?=
 =?us-ascii?Q?exhaWzTuQBHfnVCU/xwmm+LAw5eCWVtoGPOXb4CxG0FIX/HKRPAuITCTYKqS?=
 =?us-ascii?Q?51qLDAAxGiGdQqlQf4ANjwCOWIHNTlcjU3rA8XEuugUGb8IgiXMrs/J+NO/6?=
 =?us-ascii?Q?yCJKcJlx6re4tAT8HK/kzWCweFPHSQPm/fMU1B7UoY6X9EzmS1I/vGP4f48b?=
 =?us-ascii?Q?Yj01hmL+dZ590mfWv2iZn3U7odxWSXo4gSVot0Hq3QmI2+jjC2YV0rkICZ+P?=
 =?us-ascii?Q?+6SW0j5PvxqkV4X3klwbzHej7NuuY80H?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR10MB5672.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?xvqq8WCCGFf2Afv54q/hSskIyvCFeIF94YhYcQfGzZWDfNfU7lFsxQeBbY5D?=
 =?us-ascii?Q?ZJztnvAzlKHKXbKPfpg5AfbdpX0RE8VyccW47OHdMVGphfkoyPgc7rQiiGXI?=
 =?us-ascii?Q?coIZDJW+aI3vOYbTkS0EkiY7NyR+G6whIy0f9W5v+be/qzk4/xxFd80KTVcB?=
 =?us-ascii?Q?vg5V+TLLKctvmdriv4hcolGGD69DL61VyZTFjXO3yxXIy9rHXrlbQgo2sx54?=
 =?us-ascii?Q?aa1Z1fMTqW9zqnnJMNwPwqhHQr7Uh8fysp1Qk/fkET8JjQr1R2qufaoLxaaZ?=
 =?us-ascii?Q?ois6s8eGEAP+wxDQy8+jooVukbMgHVvqahEga1QKgXvNeOoDAh/8dri3guIh?=
 =?us-ascii?Q?0k9/PaK41Kq0SBioaQRJXVylGwAS5crY+uAdHXDFt640uLQf70NwMAYspJ37?=
 =?us-ascii?Q?qrta9M+V9QWRZT3RGYENfKLw8VD+aGyptID6HSY8Ii4IVSeokll/wjEC8ohH?=
 =?us-ascii?Q?3GsnsFHb2sqvVbAKkv2lsYiNDA7BTTqGOUbf468wEv3MVyJ8nCySHi1wK9DW?=
 =?us-ascii?Q?kv39GlSU5Ul9Vlda1zeECiKpK1oCXjMNTmwl8uJLpoM38ERIgirxmGx1DQkM?=
 =?us-ascii?Q?EmQ5Ls4AVVaIp5g4r5mlEpijInVpJDRwZiNdv1xG3sBZ10BI6X18vV19NRI1?=
 =?us-ascii?Q?k20/xm8P6I5TF0OaVVyI27jN7ZqST5htefHpngSAU4F68owjn6xUSR3wspDJ?=
 =?us-ascii?Q?Aw4qFNvqRKTKll4Ky0JvnhOaVP+8mYwUrivfpixIWzBJIeeXQo00jBhvlieE?=
 =?us-ascii?Q?CZqZZ2vTQIw/wsMrx3l20qyuHZuPbi6jMHn9IxxgSbm+cvBPzSRJlV93oSw+?=
 =?us-ascii?Q?YTfSJFTsxHUmJKX39cC4dmWr4f5L0LKlHs3pBeR0oau6AEIpIEyYzr6DA8en?=
 =?us-ascii?Q?yaRvmGMrySp7wrbaL3MpeAmCFrRQEOVhjGgRszTbs5UAKEEpqTN8eK+l9TFg?=
 =?us-ascii?Q?a3TNuzSEiQ/s4AbL/1VLCV1c/Kond7yarVVHKHSlNDEIZJ++T0d2i0y8RQyt?=
 =?us-ascii?Q?z/4e9GJGwglJnsdbuHco18XsLGdu0PBXobfEEB617i61Gi1+oYq4EbkNoE9o?=
 =?us-ascii?Q?i8Fx021HKInPpWmk/3cKsKVjTiZBLDEYih9sfZvPqNo7rpO6jgdnnWml85dx?=
 =?us-ascii?Q?yhSVSJbnUbar+sX6x6h+NbwAT53wOz41nhJJcOroEvEMmiFK4xwNRBmbYdpr?=
 =?us-ascii?Q?BGImCCt8UUMFwaLZUpiZP3Z6AqXsl6T3bjj8eJ5nBKFSDXTdcrCwU7udRapZ?=
 =?us-ascii?Q?On/aWejSBGz1jihmnnWiseWMWkeDDvTnTSw5CY/3cXrw0VWATRsTUNo8okSD?=
 =?us-ascii?Q?7aV3VypgwTV8Yzl2Brthh6gZQozY8EwS+dIKdt+MxG07GApg2bd10d/Z+D4D?=
 =?us-ascii?Q?5iNkdtCIwY3cPnOex6dWrNDwBzXzwqVrnVQmdBvrcQ3Qhfc4LpP+6Yja8xBX?=
 =?us-ascii?Q?yk+2+F+lurIp2JaKQyLx0S8EBnuwfjOJoyHyi0FS2QuBvDJaqR0iByArnxDn?=
 =?us-ascii?Q?VsM2oJ9FG91Yaw6QtYQVAtORTjNxomsEKfLGXXgEEgkRyjByvqkTKJ1aG8VS?=
 =?us-ascii?Q?/Hypc733A92QTuTR0X1sfPImmbjuLLli+sVCi+iRH+6GMoApjvQtBrsw9NgO?=
 =?us-ascii?Q?cQ=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	ehjce5JoCIuxtIBW2EgyTfcyMJuQ845GsqVz+XdxeOXBedmkKZLBBy88e3eqEaW5qhnBdnyT/aniY1nDid0m6usD+i3DT3Neu17ZWviiTk6+TzFCCi8GDlwGk2UkWqexG6TOzD2UNSFfrv/r8LY2Wsr9D0bxre3RTXSLbEfcdwvWmS60STw6AQZfcnz4w34YwR5ZPM/XAirBLBC5Z99cTAjAcNTapeWZ22B+YJME2RUyLrUrHr/Enu1WW9kPLPCRlsPRpurK51QN1OlObC3teUyzldc/oRgtiy78AvTaI8tOwThM74kpIE/t7/cNmGd9M4gfAfx/IKeTnStyUCKF7RCSsozYx/tumbzHSUpVmCxK6IObNCsHR65EuloDdoF6kntK90a/1MO5LA2lN8vMFgKT1ON8pTEvtGBTYMVMdglz978JI/CLITR+i7C1nnA8f8ZfILfGlz6iip/Y1K1oWCnoRP0xmJG5bBqlGwQhNvOwJ8Syfc3RD/QVN2DVkXP/+x6DzvNjgYrEkpR72dI+OvNTdkavX+CiNgRZ/S7Ytzm7i4pMKS5oH4EUvLnYPjHjF+f6YuLZmWXX33h2wIw91IZCam711QbIak7NLoQ8BZ4=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b2fc5ef1-73fd-4133-d06a-08ddc8a5d72a
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR10MB5672.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2025 22:27:56.5374
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zVbRnV6eVg3e/8TXM7WFnaRocz5Tb9q2LmnTDYGDcdyQm0oMUauRyp3aZxyYmKAXrCg8U6P8modUXjdRmg/GIrZo4XFZOYTsKtbMYujpY2s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR10MB7357
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-21_05,2025-07-21_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 bulkscore=0 mlxscore=0
 suspectscore=0 malwarescore=0 spamscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2507210201
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIxMDIwMSBTYWx0ZWRfX087gELTdE3kG
 2VNlKwK2ljVcZHl5nj7ipU7HUCuUtvAXET4pRjxrODEGAQIPwK44JiusCHDEEUMlGYz3TnIVSGB
 IAzeHpa5qN5QO/YNIorWXOGa6BQnvXItBw4Xss8MIsTIU4+IQaq6MVs8OUON6Fxr9t3nMrdSkJB
 u6DXYQxrlD4+LsJ96PoW0LBxP8yi4HA7nh0PIxtpUYziJD2+f+FgVnosW3+UiOPssnYZ/4ku39m
 e9IWnPmSvF2euK469CGCNHVSZEsHS0oIt7/2UL92USqJblSRBpM7HPbiagxp1aTJB7qubJb5aPz
 h6i46tLvJfKECfuKzxrneqNQdvDH3Rd8SzOXARDpxxHB5NIA3IKP9MZQJGYmzicyfW0h6uex49h
 pUEC0I+JtOai9+SHmGt2us4omGZBqp7UVxJw8dTKLDjdO2+fWactdG+qmIeIiTHNT0uA0TVn
X-Proofpoint-GUID: mtlSJqcIRTkXpeCaNuYXkq0zxKPEtcaQ
X-Authority-Analysis: v=2.4 cv=IsYecK/g c=1 sm=1 tr=0 ts=687ebf0d b=1 cx=c_pps
 a=e1sVV491RgrpLwSTMOnk8w==:117 a=e1sVV491RgrpLwSTMOnk8w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=Wb1JkmetP80A:10 a=GoEa3M9JfhUA:10
 a=yPCof4ZbAAAA:8 a=43j2F5EROn3yoxlPOUEA:9 a=7YNkJrQCDtm0XhcG:21
 a=CjuIK1q_8ugA:10 cc=ntf awl=host:13600
X-Proofpoint-ORIG-GUID: mtlSJqcIRTkXpeCaNuYXkq0zxKPEtcaQ

On Wed, Jul 09, 2025 at 03:46:59PM +0100, Alan Maguire via DTrace-devel wrote:
> Sync dlibs with libdtrace versions.
> 
> Signed-off-by: Alan Maguire <alan.maguire@oracle.com>

Reviewed-by: Kris Van Hees <kris.van.hees@oracle.com>

> ---
>  dlibs/aarch64/5.11/ip.d  | 27 +---------------
>  dlibs/aarch64/5.11/net.d | 31 +++++++++++++++++--
>  dlibs/aarch64/5.11/tcp.d | 67 ++++++++++++++++++++++++----------------
>  dlibs/aarch64/5.12/ip.d  | 27 +---------------
>  dlibs/aarch64/5.12/net.d | 31 +++++++++++++++++--
>  dlibs/aarch64/5.12/tcp.d | 67 ++++++++++++++++++++++++----------------
>  dlibs/aarch64/5.14/ip.d  | 27 +---------------
>  dlibs/aarch64/5.14/net.d | 31 +++++++++++++++++--
>  dlibs/aarch64/5.14/tcp.d | 67 ++++++++++++++++++++++++----------------
>  dlibs/aarch64/5.16/ip.d  | 27 +---------------
>  dlibs/aarch64/5.16/net.d | 31 +++++++++++++++++--
>  dlibs/aarch64/5.16/tcp.d | 67 ++++++++++++++++++++++++----------------
>  dlibs/aarch64/5.2/ip.d   | 27 +---------------
>  dlibs/aarch64/5.2/net.d  | 31 +++++++++++++++++--
>  dlibs/aarch64/5.2/tcp.d  | 67 ++++++++++++++++++++++++----------------
>  dlibs/aarch64/5.6/ip.d   | 27 +---------------
>  dlibs/aarch64/5.6/net.d  | 31 +++++++++++++++++--
>  dlibs/aarch64/5.6/tcp.d  | 67 ++++++++++++++++++++++++----------------
>  dlibs/aarch64/6.1/ip.d   | 27 +---------------
>  dlibs/aarch64/6.1/net.d  | 31 +++++++++++++++++--
>  dlibs/aarch64/6.1/tcp.d  | 67 ++++++++++++++++++++++++----------------
>  dlibs/aarch64/6.10/ip.d  | 27 +---------------
>  dlibs/aarch64/6.10/net.d | 31 +++++++++++++++++--
>  dlibs/aarch64/6.10/tcp.d | 67 ++++++++++++++++++++++++----------------
>  dlibs/x86_64/5.11/ip.d   | 27 +---------------
>  dlibs/x86_64/5.11/net.d  | 31 +++++++++++++++++--
>  dlibs/x86_64/5.11/tcp.d  | 67 ++++++++++++++++++++++++----------------
>  dlibs/x86_64/5.12/ip.d   | 27 +---------------
>  dlibs/x86_64/5.12/net.d  | 31 +++++++++++++++++--
>  dlibs/x86_64/5.12/tcp.d  | 67 ++++++++++++++++++++++++----------------
>  dlibs/x86_64/5.14/ip.d   | 27 +---------------
>  dlibs/x86_64/5.14/net.d  | 31 +++++++++++++++++--
>  dlibs/x86_64/5.14/tcp.d  | 67 ++++++++++++++++++++++++----------------
>  dlibs/x86_64/5.16/ip.d   | 27 +---------------
>  dlibs/x86_64/5.16/net.d  | 31 +++++++++++++++++--
>  dlibs/x86_64/5.16/tcp.d  | 67 ++++++++++++++++++++++++----------------
>  dlibs/x86_64/5.2/ip.d    | 27 +---------------
>  dlibs/x86_64/5.2/net.d   | 31 +++++++++++++++++--
>  dlibs/x86_64/5.2/tcp.d   | 67 ++++++++++++++++++++++++----------------
>  dlibs/x86_64/5.6/ip.d    | 27 +---------------
>  dlibs/x86_64/5.6/net.d   | 31 +++++++++++++++++--
>  dlibs/x86_64/5.6/tcp.d   | 67 ++++++++++++++++++++++++----------------
>  dlibs/x86_64/6.1/ip.d    | 27 +---------------
>  dlibs/x86_64/6.1/net.d   | 31 +++++++++++++++++--
>  dlibs/x86_64/6.1/tcp.d   | 67 ++++++++++++++++++++++++----------------
>  dlibs/x86_64/6.10/ip.d   | 27 +---------------
>  dlibs/x86_64/6.10/net.d  | 31 +++++++++++++++++--
>  dlibs/x86_64/6.10/tcp.d  | 67 ++++++++++++++++++++++++----------------
>  48 files changed, 1120 insertions(+), 880 deletions(-)
> 
> diff --git a/dlibs/aarch64/5.11/ip.d b/dlibs/aarch64/5.11/ip.d
> index f8b77f12..493b75a0 100644
> --- a/dlibs/aarch64/5.11/ip.d
> +++ b/dlibs/aarch64/5.11/ip.d
> @@ -1,6 +1,6 @@
>  /*
>   * Oracle Linux DTrace.
> - * Copyright (c) 2007, 2023, Oracle and/or its affiliates. All rights reserved.
> + * Copyright (c) 2007, 2025, Oracle and/or its affiliates. All rights reserved.
>   * Licensed under the Universal Permissive License v 1.0 as shown at
>   * http://oss.oracle.com/licenses/upl.
>   */
> @@ -46,31 +46,6 @@ inline int IPPROTO_MH		=	135;
>  
>  inline int TCP_MIN_HEADER_LENGTH =	20;
>  
> -/*
> - * For compatibility with Solaris.  Here the netstackid will be the pointer
> - * to the net namespace (nd_net in struct net_device).
> - */
> -typedef uint64_t	netstackid_t;
> -typedef __be32		ipaddr_t;
> -typedef struct in6_addr	in6_addr_t;
> -
> -/*
> - * pktinfo is where packet ID info can be made available for deeper
> - * analysis if packet IDs become supported by the kernel in the future.
> - * The pkt_addr member is currently always NULL.
> - */
> -typedef struct pktinfo {
> -	uintptr_t pkt_addr;
> -} pktinfo_t;
> -
> -/*
> - * csinfo is where connection state info is made available.
> - */
> -typedef struct csinfo {
> -	uintptr_t cs_addr;
> -	uint64_t cs_cid;
> -} csinfo_t;
> -
>  /*
>   * ipinfo contains common IP info for both IPv4 and IPv6.
>   */
> diff --git a/dlibs/aarch64/5.11/net.d b/dlibs/aarch64/5.11/net.d
> index 6ac34287..f1291696 100644
> --- a/dlibs/aarch64/5.11/net.d
> +++ b/dlibs/aarch64/5.11/net.d
> @@ -1,6 +1,6 @@
>  /*
>   * Oracle Linux DTrace.
> - * Copyright (c) 2007, 2017, Oracle and/or its affiliates. All rights reserved.
> + * Copyright (c) 2007, 2025, Oracle and/or its affiliates. All rights reserved.
>   * Licensed under the Universal Permissive License v 1.0 as shown at
>   * http://oss.oracle.com/licenses/upl.
>   */
> @@ -25,9 +25,36 @@ typedef struct conninfo {
>  	 string ci_protocol;	/* protocol (ipv4, ipv6, etc) */
>  } conninfo_t;
>  
> +/*
> + * For compatibility with Solaris.  Here the netstackid will be the pointer
> + * to the net namespace (nd_net in struct net_device).
> + */
> +typedef uint64_t	netstackid_t;
> +typedef __be32		ipaddr_t;
> +typedef struct in6_addr	in6_addr_t;
> +
> +/*
> + * pktinfo is where packet ID info can be made available for deeper
> + * analysis if packet IDs become supported by the kernel in the future.
> + * The pkt_addr member is currently always NULL.
> + */
> +typedef struct pktinfo {
> +	uintptr_t pkt_addr;
> +} pktinfo_t;
> +
> +/*
> + * csinfo is where connection state info is made available.
> + */
> +typedef struct csinfo {
> +	uintptr_t cs_addr;
> +	uint64_t cs_cid;
> +} csinfo_t;
> +
>  /*
>   * We use these values to determine if a probe point is associated
> - * with sending (outbound) or receiving (inbound).
> + * with sending (outbound) or receiving (inbound) or a state-related
> + * probe (i.e. neither inbound our outbound).
>   */
>  inline int NET_PROBE_OUTBOUND =		0x00;
>  inline int NET_PROBE_INBOUND =		0x01;
> +inline int NET_PROBE_STATE =		0x02;
> diff --git a/dlibs/aarch64/5.11/tcp.d b/dlibs/aarch64/5.11/tcp.d
> index 54e310cb..48d9adb4 100644
> --- a/dlibs/aarch64/5.11/tcp.d
> +++ b/dlibs/aarch64/5.11/tcp.d
> @@ -1,13 +1,13 @@
>  /*
>   * Oracle Linux DTrace.
> - * Copyright (c) 2010, 2017, Oracle and/or its affiliates. All rights reserved.
> + * Copyright (c) 2010, 2025, Oracle and/or its affiliates. All rights reserved.
>   * Licensed under the Universal Permissive License v 1.0 as shown at
>   * http://oss.oracle.com/licenses/upl.
>   */
>  
>  #pragma D depends_on module vmlinux
>  #pragma D depends_on library net.d
> -#pragma D depends_on provider ip
> +#pragma D depends_on library ip.d
>  #pragma D depends_on provider tcp
>  
>  inline int TH_FIN =	0x01;
> @@ -111,30 +111,38 @@ translator tcpinfo_t < struct tcphdr *T > {
>  	tcp_seq = T ? ntohl(T->seq) : 0;
>  	tcp_ack = T ? ntohl(T->ack_seq) : 0;
>  	tcp_offset = T ? (*(uint8_t *)(T + 12) & 0xf0) >> 2 : 0;
> -	tcp_flags = T ? *(uint8_t *)(T + 13) : 0;
> +	tcp_flags = T ? *((uint8_t *)T + 13) : 0;
>  	tcp_window = T ? ntohs(T->window) : 0;
>  	tcp_checksum = T ? ntohs(T->check) : 0;
>  	tcp_urgent = T ? ntohs(T->urg_ptr) : 0;
>  	tcp_hdr = (uintptr_t)T;
>  };
>  
> +/* timewait sockets and inet connection sockets do not populate all fields
> + * and are not classified as full sockets; this inline helps translators
> + * spot them and act appropriately.
> + */
> +inline int tcp_fullsock[struct tcp_sock *sk] =
> +	(((struct sock_common *)sk)->skc_state != TCP_STATE_SYN_RECEIVED &&
> +	 ((struct sock_common *)sk)->skc_state != TCP_STATE_TIME_WAIT);
>  /*
>   * In the main we simply translate from the "struct [tcp_]sock *" to
>   * a tcpsinfo_t *.  However there are a few exceptions:
>   *
> - * - tcps_state is always derived from arg6.  The reason is that in some
> + * - tcps_state for state-change is arg5.  The reason is that in some
>   * state transitions sock->sk_state does not reflect the actual TCP
>   * connection state.  For example the TIME_WAIT state is handled in
>   * Linux by creating a separate timewait socket and the state of the
>   * original socket is CLOSED.  In some other cases we also need to
> - * instrument state transition prior to the update of sk_state.  To do
> - * all of this we rely on arg6.
> + * instrument state transition _prior_ to the update of sk_state.  To do
> + * all of this we rely on arg5 to hold the new state. arg6 is set to
> + * NET_PROBE_STATE to quickly identify state-change probes.
>   * - we sometimes need to retrieve local/remote port/address settings from
>   * TCP and IP headers directly, for example prior to the address/port
>   * being committed to the socket.  To do this effectively we need to know
>   * if the packet data is inbound (in which case the local IP/port are the
>   * destination) or outbound (in which case the local IP/port are the source).
> - * arg7 is set to 0 for outbound traffic and 1 for inbound so we use these
> + * arg6 is set to 0 for outbound traffic and 1 for inbound so we use these
>   * to reconstruct the address/port info where necessary.  arg2 used for IP
>   * information while arg4 contains the TCP header, so it is used for port data.
>   * NET_PROBE_INBOUND is defined as 1, NET_PROBE_OUTBOUND as 0 in net.d.
> @@ -158,47 +166,49 @@ translator tcpsinfo_t < struct tcp_sock *T > {
>              ((uint32_t *)&((struct sock *)T)->__sk_common.skc_v6_daddr)[2] &&
>  	    ((uint32_t *)&((struct sock *)T)->__sk_common.skc_v6_rcv_saddr)[3])
>  	    : 0;
> -	tcps_lport = (T && ((struct inet_sock *)T)->inet_sport != 0) ?
> +	tcps_lport = T && ((struct inet_sock *)T)->inet_sport != 0 &&
> +	    tcp_fullsock[T] ?
>  	    ntohs(((struct inet_sock *)T)->inet_sport) :
>  	    (T && ((struct inet_sock *)T)->inet_sport == 0) ?
> -	    ntohs(((struct sock *)T)->__sk_common.skc_num) :
> +	    ((struct sock *)T)->__sk_common.skc_num :
>  	    arg4 != NULL ?
>  	    ntohs(arg7 == NET_PROBE_INBOUND ?
> -	    ((struct tcphdr *)arg4)->dest : ((struct tcphdr *)arg4)->source) :
> +		  ((struct tcphdr *)arg4)->dest :
> +		  ((struct tcphdr *)arg4)->source) :
>  	    0;
>  	tcps_rport = T && ((struct sock *)T)->__sk_common.skc_dport != 0 ?
>  	    ntohs(((struct sock *)T)->__sk_common.skc_dport) :
>  	    arg4 != NULL ?
>  	    ntohs(arg7 == NET_PROBE_INBOUND ?
> -            ((struct tcphdr *)arg4)->source : ((struct tcphdr *)arg4)->dest) :
> +		  ((struct tcphdr *)arg4)->source :
> +		  ((struct tcphdr *)arg4)->dest) :
>  	    0;
>  	tcps_laddr =
>  	    T && ((struct sock *)T)->__sk_common.skc_family == AF_INET ?
>  	    inet_ntoa(&((struct sock *)T)->__sk_common.skc_rcv_saddr) :
>  	    T && ((struct sock *)T)->__sk_common.skc_family == AF_INET6 ?
>  	    inet_ntoa6(&((struct sock *)T)->__sk_common.skc_v6_rcv_saddr) :
> -	    arg2 != NULL && (*(uint8_t *)arg2) >> 4 == 4 ?
> -	    inet_ntoa(arg7 == NET_PROBE_INBOUND ?
> -	    &((struct iphdr *)arg2)->daddr : &((struct iphdr *)arg2)->saddr) :
> -	    arg2 != NULL && *((uint8_t *)arg2) >> 4 == 6 ?
> -	    inet_ntoa6(arg7 == NET_PROBE_INBOUND ?
> -	    &((struct ipv6hdr *)arg2)->daddr :
> -	    &((struct ipv6hdr *)arg2)->saddr) :
> +	    arg2 != NULL && (*(uint8_t *)arg2 >> 4) == 4 ?
> +	    inet_ntoa(&((struct iphdr *)arg2)->daddr) :
> +	    arg2 != NULL && (*(uint8_t *)arg2 >> 4) == 6 ?
> +	    inet_ntoa6(&((struct ipv6hdr *)arg2)->daddr) :
>  	    "<unknown>";
>  	tcps_raddr =
>  	    T && ((struct sock *)T)->__sk_common.skc_family == AF_INET ?
>  	    inet_ntoa(&((struct sock *)T)->__sk_common.skc_daddr) :
>  	    T && ((struct sock *)T)->__sk_common.skc_family == AF_INET6 ?
>  	    inet_ntoa6(&((struct sock *)T)->__sk_common.skc_v6_daddr) :
> -	    arg2 != NULL && (*(uint8_t *)arg2) >> 4 == 4 ?
> -	    inet_ntoa(arg7 == NET_PROBE_INBOUND ?
> -	    &((struct iphdr *)arg2)->saddr : &((struct iphdr *)arg2)->daddr) :
> -	    arg2 != NULL && *((uint8_t *)arg2) >> 4 == 6 ?
> -	    inet_ntoa6(arg7 == NET_PROBE_INBOUND ?
> -	    &((struct ipv6hdr *)arg2)->saddr :
> -	    &((struct ipv6hdr *)arg2)->daddr) :
> +	    arg2 != NULL && (*(uint8_t *)arg2 >> 4) == 4 ?
> +	    inet_ntoa(&((struct iphdr *)arg2)->saddr) :
> +	    arg2 != NULL && (*(uint8_t *)arg2 >> 4) == 6 ?
> +	    inet_ntoa6(&((struct ipv6hdr *)arg2)->saddr) :
>  	    "<unknown>";
> -	tcps_state = arg6;
> +	/* For state-change we probe right before state has changed, but
> +	 * provider definition wants new state in tcps_state; for
> +	 * state-change probes the trampoline stores it in arg5.
> +	 */
> +	tcps_state = arg6 == NET_PROBE_STATE ? arg5 :
> +	    T ? ((struct sock *)T)->__sk_common.skc_state : 0;
>  	tcps_iss = T ?
>  	    T->snd_una - (uint32_t)T->bytes_acked : 0;
>  	tcps_suna = T ? T->snd_una : 0;
> @@ -225,7 +235,10 @@ translator tcpsinfo_t < struct tcp_sock *T > {
>  	    T->rcv_nxt - (uint32_t)T->bytes_received : 0;
>  };
>  
> +/* state-change trampoline stores new state in arg5; at time of firing,
> + * state has not been updated, so last state is in tcp_sock state.
> + */
>  #pragma D binding "1.6.3" translator
>  translator tcplsinfo_t < int I > {
> -	tcps_state = I;
> +	tcps_state = arg3 ? ((struct sock *)arg3)->__sk_common.skc_state : 0;
>  };
> diff --git a/dlibs/aarch64/5.12/ip.d b/dlibs/aarch64/5.12/ip.d
> index f8b77f12..493b75a0 100644
> --- a/dlibs/aarch64/5.12/ip.d
> +++ b/dlibs/aarch64/5.12/ip.d
> @@ -1,6 +1,6 @@
>  /*
>   * Oracle Linux DTrace.
> - * Copyright (c) 2007, 2023, Oracle and/or its affiliates. All rights reserved.
> + * Copyright (c) 2007, 2025, Oracle and/or its affiliates. All rights reserved.
>   * Licensed under the Universal Permissive License v 1.0 as shown at
>   * http://oss.oracle.com/licenses/upl.
>   */
> @@ -46,31 +46,6 @@ inline int IPPROTO_MH		=	135;
>  
>  inline int TCP_MIN_HEADER_LENGTH =	20;
>  
> -/*
> - * For compatibility with Solaris.  Here the netstackid will be the pointer
> - * to the net namespace (nd_net in struct net_device).
> - */
> -typedef uint64_t	netstackid_t;
> -typedef __be32		ipaddr_t;
> -typedef struct in6_addr	in6_addr_t;
> -
> -/*
> - * pktinfo is where packet ID info can be made available for deeper
> - * analysis if packet IDs become supported by the kernel in the future.
> - * The pkt_addr member is currently always NULL.
> - */
> -typedef struct pktinfo {
> -	uintptr_t pkt_addr;
> -} pktinfo_t;
> -
> -/*
> - * csinfo is where connection state info is made available.
> - */
> -typedef struct csinfo {
> -	uintptr_t cs_addr;
> -	uint64_t cs_cid;
> -} csinfo_t;
> -
>  /*
>   * ipinfo contains common IP info for both IPv4 and IPv6.
>   */
> diff --git a/dlibs/aarch64/5.12/net.d b/dlibs/aarch64/5.12/net.d
> index 6ac34287..f1291696 100644
> --- a/dlibs/aarch64/5.12/net.d
> +++ b/dlibs/aarch64/5.12/net.d
> @@ -1,6 +1,6 @@
>  /*
>   * Oracle Linux DTrace.
> - * Copyright (c) 2007, 2017, Oracle and/or its affiliates. All rights reserved.
> + * Copyright (c) 2007, 2025, Oracle and/or its affiliates. All rights reserved.
>   * Licensed under the Universal Permissive License v 1.0 as shown at
>   * http://oss.oracle.com/licenses/upl.
>   */
> @@ -25,9 +25,36 @@ typedef struct conninfo {
>  	 string ci_protocol;	/* protocol (ipv4, ipv6, etc) */
>  } conninfo_t;
>  
> +/*
> + * For compatibility with Solaris.  Here the netstackid will be the pointer
> + * to the net namespace (nd_net in struct net_device).
> + */
> +typedef uint64_t	netstackid_t;
> +typedef __be32		ipaddr_t;
> +typedef struct in6_addr	in6_addr_t;
> +
> +/*
> + * pktinfo is where packet ID info can be made available for deeper
> + * analysis if packet IDs become supported by the kernel in the future.
> + * The pkt_addr member is currently always NULL.
> + */
> +typedef struct pktinfo {
> +	uintptr_t pkt_addr;
> +} pktinfo_t;
> +
> +/*
> + * csinfo is where connection state info is made available.
> + */
> +typedef struct csinfo {
> +	uintptr_t cs_addr;
> +	uint64_t cs_cid;
> +} csinfo_t;
> +
>  /*
>   * We use these values to determine if a probe point is associated
> - * with sending (outbound) or receiving (inbound).
> + * with sending (outbound) or receiving (inbound) or a state-related
> + * probe (i.e. neither inbound our outbound).
>   */
>  inline int NET_PROBE_OUTBOUND =		0x00;
>  inline int NET_PROBE_INBOUND =		0x01;
> +inline int NET_PROBE_STATE =		0x02;
> diff --git a/dlibs/aarch64/5.12/tcp.d b/dlibs/aarch64/5.12/tcp.d
> index 54e310cb..48d9adb4 100644
> --- a/dlibs/aarch64/5.12/tcp.d
> +++ b/dlibs/aarch64/5.12/tcp.d
> @@ -1,13 +1,13 @@
>  /*
>   * Oracle Linux DTrace.
> - * Copyright (c) 2010, 2017, Oracle and/or its affiliates. All rights reserved.
> + * Copyright (c) 2010, 2025, Oracle and/or its affiliates. All rights reserved.
>   * Licensed under the Universal Permissive License v 1.0 as shown at
>   * http://oss.oracle.com/licenses/upl.
>   */
>  
>  #pragma D depends_on module vmlinux
>  #pragma D depends_on library net.d
> -#pragma D depends_on provider ip
> +#pragma D depends_on library ip.d
>  #pragma D depends_on provider tcp
>  
>  inline int TH_FIN =	0x01;
> @@ -111,30 +111,38 @@ translator tcpinfo_t < struct tcphdr *T > {
>  	tcp_seq = T ? ntohl(T->seq) : 0;
>  	tcp_ack = T ? ntohl(T->ack_seq) : 0;
>  	tcp_offset = T ? (*(uint8_t *)(T + 12) & 0xf0) >> 2 : 0;
> -	tcp_flags = T ? *(uint8_t *)(T + 13) : 0;
> +	tcp_flags = T ? *((uint8_t *)T + 13) : 0;
>  	tcp_window = T ? ntohs(T->window) : 0;
>  	tcp_checksum = T ? ntohs(T->check) : 0;
>  	tcp_urgent = T ? ntohs(T->urg_ptr) : 0;
>  	tcp_hdr = (uintptr_t)T;
>  };
>  
> +/* timewait sockets and inet connection sockets do not populate all fields
> + * and are not classified as full sockets; this inline helps translators
> + * spot them and act appropriately.
> + */
> +inline int tcp_fullsock[struct tcp_sock *sk] =
> +	(((struct sock_common *)sk)->skc_state != TCP_STATE_SYN_RECEIVED &&
> +	 ((struct sock_common *)sk)->skc_state != TCP_STATE_TIME_WAIT);
>  /*
>   * In the main we simply translate from the "struct [tcp_]sock *" to
>   * a tcpsinfo_t *.  However there are a few exceptions:
>   *
> - * - tcps_state is always derived from arg6.  The reason is that in some
> + * - tcps_state for state-change is arg5.  The reason is that in some
>   * state transitions sock->sk_state does not reflect the actual TCP
>   * connection state.  For example the TIME_WAIT state is handled in
>   * Linux by creating a separate timewait socket and the state of the
>   * original socket is CLOSED.  In some other cases we also need to
> - * instrument state transition prior to the update of sk_state.  To do
> - * all of this we rely on arg6.
> + * instrument state transition _prior_ to the update of sk_state.  To do
> + * all of this we rely on arg5 to hold the new state. arg6 is set to
> + * NET_PROBE_STATE to quickly identify state-change probes.
>   * - we sometimes need to retrieve local/remote port/address settings from
>   * TCP and IP headers directly, for example prior to the address/port
>   * being committed to the socket.  To do this effectively we need to know
>   * if the packet data is inbound (in which case the local IP/port are the
>   * destination) or outbound (in which case the local IP/port are the source).
> - * arg7 is set to 0 for outbound traffic and 1 for inbound so we use these
> + * arg6 is set to 0 for outbound traffic and 1 for inbound so we use these
>   * to reconstruct the address/port info where necessary.  arg2 used for IP
>   * information while arg4 contains the TCP header, so it is used for port data.
>   * NET_PROBE_INBOUND is defined as 1, NET_PROBE_OUTBOUND as 0 in net.d.
> @@ -158,47 +166,49 @@ translator tcpsinfo_t < struct tcp_sock *T > {
>              ((uint32_t *)&((struct sock *)T)->__sk_common.skc_v6_daddr)[2] &&
>  	    ((uint32_t *)&((struct sock *)T)->__sk_common.skc_v6_rcv_saddr)[3])
>  	    : 0;
> -	tcps_lport = (T && ((struct inet_sock *)T)->inet_sport != 0) ?
> +	tcps_lport = T && ((struct inet_sock *)T)->inet_sport != 0 &&
> +	    tcp_fullsock[T] ?
>  	    ntohs(((struct inet_sock *)T)->inet_sport) :
>  	    (T && ((struct inet_sock *)T)->inet_sport == 0) ?
> -	    ntohs(((struct sock *)T)->__sk_common.skc_num) :
> +	    ((struct sock *)T)->__sk_common.skc_num :
>  	    arg4 != NULL ?
>  	    ntohs(arg7 == NET_PROBE_INBOUND ?
> -	    ((struct tcphdr *)arg4)->dest : ((struct tcphdr *)arg4)->source) :
> +		  ((struct tcphdr *)arg4)->dest :
> +		  ((struct tcphdr *)arg4)->source) :
>  	    0;
>  	tcps_rport = T && ((struct sock *)T)->__sk_common.skc_dport != 0 ?
>  	    ntohs(((struct sock *)T)->__sk_common.skc_dport) :
>  	    arg4 != NULL ?
>  	    ntohs(arg7 == NET_PROBE_INBOUND ?
> -            ((struct tcphdr *)arg4)->source : ((struct tcphdr *)arg4)->dest) :
> +		  ((struct tcphdr *)arg4)->source :
> +		  ((struct tcphdr *)arg4)->dest) :
>  	    0;
>  	tcps_laddr =
>  	    T && ((struct sock *)T)->__sk_common.skc_family == AF_INET ?
>  	    inet_ntoa(&((struct sock *)T)->__sk_common.skc_rcv_saddr) :
>  	    T && ((struct sock *)T)->__sk_common.skc_family == AF_INET6 ?
>  	    inet_ntoa6(&((struct sock *)T)->__sk_common.skc_v6_rcv_saddr) :
> -	    arg2 != NULL && (*(uint8_t *)arg2) >> 4 == 4 ?
> -	    inet_ntoa(arg7 == NET_PROBE_INBOUND ?
> -	    &((struct iphdr *)arg2)->daddr : &((struct iphdr *)arg2)->saddr) :
> -	    arg2 != NULL && *((uint8_t *)arg2) >> 4 == 6 ?
> -	    inet_ntoa6(arg7 == NET_PROBE_INBOUND ?
> -	    &((struct ipv6hdr *)arg2)->daddr :
> -	    &((struct ipv6hdr *)arg2)->saddr) :
> +	    arg2 != NULL && (*(uint8_t *)arg2 >> 4) == 4 ?
> +	    inet_ntoa(&((struct iphdr *)arg2)->daddr) :
> +	    arg2 != NULL && (*(uint8_t *)arg2 >> 4) == 6 ?
> +	    inet_ntoa6(&((struct ipv6hdr *)arg2)->daddr) :
>  	    "<unknown>";
>  	tcps_raddr =
>  	    T && ((struct sock *)T)->__sk_common.skc_family == AF_INET ?
>  	    inet_ntoa(&((struct sock *)T)->__sk_common.skc_daddr) :
>  	    T && ((struct sock *)T)->__sk_common.skc_family == AF_INET6 ?
>  	    inet_ntoa6(&((struct sock *)T)->__sk_common.skc_v6_daddr) :
> -	    arg2 != NULL && (*(uint8_t *)arg2) >> 4 == 4 ?
> -	    inet_ntoa(arg7 == NET_PROBE_INBOUND ?
> -	    &((struct iphdr *)arg2)->saddr : &((struct iphdr *)arg2)->daddr) :
> -	    arg2 != NULL && *((uint8_t *)arg2) >> 4 == 6 ?
> -	    inet_ntoa6(arg7 == NET_PROBE_INBOUND ?
> -	    &((struct ipv6hdr *)arg2)->saddr :
> -	    &((struct ipv6hdr *)arg2)->daddr) :
> +	    arg2 != NULL && (*(uint8_t *)arg2 >> 4) == 4 ?
> +	    inet_ntoa(&((struct iphdr *)arg2)->saddr) :
> +	    arg2 != NULL && (*(uint8_t *)arg2 >> 4) == 6 ?
> +	    inet_ntoa6(&((struct ipv6hdr *)arg2)->saddr) :
>  	    "<unknown>";
> -	tcps_state = arg6;
> +	/* For state-change we probe right before state has changed, but
> +	 * provider definition wants new state in tcps_state; for
> +	 * state-change probes the trampoline stores it in arg5.
> +	 */
> +	tcps_state = arg6 == NET_PROBE_STATE ? arg5 :
> +	    T ? ((struct sock *)T)->__sk_common.skc_state : 0;
>  	tcps_iss = T ?
>  	    T->snd_una - (uint32_t)T->bytes_acked : 0;
>  	tcps_suna = T ? T->snd_una : 0;
> @@ -225,7 +235,10 @@ translator tcpsinfo_t < struct tcp_sock *T > {
>  	    T->rcv_nxt - (uint32_t)T->bytes_received : 0;
>  };
>  
> +/* state-change trampoline stores new state in arg5; at time of firing,
> + * state has not been updated, so last state is in tcp_sock state.
> + */
>  #pragma D binding "1.6.3" translator
>  translator tcplsinfo_t < int I > {
> -	tcps_state = I;
> +	tcps_state = arg3 ? ((struct sock *)arg3)->__sk_common.skc_state : 0;
>  };
> diff --git a/dlibs/aarch64/5.14/ip.d b/dlibs/aarch64/5.14/ip.d
> index f8b77f12..493b75a0 100644
> --- a/dlibs/aarch64/5.14/ip.d
> +++ b/dlibs/aarch64/5.14/ip.d
> @@ -1,6 +1,6 @@
>  /*
>   * Oracle Linux DTrace.
> - * Copyright (c) 2007, 2023, Oracle and/or its affiliates. All rights reserved.
> + * Copyright (c) 2007, 2025, Oracle and/or its affiliates. All rights reserved.
>   * Licensed under the Universal Permissive License v 1.0 as shown at
>   * http://oss.oracle.com/licenses/upl.
>   */
> @@ -46,31 +46,6 @@ inline int IPPROTO_MH		=	135;
>  
>  inline int TCP_MIN_HEADER_LENGTH =	20;
>  
> -/*
> - * For compatibility with Solaris.  Here the netstackid will be the pointer
> - * to the net namespace (nd_net in struct net_device).
> - */
> -typedef uint64_t	netstackid_t;
> -typedef __be32		ipaddr_t;
> -typedef struct in6_addr	in6_addr_t;
> -
> -/*
> - * pktinfo is where packet ID info can be made available for deeper
> - * analysis if packet IDs become supported by the kernel in the future.
> - * The pkt_addr member is currently always NULL.
> - */
> -typedef struct pktinfo {
> -	uintptr_t pkt_addr;
> -} pktinfo_t;
> -
> -/*
> - * csinfo is where connection state info is made available.
> - */
> -typedef struct csinfo {
> -	uintptr_t cs_addr;
> -	uint64_t cs_cid;
> -} csinfo_t;
> -
>  /*
>   * ipinfo contains common IP info for both IPv4 and IPv6.
>   */
> diff --git a/dlibs/aarch64/5.14/net.d b/dlibs/aarch64/5.14/net.d
> index 6ac34287..f1291696 100644
> --- a/dlibs/aarch64/5.14/net.d
> +++ b/dlibs/aarch64/5.14/net.d
> @@ -1,6 +1,6 @@
>  /*
>   * Oracle Linux DTrace.
> - * Copyright (c) 2007, 2017, Oracle and/or its affiliates. All rights reserved.
> + * Copyright (c) 2007, 2025, Oracle and/or its affiliates. All rights reserved.
>   * Licensed under the Universal Permissive License v 1.0 as shown at
>   * http://oss.oracle.com/licenses/upl.
>   */
> @@ -25,9 +25,36 @@ typedef struct conninfo {
>  	 string ci_protocol;	/* protocol (ipv4, ipv6, etc) */
>  } conninfo_t;
>  
> +/*
> + * For compatibility with Solaris.  Here the netstackid will be the pointer
> + * to the net namespace (nd_net in struct net_device).
> + */
> +typedef uint64_t	netstackid_t;
> +typedef __be32		ipaddr_t;
> +typedef struct in6_addr	in6_addr_t;
> +
> +/*
> + * pktinfo is where packet ID info can be made available for deeper
> + * analysis if packet IDs become supported by the kernel in the future.
> + * The pkt_addr member is currently always NULL.
> + */
> +typedef struct pktinfo {
> +	uintptr_t pkt_addr;
> +} pktinfo_t;
> +
> +/*
> + * csinfo is where connection state info is made available.
> + */
> +typedef struct csinfo {
> +	uintptr_t cs_addr;
> +	uint64_t cs_cid;
> +} csinfo_t;
> +
>  /*
>   * We use these values to determine if a probe point is associated
> - * with sending (outbound) or receiving (inbound).
> + * with sending (outbound) or receiving (inbound) or a state-related
> + * probe (i.e. neither inbound our outbound).
>   */
>  inline int NET_PROBE_OUTBOUND =		0x00;
>  inline int NET_PROBE_INBOUND =		0x01;
> +inline int NET_PROBE_STATE =		0x02;
> diff --git a/dlibs/aarch64/5.14/tcp.d b/dlibs/aarch64/5.14/tcp.d
> index 54e310cb..48d9adb4 100644
> --- a/dlibs/aarch64/5.14/tcp.d
> +++ b/dlibs/aarch64/5.14/tcp.d
> @@ -1,13 +1,13 @@
>  /*
>   * Oracle Linux DTrace.
> - * Copyright (c) 2010, 2017, Oracle and/or its affiliates. All rights reserved.
> + * Copyright (c) 2010, 2025, Oracle and/or its affiliates. All rights reserved.
>   * Licensed under the Universal Permissive License v 1.0 as shown at
>   * http://oss.oracle.com/licenses/upl.
>   */
>  
>  #pragma D depends_on module vmlinux
>  #pragma D depends_on library net.d
> -#pragma D depends_on provider ip
> +#pragma D depends_on library ip.d
>  #pragma D depends_on provider tcp
>  
>  inline int TH_FIN =	0x01;
> @@ -111,30 +111,38 @@ translator tcpinfo_t < struct tcphdr *T > {
>  	tcp_seq = T ? ntohl(T->seq) : 0;
>  	tcp_ack = T ? ntohl(T->ack_seq) : 0;
>  	tcp_offset = T ? (*(uint8_t *)(T + 12) & 0xf0) >> 2 : 0;
> -	tcp_flags = T ? *(uint8_t *)(T + 13) : 0;
> +	tcp_flags = T ? *((uint8_t *)T + 13) : 0;
>  	tcp_window = T ? ntohs(T->window) : 0;
>  	tcp_checksum = T ? ntohs(T->check) : 0;
>  	tcp_urgent = T ? ntohs(T->urg_ptr) : 0;
>  	tcp_hdr = (uintptr_t)T;
>  };
>  
> +/* timewait sockets and inet connection sockets do not populate all fields
> + * and are not classified as full sockets; this inline helps translators
> + * spot them and act appropriately.
> + */
> +inline int tcp_fullsock[struct tcp_sock *sk] =
> +	(((struct sock_common *)sk)->skc_state != TCP_STATE_SYN_RECEIVED &&
> +	 ((struct sock_common *)sk)->skc_state != TCP_STATE_TIME_WAIT);
>  /*
>   * In the main we simply translate from the "struct [tcp_]sock *" to
>   * a tcpsinfo_t *.  However there are a few exceptions:
>   *
> - * - tcps_state is always derived from arg6.  The reason is that in some
> + * - tcps_state for state-change is arg5.  The reason is that in some
>   * state transitions sock->sk_state does not reflect the actual TCP
>   * connection state.  For example the TIME_WAIT state is handled in
>   * Linux by creating a separate timewait socket and the state of the
>   * original socket is CLOSED.  In some other cases we also need to
> - * instrument state transition prior to the update of sk_state.  To do
> - * all of this we rely on arg6.
> + * instrument state transition _prior_ to the update of sk_state.  To do
> + * all of this we rely on arg5 to hold the new state. arg6 is set to
> + * NET_PROBE_STATE to quickly identify state-change probes.
>   * - we sometimes need to retrieve local/remote port/address settings from
>   * TCP and IP headers directly, for example prior to the address/port
>   * being committed to the socket.  To do this effectively we need to know
>   * if the packet data is inbound (in which case the local IP/port are the
>   * destination) or outbound (in which case the local IP/port are the source).
> - * arg7 is set to 0 for outbound traffic and 1 for inbound so we use these
> + * arg6 is set to 0 for outbound traffic and 1 for inbound so we use these
>   * to reconstruct the address/port info where necessary.  arg2 used for IP
>   * information while arg4 contains the TCP header, so it is used for port data.
>   * NET_PROBE_INBOUND is defined as 1, NET_PROBE_OUTBOUND as 0 in net.d.
> @@ -158,47 +166,49 @@ translator tcpsinfo_t < struct tcp_sock *T > {
>              ((uint32_t *)&((struct sock *)T)->__sk_common.skc_v6_daddr)[2] &&
>  	    ((uint32_t *)&((struct sock *)T)->__sk_common.skc_v6_rcv_saddr)[3])
>  	    : 0;
> -	tcps_lport = (T && ((struct inet_sock *)T)->inet_sport != 0) ?
> +	tcps_lport = T && ((struct inet_sock *)T)->inet_sport != 0 &&
> +	    tcp_fullsock[T] ?
>  	    ntohs(((struct inet_sock *)T)->inet_sport) :
>  	    (T && ((struct inet_sock *)T)->inet_sport == 0) ?
> -	    ntohs(((struct sock *)T)->__sk_common.skc_num) :
> +	    ((struct sock *)T)->__sk_common.skc_num :
>  	    arg4 != NULL ?
>  	    ntohs(arg7 == NET_PROBE_INBOUND ?
> -	    ((struct tcphdr *)arg4)->dest : ((struct tcphdr *)arg4)->source) :
> +		  ((struct tcphdr *)arg4)->dest :
> +		  ((struct tcphdr *)arg4)->source) :
>  	    0;
>  	tcps_rport = T && ((struct sock *)T)->__sk_common.skc_dport != 0 ?
>  	    ntohs(((struct sock *)T)->__sk_common.skc_dport) :
>  	    arg4 != NULL ?
>  	    ntohs(arg7 == NET_PROBE_INBOUND ?
> -            ((struct tcphdr *)arg4)->source : ((struct tcphdr *)arg4)->dest) :
> +		  ((struct tcphdr *)arg4)->source :
> +		  ((struct tcphdr *)arg4)->dest) :
>  	    0;
>  	tcps_laddr =
>  	    T && ((struct sock *)T)->__sk_common.skc_family == AF_INET ?
>  	    inet_ntoa(&((struct sock *)T)->__sk_common.skc_rcv_saddr) :
>  	    T && ((struct sock *)T)->__sk_common.skc_family == AF_INET6 ?
>  	    inet_ntoa6(&((struct sock *)T)->__sk_common.skc_v6_rcv_saddr) :
> -	    arg2 != NULL && (*(uint8_t *)arg2) >> 4 == 4 ?
> -	    inet_ntoa(arg7 == NET_PROBE_INBOUND ?
> -	    &((struct iphdr *)arg2)->daddr : &((struct iphdr *)arg2)->saddr) :
> -	    arg2 != NULL && *((uint8_t *)arg2) >> 4 == 6 ?
> -	    inet_ntoa6(arg7 == NET_PROBE_INBOUND ?
> -	    &((struct ipv6hdr *)arg2)->daddr :
> -	    &((struct ipv6hdr *)arg2)->saddr) :
> +	    arg2 != NULL && (*(uint8_t *)arg2 >> 4) == 4 ?
> +	    inet_ntoa(&((struct iphdr *)arg2)->daddr) :
> +	    arg2 != NULL && (*(uint8_t *)arg2 >> 4) == 6 ?
> +	    inet_ntoa6(&((struct ipv6hdr *)arg2)->daddr) :
>  	    "<unknown>";
>  	tcps_raddr =
>  	    T && ((struct sock *)T)->__sk_common.skc_family == AF_INET ?
>  	    inet_ntoa(&((struct sock *)T)->__sk_common.skc_daddr) :
>  	    T && ((struct sock *)T)->__sk_common.skc_family == AF_INET6 ?
>  	    inet_ntoa6(&((struct sock *)T)->__sk_common.skc_v6_daddr) :
> -	    arg2 != NULL && (*(uint8_t *)arg2) >> 4 == 4 ?
> -	    inet_ntoa(arg7 == NET_PROBE_INBOUND ?
> -	    &((struct iphdr *)arg2)->saddr : &((struct iphdr *)arg2)->daddr) :
> -	    arg2 != NULL && *((uint8_t *)arg2) >> 4 == 6 ?
> -	    inet_ntoa6(arg7 == NET_PROBE_INBOUND ?
> -	    &((struct ipv6hdr *)arg2)->saddr :
> -	    &((struct ipv6hdr *)arg2)->daddr) :
> +	    arg2 != NULL && (*(uint8_t *)arg2 >> 4) == 4 ?
> +	    inet_ntoa(&((struct iphdr *)arg2)->saddr) :
> +	    arg2 != NULL && (*(uint8_t *)arg2 >> 4) == 6 ?
> +	    inet_ntoa6(&((struct ipv6hdr *)arg2)->saddr) :
>  	    "<unknown>";
> -	tcps_state = arg6;
> +	/* For state-change we probe right before state has changed, but
> +	 * provider definition wants new state in tcps_state; for
> +	 * state-change probes the trampoline stores it in arg5.
> +	 */
> +	tcps_state = arg6 == NET_PROBE_STATE ? arg5 :
> +	    T ? ((struct sock *)T)->__sk_common.skc_state : 0;
>  	tcps_iss = T ?
>  	    T->snd_una - (uint32_t)T->bytes_acked : 0;
>  	tcps_suna = T ? T->snd_una : 0;
> @@ -225,7 +235,10 @@ translator tcpsinfo_t < struct tcp_sock *T > {
>  	    T->rcv_nxt - (uint32_t)T->bytes_received : 0;
>  };
>  
> +/* state-change trampoline stores new state in arg5; at time of firing,
> + * state has not been updated, so last state is in tcp_sock state.
> + */
>  #pragma D binding "1.6.3" translator
>  translator tcplsinfo_t < int I > {
> -	tcps_state = I;
> +	tcps_state = arg3 ? ((struct sock *)arg3)->__sk_common.skc_state : 0;
>  };
> diff --git a/dlibs/aarch64/5.16/ip.d b/dlibs/aarch64/5.16/ip.d
> index f8b77f12..493b75a0 100644
> --- a/dlibs/aarch64/5.16/ip.d
> +++ b/dlibs/aarch64/5.16/ip.d
> @@ -1,6 +1,6 @@
>  /*
>   * Oracle Linux DTrace.
> - * Copyright (c) 2007, 2023, Oracle and/or its affiliates. All rights reserved.
> + * Copyright (c) 2007, 2025, Oracle and/or its affiliates. All rights reserved.
>   * Licensed under the Universal Permissive License v 1.0 as shown at
>   * http://oss.oracle.com/licenses/upl.
>   */
> @@ -46,31 +46,6 @@ inline int IPPROTO_MH		=	135;
>  
>  inline int TCP_MIN_HEADER_LENGTH =	20;
>  
> -/*
> - * For compatibility with Solaris.  Here the netstackid will be the pointer
> - * to the net namespace (nd_net in struct net_device).
> - */
> -typedef uint64_t	netstackid_t;
> -typedef __be32		ipaddr_t;
> -typedef struct in6_addr	in6_addr_t;
> -
> -/*
> - * pktinfo is where packet ID info can be made available for deeper
> - * analysis if packet IDs become supported by the kernel in the future.
> - * The pkt_addr member is currently always NULL.
> - */
> -typedef struct pktinfo {
> -	uintptr_t pkt_addr;
> -} pktinfo_t;
> -
> -/*
> - * csinfo is where connection state info is made available.
> - */
> -typedef struct csinfo {
> -	uintptr_t cs_addr;
> -	uint64_t cs_cid;
> -} csinfo_t;
> -
>  /*
>   * ipinfo contains common IP info for both IPv4 and IPv6.
>   */
> diff --git a/dlibs/aarch64/5.16/net.d b/dlibs/aarch64/5.16/net.d
> index 6ac34287..f1291696 100644
> --- a/dlibs/aarch64/5.16/net.d
> +++ b/dlibs/aarch64/5.16/net.d
> @@ -1,6 +1,6 @@
>  /*
>   * Oracle Linux DTrace.
> - * Copyright (c) 2007, 2017, Oracle and/or its affiliates. All rights reserved.
> + * Copyright (c) 2007, 2025, Oracle and/or its affiliates. All rights reserved.
>   * Licensed under the Universal Permissive License v 1.0 as shown at
>   * http://oss.oracle.com/licenses/upl.
>   */
> @@ -25,9 +25,36 @@ typedef struct conninfo {
>  	 string ci_protocol;	/* protocol (ipv4, ipv6, etc) */
>  } conninfo_t;
>  
> +/*
> + * For compatibility with Solaris.  Here the netstackid will be the pointer
> + * to the net namespace (nd_net in struct net_device).
> + */
> +typedef uint64_t	netstackid_t;
> +typedef __be32		ipaddr_t;
> +typedef struct in6_addr	in6_addr_t;
> +
> +/*
> + * pktinfo is where packet ID info can be made available for deeper
> + * analysis if packet IDs become supported by the kernel in the future.
> + * The pkt_addr member is currently always NULL.
> + */
> +typedef struct pktinfo {
> +	uintptr_t pkt_addr;
> +} pktinfo_t;
> +
> +/*
> + * csinfo is where connection state info is made available.
> + */
> +typedef struct csinfo {
> +	uintptr_t cs_addr;
> +	uint64_t cs_cid;
> +} csinfo_t;
> +
>  /*
>   * We use these values to determine if a probe point is associated
> - * with sending (outbound) or receiving (inbound).
> + * with sending (outbound) or receiving (inbound) or a state-related
> + * probe (i.e. neither inbound our outbound).
>   */
>  inline int NET_PROBE_OUTBOUND =		0x00;
>  inline int NET_PROBE_INBOUND =		0x01;
> +inline int NET_PROBE_STATE =		0x02;
> diff --git a/dlibs/aarch64/5.16/tcp.d b/dlibs/aarch64/5.16/tcp.d
> index 54e310cb..48d9adb4 100644
> --- a/dlibs/aarch64/5.16/tcp.d
> +++ b/dlibs/aarch64/5.16/tcp.d
> @@ -1,13 +1,13 @@
>  /*
>   * Oracle Linux DTrace.
> - * Copyright (c) 2010, 2017, Oracle and/or its affiliates. All rights reserved.
> + * Copyright (c) 2010, 2025, Oracle and/or its affiliates. All rights reserved.
>   * Licensed under the Universal Permissive License v 1.0 as shown at
>   * http://oss.oracle.com/licenses/upl.
>   */
>  
>  #pragma D depends_on module vmlinux
>  #pragma D depends_on library net.d
> -#pragma D depends_on provider ip
> +#pragma D depends_on library ip.d
>  #pragma D depends_on provider tcp
>  
>  inline int TH_FIN =	0x01;
> @@ -111,30 +111,38 @@ translator tcpinfo_t < struct tcphdr *T > {
>  	tcp_seq = T ? ntohl(T->seq) : 0;
>  	tcp_ack = T ? ntohl(T->ack_seq) : 0;
>  	tcp_offset = T ? (*(uint8_t *)(T + 12) & 0xf0) >> 2 : 0;
> -	tcp_flags = T ? *(uint8_t *)(T + 13) : 0;
> +	tcp_flags = T ? *((uint8_t *)T + 13) : 0;
>  	tcp_window = T ? ntohs(T->window) : 0;
>  	tcp_checksum = T ? ntohs(T->check) : 0;
>  	tcp_urgent = T ? ntohs(T->urg_ptr) : 0;
>  	tcp_hdr = (uintptr_t)T;
>  };
>  
> +/* timewait sockets and inet connection sockets do not populate all fields
> + * and are not classified as full sockets; this inline helps translators
> + * spot them and act appropriately.
> + */
> +inline int tcp_fullsock[struct tcp_sock *sk] =
> +	(((struct sock_common *)sk)->skc_state != TCP_STATE_SYN_RECEIVED &&
> +	 ((struct sock_common *)sk)->skc_state != TCP_STATE_TIME_WAIT);
>  /*
>   * In the main we simply translate from the "struct [tcp_]sock *" to
>   * a tcpsinfo_t *.  However there are a few exceptions:
>   *
> - * - tcps_state is always derived from arg6.  The reason is that in some
> + * - tcps_state for state-change is arg5.  The reason is that in some
>   * state transitions sock->sk_state does not reflect the actual TCP
>   * connection state.  For example the TIME_WAIT state is handled in
>   * Linux by creating a separate timewait socket and the state of the
>   * original socket is CLOSED.  In some other cases we also need to
> - * instrument state transition prior to the update of sk_state.  To do
> - * all of this we rely on arg6.
> + * instrument state transition _prior_ to the update of sk_state.  To do
> + * all of this we rely on arg5 to hold the new state. arg6 is set to
> + * NET_PROBE_STATE to quickly identify state-change probes.
>   * - we sometimes need to retrieve local/remote port/address settings from
>   * TCP and IP headers directly, for example prior to the address/port
>   * being committed to the socket.  To do this effectively we need to know
>   * if the packet data is inbound (in which case the local IP/port are the
>   * destination) or outbound (in which case the local IP/port are the source).
> - * arg7 is set to 0 for outbound traffic and 1 for inbound so we use these
> + * arg6 is set to 0 for outbound traffic and 1 for inbound so we use these
>   * to reconstruct the address/port info where necessary.  arg2 used for IP
>   * information while arg4 contains the TCP header, so it is used for port data.
>   * NET_PROBE_INBOUND is defined as 1, NET_PROBE_OUTBOUND as 0 in net.d.
> @@ -158,47 +166,49 @@ translator tcpsinfo_t < struct tcp_sock *T > {
>              ((uint32_t *)&((struct sock *)T)->__sk_common.skc_v6_daddr)[2] &&
>  	    ((uint32_t *)&((struct sock *)T)->__sk_common.skc_v6_rcv_saddr)[3])
>  	    : 0;
> -	tcps_lport = (T && ((struct inet_sock *)T)->inet_sport != 0) ?
> +	tcps_lport = T && ((struct inet_sock *)T)->inet_sport != 0 &&
> +	    tcp_fullsock[T] ?
>  	    ntohs(((struct inet_sock *)T)->inet_sport) :
>  	    (T && ((struct inet_sock *)T)->inet_sport == 0) ?
> -	    ntohs(((struct sock *)T)->__sk_common.skc_num) :
> +	    ((struct sock *)T)->__sk_common.skc_num :
>  	    arg4 != NULL ?
>  	    ntohs(arg7 == NET_PROBE_INBOUND ?
> -	    ((struct tcphdr *)arg4)->dest : ((struct tcphdr *)arg4)->source) :
> +		  ((struct tcphdr *)arg4)->dest :
> +		  ((struct tcphdr *)arg4)->source) :
>  	    0;
>  	tcps_rport = T && ((struct sock *)T)->__sk_common.skc_dport != 0 ?
>  	    ntohs(((struct sock *)T)->__sk_common.skc_dport) :
>  	    arg4 != NULL ?
>  	    ntohs(arg7 == NET_PROBE_INBOUND ?
> -            ((struct tcphdr *)arg4)->source : ((struct tcphdr *)arg4)->dest) :
> +		  ((struct tcphdr *)arg4)->source :
> +		  ((struct tcphdr *)arg4)->dest) :
>  	    0;
>  	tcps_laddr =
>  	    T && ((struct sock *)T)->__sk_common.skc_family == AF_INET ?
>  	    inet_ntoa(&((struct sock *)T)->__sk_common.skc_rcv_saddr) :
>  	    T && ((struct sock *)T)->__sk_common.skc_family == AF_INET6 ?
>  	    inet_ntoa6(&((struct sock *)T)->__sk_common.skc_v6_rcv_saddr) :
> -	    arg2 != NULL && (*(uint8_t *)arg2) >> 4 == 4 ?
> -	    inet_ntoa(arg7 == NET_PROBE_INBOUND ?
> -	    &((struct iphdr *)arg2)->daddr : &((struct iphdr *)arg2)->saddr) :
> -	    arg2 != NULL && *((uint8_t *)arg2) >> 4 == 6 ?
> -	    inet_ntoa6(arg7 == NET_PROBE_INBOUND ?
> -	    &((struct ipv6hdr *)arg2)->daddr :
> -	    &((struct ipv6hdr *)arg2)->saddr) :
> +	    arg2 != NULL && (*(uint8_t *)arg2 >> 4) == 4 ?
> +	    inet_ntoa(&((struct iphdr *)arg2)->daddr) :
> +	    arg2 != NULL && (*(uint8_t *)arg2 >> 4) == 6 ?
> +	    inet_ntoa6(&((struct ipv6hdr *)arg2)->daddr) :
>  	    "<unknown>";
>  	tcps_raddr =
>  	    T && ((struct sock *)T)->__sk_common.skc_family == AF_INET ?
>  	    inet_ntoa(&((struct sock *)T)->__sk_common.skc_daddr) :
>  	    T && ((struct sock *)T)->__sk_common.skc_family == AF_INET6 ?
>  	    inet_ntoa6(&((struct sock *)T)->__sk_common.skc_v6_daddr) :
> -	    arg2 != NULL && (*(uint8_t *)arg2) >> 4 == 4 ?
> -	    inet_ntoa(arg7 == NET_PROBE_INBOUND ?
> -	    &((struct iphdr *)arg2)->saddr : &((struct iphdr *)arg2)->daddr) :
> -	    arg2 != NULL && *((uint8_t *)arg2) >> 4 == 6 ?
> -	    inet_ntoa6(arg7 == NET_PROBE_INBOUND ?
> -	    &((struct ipv6hdr *)arg2)->saddr :
> -	    &((struct ipv6hdr *)arg2)->daddr) :
> +	    arg2 != NULL && (*(uint8_t *)arg2 >> 4) == 4 ?
> +	    inet_ntoa(&((struct iphdr *)arg2)->saddr) :
> +	    arg2 != NULL && (*(uint8_t *)arg2 >> 4) == 6 ?
> +	    inet_ntoa6(&((struct ipv6hdr *)arg2)->saddr) :
>  	    "<unknown>";
> -	tcps_state = arg6;
> +	/* For state-change we probe right before state has changed, but
> +	 * provider definition wants new state in tcps_state; for
> +	 * state-change probes the trampoline stores it in arg5.
> +	 */
> +	tcps_state = arg6 == NET_PROBE_STATE ? arg5 :
> +	    T ? ((struct sock *)T)->__sk_common.skc_state : 0;
>  	tcps_iss = T ?
>  	    T->snd_una - (uint32_t)T->bytes_acked : 0;
>  	tcps_suna = T ? T->snd_una : 0;
> @@ -225,7 +235,10 @@ translator tcpsinfo_t < struct tcp_sock *T > {
>  	    T->rcv_nxt - (uint32_t)T->bytes_received : 0;
>  };
>  
> +/* state-change trampoline stores new state in arg5; at time of firing,
> + * state has not been updated, so last state is in tcp_sock state.
> + */
>  #pragma D binding "1.6.3" translator
>  translator tcplsinfo_t < int I > {
> -	tcps_state = I;
> +	tcps_state = arg3 ? ((struct sock *)arg3)->__sk_common.skc_state : 0;
>  };
> diff --git a/dlibs/aarch64/5.2/ip.d b/dlibs/aarch64/5.2/ip.d
> index f8b77f12..493b75a0 100644
> --- a/dlibs/aarch64/5.2/ip.d
> +++ b/dlibs/aarch64/5.2/ip.d
> @@ -1,6 +1,6 @@
>  /*
>   * Oracle Linux DTrace.
> - * Copyright (c) 2007, 2023, Oracle and/or its affiliates. All rights reserved.
> + * Copyright (c) 2007, 2025, Oracle and/or its affiliates. All rights reserved.
>   * Licensed under the Universal Permissive License v 1.0 as shown at
>   * http://oss.oracle.com/licenses/upl.
>   */
> @@ -46,31 +46,6 @@ inline int IPPROTO_MH		=	135;
>  
>  inline int TCP_MIN_HEADER_LENGTH =	20;
>  
> -/*
> - * For compatibility with Solaris.  Here the netstackid will be the pointer
> - * to the net namespace (nd_net in struct net_device).
> - */
> -typedef uint64_t	netstackid_t;
> -typedef __be32		ipaddr_t;
> -typedef struct in6_addr	in6_addr_t;
> -
> -/*
> - * pktinfo is where packet ID info can be made available for deeper
> - * analysis if packet IDs become supported by the kernel in the future.
> - * The pkt_addr member is currently always NULL.
> - */
> -typedef struct pktinfo {
> -	uintptr_t pkt_addr;
> -} pktinfo_t;
> -
> -/*
> - * csinfo is where connection state info is made available.
> - */
> -typedef struct csinfo {
> -	uintptr_t cs_addr;
> -	uint64_t cs_cid;
> -} csinfo_t;
> -
>  /*
>   * ipinfo contains common IP info for both IPv4 and IPv6.
>   */
> diff --git a/dlibs/aarch64/5.2/net.d b/dlibs/aarch64/5.2/net.d
> index 6ac34287..f1291696 100644
> --- a/dlibs/aarch64/5.2/net.d
> +++ b/dlibs/aarch64/5.2/net.d
> @@ -1,6 +1,6 @@
>  /*
>   * Oracle Linux DTrace.
> - * Copyright (c) 2007, 2017, Oracle and/or its affiliates. All rights reserved.
> + * Copyright (c) 2007, 2025, Oracle and/or its affiliates. All rights reserved.
>   * Licensed under the Universal Permissive License v 1.0 as shown at
>   * http://oss.oracle.com/licenses/upl.
>   */
> @@ -25,9 +25,36 @@ typedef struct conninfo {
>  	 string ci_protocol;	/* protocol (ipv4, ipv6, etc) */
>  } conninfo_t;
>  
> +/*
> + * For compatibility with Solaris.  Here the netstackid will be the pointer
> + * to the net namespace (nd_net in struct net_device).
> + */
> +typedef uint64_t	netstackid_t;
> +typedef __be32		ipaddr_t;
> +typedef struct in6_addr	in6_addr_t;
> +
> +/*
> + * pktinfo is where packet ID info can be made available for deeper
> + * analysis if packet IDs become supported by the kernel in the future.
> + * The pkt_addr member is currently always NULL.
> + */
> +typedef struct pktinfo {
> +	uintptr_t pkt_addr;
> +} pktinfo_t;
> +
> +/*
> + * csinfo is where connection state info is made available.
> + */
> +typedef struct csinfo {
> +	uintptr_t cs_addr;
> +	uint64_t cs_cid;
> +} csinfo_t;
> +
>  /*
>   * We use these values to determine if a probe point is associated
> - * with sending (outbound) or receiving (inbound).
> + * with sending (outbound) or receiving (inbound) or a state-related
> + * probe (i.e. neither inbound our outbound).
>   */
>  inline int NET_PROBE_OUTBOUND =		0x00;
>  inline int NET_PROBE_INBOUND =		0x01;
> +inline int NET_PROBE_STATE =		0x02;
> diff --git a/dlibs/aarch64/5.2/tcp.d b/dlibs/aarch64/5.2/tcp.d
> index 54e310cb..48d9adb4 100644
> --- a/dlibs/aarch64/5.2/tcp.d
> +++ b/dlibs/aarch64/5.2/tcp.d
> @@ -1,13 +1,13 @@
>  /*
>   * Oracle Linux DTrace.
> - * Copyright (c) 2010, 2017, Oracle and/or its affiliates. All rights reserved.
> + * Copyright (c) 2010, 2025, Oracle and/or its affiliates. All rights reserved.
>   * Licensed under the Universal Permissive License v 1.0 as shown at
>   * http://oss.oracle.com/licenses/upl.
>   */
>  
>  #pragma D depends_on module vmlinux
>  #pragma D depends_on library net.d
> -#pragma D depends_on provider ip
> +#pragma D depends_on library ip.d
>  #pragma D depends_on provider tcp
>  
>  inline int TH_FIN =	0x01;
> @@ -111,30 +111,38 @@ translator tcpinfo_t < struct tcphdr *T > {
>  	tcp_seq = T ? ntohl(T->seq) : 0;
>  	tcp_ack = T ? ntohl(T->ack_seq) : 0;
>  	tcp_offset = T ? (*(uint8_t *)(T + 12) & 0xf0) >> 2 : 0;
> -	tcp_flags = T ? *(uint8_t *)(T + 13) : 0;
> +	tcp_flags = T ? *((uint8_t *)T + 13) : 0;
>  	tcp_window = T ? ntohs(T->window) : 0;
>  	tcp_checksum = T ? ntohs(T->check) : 0;
>  	tcp_urgent = T ? ntohs(T->urg_ptr) : 0;
>  	tcp_hdr = (uintptr_t)T;
>  };
>  
> +/* timewait sockets and inet connection sockets do not populate all fields
> + * and are not classified as full sockets; this inline helps translators
> + * spot them and act appropriately.
> + */
> +inline int tcp_fullsock[struct tcp_sock *sk] =
> +	(((struct sock_common *)sk)->skc_state != TCP_STATE_SYN_RECEIVED &&
> +	 ((struct sock_common *)sk)->skc_state != TCP_STATE_TIME_WAIT);
>  /*
>   * In the main we simply translate from the "struct [tcp_]sock *" to
>   * a tcpsinfo_t *.  However there are a few exceptions:
>   *
> - * - tcps_state is always derived from arg6.  The reason is that in some
> + * - tcps_state for state-change is arg5.  The reason is that in some
>   * state transitions sock->sk_state does not reflect the actual TCP
>   * connection state.  For example the TIME_WAIT state is handled in
>   * Linux by creating a separate timewait socket and the state of the
>   * original socket is CLOSED.  In some other cases we also need to
> - * instrument state transition prior to the update of sk_state.  To do
> - * all of this we rely on arg6.
> + * instrument state transition _prior_ to the update of sk_state.  To do
> + * all of this we rely on arg5 to hold the new state. arg6 is set to
> + * NET_PROBE_STATE to quickly identify state-change probes.
>   * - we sometimes need to retrieve local/remote port/address settings from
>   * TCP and IP headers directly, for example prior to the address/port
>   * being committed to the socket.  To do this effectively we need to know
>   * if the packet data is inbound (in which case the local IP/port are the
>   * destination) or outbound (in which case the local IP/port are the source).
> - * arg7 is set to 0 for outbound traffic and 1 for inbound so we use these
> + * arg6 is set to 0 for outbound traffic and 1 for inbound so we use these
>   * to reconstruct the address/port info where necessary.  arg2 used for IP
>   * information while arg4 contains the TCP header, so it is used for port data.
>   * NET_PROBE_INBOUND is defined as 1, NET_PROBE_OUTBOUND as 0 in net.d.
> @@ -158,47 +166,49 @@ translator tcpsinfo_t < struct tcp_sock *T > {
>              ((uint32_t *)&((struct sock *)T)->__sk_common.skc_v6_daddr)[2] &&
>  	    ((uint32_t *)&((struct sock *)T)->__sk_common.skc_v6_rcv_saddr)[3])
>  	    : 0;
> -	tcps_lport = (T && ((struct inet_sock *)T)->inet_sport != 0) ?
> +	tcps_lport = T && ((struct inet_sock *)T)->inet_sport != 0 &&
> +	    tcp_fullsock[T] ?
>  	    ntohs(((struct inet_sock *)T)->inet_sport) :
>  	    (T && ((struct inet_sock *)T)->inet_sport == 0) ?
> -	    ntohs(((struct sock *)T)->__sk_common.skc_num) :
> +	    ((struct sock *)T)->__sk_common.skc_num :
>  	    arg4 != NULL ?
>  	    ntohs(arg7 == NET_PROBE_INBOUND ?
> -	    ((struct tcphdr *)arg4)->dest : ((struct tcphdr *)arg4)->source) :
> +		  ((struct tcphdr *)arg4)->dest :
> +		  ((struct tcphdr *)arg4)->source) :
>  	    0;
>  	tcps_rport = T && ((struct sock *)T)->__sk_common.skc_dport != 0 ?
>  	    ntohs(((struct sock *)T)->__sk_common.skc_dport) :
>  	    arg4 != NULL ?
>  	    ntohs(arg7 == NET_PROBE_INBOUND ?
> -            ((struct tcphdr *)arg4)->source : ((struct tcphdr *)arg4)->dest) :
> +		  ((struct tcphdr *)arg4)->source :
> +		  ((struct tcphdr *)arg4)->dest) :
>  	    0;
>  	tcps_laddr =
>  	    T && ((struct sock *)T)->__sk_common.skc_family == AF_INET ?
>  	    inet_ntoa(&((struct sock *)T)->__sk_common.skc_rcv_saddr) :
>  	    T && ((struct sock *)T)->__sk_common.skc_family == AF_INET6 ?
>  	    inet_ntoa6(&((struct sock *)T)->__sk_common.skc_v6_rcv_saddr) :
> -	    arg2 != NULL && (*(uint8_t *)arg2) >> 4 == 4 ?
> -	    inet_ntoa(arg7 == NET_PROBE_INBOUND ?
> -	    &((struct iphdr *)arg2)->daddr : &((struct iphdr *)arg2)->saddr) :
> -	    arg2 != NULL && *((uint8_t *)arg2) >> 4 == 6 ?
> -	    inet_ntoa6(arg7 == NET_PROBE_INBOUND ?
> -	    &((struct ipv6hdr *)arg2)->daddr :
> -	    &((struct ipv6hdr *)arg2)->saddr) :
> +	    arg2 != NULL && (*(uint8_t *)arg2 >> 4) == 4 ?
> +	    inet_ntoa(&((struct iphdr *)arg2)->daddr) :
> +	    arg2 != NULL && (*(uint8_t *)arg2 >> 4) == 6 ?
> +	    inet_ntoa6(&((struct ipv6hdr *)arg2)->daddr) :
>  	    "<unknown>";
>  	tcps_raddr =
>  	    T && ((struct sock *)T)->__sk_common.skc_family == AF_INET ?
>  	    inet_ntoa(&((struct sock *)T)->__sk_common.skc_daddr) :
>  	    T && ((struct sock *)T)->__sk_common.skc_family == AF_INET6 ?
>  	    inet_ntoa6(&((struct sock *)T)->__sk_common.skc_v6_daddr) :
> -	    arg2 != NULL && (*(uint8_t *)arg2) >> 4 == 4 ?
> -	    inet_ntoa(arg7 == NET_PROBE_INBOUND ?
> -	    &((struct iphdr *)arg2)->saddr : &((struct iphdr *)arg2)->daddr) :
> -	    arg2 != NULL && *((uint8_t *)arg2) >> 4 == 6 ?
> -	    inet_ntoa6(arg7 == NET_PROBE_INBOUND ?
> -	    &((struct ipv6hdr *)arg2)->saddr :
> -	    &((struct ipv6hdr *)arg2)->daddr) :
> +	    arg2 != NULL && (*(uint8_t *)arg2 >> 4) == 4 ?
> +	    inet_ntoa(&((struct iphdr *)arg2)->saddr) :
> +	    arg2 != NULL && (*(uint8_t *)arg2 >> 4) == 6 ?
> +	    inet_ntoa6(&((struct ipv6hdr *)arg2)->saddr) :
>  	    "<unknown>";
> -	tcps_state = arg6;
> +	/* For state-change we probe right before state has changed, but
> +	 * provider definition wants new state in tcps_state; for
> +	 * state-change probes the trampoline stores it in arg5.
> +	 */
> +	tcps_state = arg6 == NET_PROBE_STATE ? arg5 :
> +	    T ? ((struct sock *)T)->__sk_common.skc_state : 0;
>  	tcps_iss = T ?
>  	    T->snd_una - (uint32_t)T->bytes_acked : 0;
>  	tcps_suna = T ? T->snd_una : 0;
> @@ -225,7 +235,10 @@ translator tcpsinfo_t < struct tcp_sock *T > {
>  	    T->rcv_nxt - (uint32_t)T->bytes_received : 0;
>  };
>  
> +/* state-change trampoline stores new state in arg5; at time of firing,
> + * state has not been updated, so last state is in tcp_sock state.
> + */
>  #pragma D binding "1.6.3" translator
>  translator tcplsinfo_t < int I > {
> -	tcps_state = I;
> +	tcps_state = arg3 ? ((struct sock *)arg3)->__sk_common.skc_state : 0;
>  };
> diff --git a/dlibs/aarch64/5.6/ip.d b/dlibs/aarch64/5.6/ip.d
> index f8b77f12..493b75a0 100644
> --- a/dlibs/aarch64/5.6/ip.d
> +++ b/dlibs/aarch64/5.6/ip.d
> @@ -1,6 +1,6 @@
>  /*
>   * Oracle Linux DTrace.
> - * Copyright (c) 2007, 2023, Oracle and/or its affiliates. All rights reserved.
> + * Copyright (c) 2007, 2025, Oracle and/or its affiliates. All rights reserved.
>   * Licensed under the Universal Permissive License v 1.0 as shown at
>   * http://oss.oracle.com/licenses/upl.
>   */
> @@ -46,31 +46,6 @@ inline int IPPROTO_MH		=	135;
>  
>  inline int TCP_MIN_HEADER_LENGTH =	20;
>  
> -/*
> - * For compatibility with Solaris.  Here the netstackid will be the pointer
> - * to the net namespace (nd_net in struct net_device).
> - */
> -typedef uint64_t	netstackid_t;
> -typedef __be32		ipaddr_t;
> -typedef struct in6_addr	in6_addr_t;
> -
> -/*
> - * pktinfo is where packet ID info can be made available for deeper
> - * analysis if packet IDs become supported by the kernel in the future.
> - * The pkt_addr member is currently always NULL.
> - */
> -typedef struct pktinfo {
> -	uintptr_t pkt_addr;
> -} pktinfo_t;
> -
> -/*
> - * csinfo is where connection state info is made available.
> - */
> -typedef struct csinfo {
> -	uintptr_t cs_addr;
> -	uint64_t cs_cid;
> -} csinfo_t;
> -
>  /*
>   * ipinfo contains common IP info for both IPv4 and IPv6.
>   */
> diff --git a/dlibs/aarch64/5.6/net.d b/dlibs/aarch64/5.6/net.d
> index 6ac34287..f1291696 100644
> --- a/dlibs/aarch64/5.6/net.d
> +++ b/dlibs/aarch64/5.6/net.d
> @@ -1,6 +1,6 @@
>  /*
>   * Oracle Linux DTrace.
> - * Copyright (c) 2007, 2017, Oracle and/or its affiliates. All rights reserved.
> + * Copyright (c) 2007, 2025, Oracle and/or its affiliates. All rights reserved.
>   * Licensed under the Universal Permissive License v 1.0 as shown at
>   * http://oss.oracle.com/licenses/upl.
>   */
> @@ -25,9 +25,36 @@ typedef struct conninfo {
>  	 string ci_protocol;	/* protocol (ipv4, ipv6, etc) */
>  } conninfo_t;
>  
> +/*
> + * For compatibility with Solaris.  Here the netstackid will be the pointer
> + * to the net namespace (nd_net in struct net_device).
> + */
> +typedef uint64_t	netstackid_t;
> +typedef __be32		ipaddr_t;
> +typedef struct in6_addr	in6_addr_t;
> +
> +/*
> + * pktinfo is where packet ID info can be made available for deeper
> + * analysis if packet IDs become supported by the kernel in the future.
> + * The pkt_addr member is currently always NULL.
> + */
> +typedef struct pktinfo {
> +	uintptr_t pkt_addr;
> +} pktinfo_t;
> +
> +/*
> + * csinfo is where connection state info is made available.
> + */
> +typedef struct csinfo {
> +	uintptr_t cs_addr;
> +	uint64_t cs_cid;
> +} csinfo_t;
> +
>  /*
>   * We use these values to determine if a probe point is associated
> - * with sending (outbound) or receiving (inbound).
> + * with sending (outbound) or receiving (inbound) or a state-related
> + * probe (i.e. neither inbound our outbound).
>   */
>  inline int NET_PROBE_OUTBOUND =		0x00;
>  inline int NET_PROBE_INBOUND =		0x01;
> +inline int NET_PROBE_STATE =		0x02;
> diff --git a/dlibs/aarch64/5.6/tcp.d b/dlibs/aarch64/5.6/tcp.d
> index 54e310cb..48d9adb4 100644
> --- a/dlibs/aarch64/5.6/tcp.d
> +++ b/dlibs/aarch64/5.6/tcp.d
> @@ -1,13 +1,13 @@
>  /*
>   * Oracle Linux DTrace.
> - * Copyright (c) 2010, 2017, Oracle and/or its affiliates. All rights reserved.
> + * Copyright (c) 2010, 2025, Oracle and/or its affiliates. All rights reserved.
>   * Licensed under the Universal Permissive License v 1.0 as shown at
>   * http://oss.oracle.com/licenses/upl.
>   */
>  
>  #pragma D depends_on module vmlinux
>  #pragma D depends_on library net.d
> -#pragma D depends_on provider ip
> +#pragma D depends_on library ip.d
>  #pragma D depends_on provider tcp
>  
>  inline int TH_FIN =	0x01;
> @@ -111,30 +111,38 @@ translator tcpinfo_t < struct tcphdr *T > {
>  	tcp_seq = T ? ntohl(T->seq) : 0;
>  	tcp_ack = T ? ntohl(T->ack_seq) : 0;
>  	tcp_offset = T ? (*(uint8_t *)(T + 12) & 0xf0) >> 2 : 0;
> -	tcp_flags = T ? *(uint8_t *)(T + 13) : 0;
> +	tcp_flags = T ? *((uint8_t *)T + 13) : 0;
>  	tcp_window = T ? ntohs(T->window) : 0;
>  	tcp_checksum = T ? ntohs(T->check) : 0;
>  	tcp_urgent = T ? ntohs(T->urg_ptr) : 0;
>  	tcp_hdr = (uintptr_t)T;
>  };
>  
> +/* timewait sockets and inet connection sockets do not populate all fields
> + * and are not classified as full sockets; this inline helps translators
> + * spot them and act appropriately.
> + */
> +inline int tcp_fullsock[struct tcp_sock *sk] =
> +	(((struct sock_common *)sk)->skc_state != TCP_STATE_SYN_RECEIVED &&
> +	 ((struct sock_common *)sk)->skc_state != TCP_STATE_TIME_WAIT);
>  /*
>   * In the main we simply translate from the "struct [tcp_]sock *" to
>   * a tcpsinfo_t *.  However there are a few exceptions:
>   *
> - * - tcps_state is always derived from arg6.  The reason is that in some
> + * - tcps_state for state-change is arg5.  The reason is that in some
>   * state transitions sock->sk_state does not reflect the actual TCP
>   * connection state.  For example the TIME_WAIT state is handled in
>   * Linux by creating a separate timewait socket and the state of the
>   * original socket is CLOSED.  In some other cases we also need to
> - * instrument state transition prior to the update of sk_state.  To do
> - * all of this we rely on arg6.
> + * instrument state transition _prior_ to the update of sk_state.  To do
> + * all of this we rely on arg5 to hold the new state. arg6 is set to
> + * NET_PROBE_STATE to quickly identify state-change probes.
>   * - we sometimes need to retrieve local/remote port/address settings from
>   * TCP and IP headers directly, for example prior to the address/port
>   * being committed to the socket.  To do this effectively we need to know
>   * if the packet data is inbound (in which case the local IP/port are the
>   * destination) or outbound (in which case the local IP/port are the source).
> - * arg7 is set to 0 for outbound traffic and 1 for inbound so we use these
> + * arg6 is set to 0 for outbound traffic and 1 for inbound so we use these
>   * to reconstruct the address/port info where necessary.  arg2 used for IP
>   * information while arg4 contains the TCP header, so it is used for port data.
>   * NET_PROBE_INBOUND is defined as 1, NET_PROBE_OUTBOUND as 0 in net.d.
> @@ -158,47 +166,49 @@ translator tcpsinfo_t < struct tcp_sock *T > {
>              ((uint32_t *)&((struct sock *)T)->__sk_common.skc_v6_daddr)[2] &&
>  	    ((uint32_t *)&((struct sock *)T)->__sk_common.skc_v6_rcv_saddr)[3])
>  	    : 0;
> -	tcps_lport = (T && ((struct inet_sock *)T)->inet_sport != 0) ?
> +	tcps_lport = T && ((struct inet_sock *)T)->inet_sport != 0 &&
> +	    tcp_fullsock[T] ?
>  	    ntohs(((struct inet_sock *)T)->inet_sport) :
>  	    (T && ((struct inet_sock *)T)->inet_sport == 0) ?
> -	    ntohs(((struct sock *)T)->__sk_common.skc_num) :
> +	    ((struct sock *)T)->__sk_common.skc_num :
>  	    arg4 != NULL ?
>  	    ntohs(arg7 == NET_PROBE_INBOUND ?
> -	    ((struct tcphdr *)arg4)->dest : ((struct tcphdr *)arg4)->source) :
> +		  ((struct tcphdr *)arg4)->dest :
> +		  ((struct tcphdr *)arg4)->source) :
>  	    0;
>  	tcps_rport = T && ((struct sock *)T)->__sk_common.skc_dport != 0 ?
>  	    ntohs(((struct sock *)T)->__sk_common.skc_dport) :
>  	    arg4 != NULL ?
>  	    ntohs(arg7 == NET_PROBE_INBOUND ?
> -            ((struct tcphdr *)arg4)->source : ((struct tcphdr *)arg4)->dest) :
> +		  ((struct tcphdr *)arg4)->source :
> +		  ((struct tcphdr *)arg4)->dest) :
>  	    0;
>  	tcps_laddr =
>  	    T && ((struct sock *)T)->__sk_common.skc_family == AF_INET ?
>  	    inet_ntoa(&((struct sock *)T)->__sk_common.skc_rcv_saddr) :
>  	    T && ((struct sock *)T)->__sk_common.skc_family == AF_INET6 ?
>  	    inet_ntoa6(&((struct sock *)T)->__sk_common.skc_v6_rcv_saddr) :
> -	    arg2 != NULL && (*(uint8_t *)arg2) >> 4 == 4 ?
> -	    inet_ntoa(arg7 == NET_PROBE_INBOUND ?
> -	    &((struct iphdr *)arg2)->daddr : &((struct iphdr *)arg2)->saddr) :
> -	    arg2 != NULL && *((uint8_t *)arg2) >> 4 == 6 ?
> -	    inet_ntoa6(arg7 == NET_PROBE_INBOUND ?
> -	    &((struct ipv6hdr *)arg2)->daddr :
> -	    &((struct ipv6hdr *)arg2)->saddr) :
> +	    arg2 != NULL && (*(uint8_t *)arg2 >> 4) == 4 ?
> +	    inet_ntoa(&((struct iphdr *)arg2)->daddr) :
> +	    arg2 != NULL && (*(uint8_t *)arg2 >> 4) == 6 ?
> +	    inet_ntoa6(&((struct ipv6hdr *)arg2)->daddr) :
>  	    "<unknown>";
>  	tcps_raddr =
>  	    T && ((struct sock *)T)->__sk_common.skc_family == AF_INET ?
>  	    inet_ntoa(&((struct sock *)T)->__sk_common.skc_daddr) :
>  	    T && ((struct sock *)T)->__sk_common.skc_family == AF_INET6 ?
>  	    inet_ntoa6(&((struct sock *)T)->__sk_common.skc_v6_daddr) :
> -	    arg2 != NULL && (*(uint8_t *)arg2) >> 4 == 4 ?
> -	    inet_ntoa(arg7 == NET_PROBE_INBOUND ?
> -	    &((struct iphdr *)arg2)->saddr : &((struct iphdr *)arg2)->daddr) :
> -	    arg2 != NULL && *((uint8_t *)arg2) >> 4 == 6 ?
> -	    inet_ntoa6(arg7 == NET_PROBE_INBOUND ?
> -	    &((struct ipv6hdr *)arg2)->saddr :
> -	    &((struct ipv6hdr *)arg2)->daddr) :
> +	    arg2 != NULL && (*(uint8_t *)arg2 >> 4) == 4 ?
> +	    inet_ntoa(&((struct iphdr *)arg2)->saddr) :
> +	    arg2 != NULL && (*(uint8_t *)arg2 >> 4) == 6 ?
> +	    inet_ntoa6(&((struct ipv6hdr *)arg2)->saddr) :
>  	    "<unknown>";
> -	tcps_state = arg6;
> +	/* For state-change we probe right before state has changed, but
> +	 * provider definition wants new state in tcps_state; for
> +	 * state-change probes the trampoline stores it in arg5.
> +	 */
> +	tcps_state = arg6 == NET_PROBE_STATE ? arg5 :
> +	    T ? ((struct sock *)T)->__sk_common.skc_state : 0;
>  	tcps_iss = T ?
>  	    T->snd_una - (uint32_t)T->bytes_acked : 0;
>  	tcps_suna = T ? T->snd_una : 0;
> @@ -225,7 +235,10 @@ translator tcpsinfo_t < struct tcp_sock *T > {
>  	    T->rcv_nxt - (uint32_t)T->bytes_received : 0;
>  };
>  
> +/* state-change trampoline stores new state in arg5; at time of firing,
> + * state has not been updated, so last state is in tcp_sock state.
> + */
>  #pragma D binding "1.6.3" translator
>  translator tcplsinfo_t < int I > {
> -	tcps_state = I;
> +	tcps_state = arg3 ? ((struct sock *)arg3)->__sk_common.skc_state : 0;
>  };
> diff --git a/dlibs/aarch64/6.1/ip.d b/dlibs/aarch64/6.1/ip.d
> index f8b77f12..493b75a0 100644
> --- a/dlibs/aarch64/6.1/ip.d
> +++ b/dlibs/aarch64/6.1/ip.d
> @@ -1,6 +1,6 @@
>  /*
>   * Oracle Linux DTrace.
> - * Copyright (c) 2007, 2023, Oracle and/or its affiliates. All rights reserved.
> + * Copyright (c) 2007, 2025, Oracle and/or its affiliates. All rights reserved.
>   * Licensed under the Universal Permissive License v 1.0 as shown at
>   * http://oss.oracle.com/licenses/upl.
>   */
> @@ -46,31 +46,6 @@ inline int IPPROTO_MH		=	135;
>  
>  inline int TCP_MIN_HEADER_LENGTH =	20;
>  
> -/*
> - * For compatibility with Solaris.  Here the netstackid will be the pointer
> - * to the net namespace (nd_net in struct net_device).
> - */
> -typedef uint64_t	netstackid_t;
> -typedef __be32		ipaddr_t;
> -typedef struct in6_addr	in6_addr_t;
> -
> -/*
> - * pktinfo is where packet ID info can be made available for deeper
> - * analysis if packet IDs become supported by the kernel in the future.
> - * The pkt_addr member is currently always NULL.
> - */
> -typedef struct pktinfo {
> -	uintptr_t pkt_addr;
> -} pktinfo_t;
> -
> -/*
> - * csinfo is where connection state info is made available.
> - */
> -typedef struct csinfo {
> -	uintptr_t cs_addr;
> -	uint64_t cs_cid;
> -} csinfo_t;
> -
>  /*
>   * ipinfo contains common IP info for both IPv4 and IPv6.
>   */
> diff --git a/dlibs/aarch64/6.1/net.d b/dlibs/aarch64/6.1/net.d
> index 6ac34287..f1291696 100644
> --- a/dlibs/aarch64/6.1/net.d
> +++ b/dlibs/aarch64/6.1/net.d
> @@ -1,6 +1,6 @@
>  /*
>   * Oracle Linux DTrace.
> - * Copyright (c) 2007, 2017, Oracle and/or its affiliates. All rights reserved.
> + * Copyright (c) 2007, 2025, Oracle and/or its affiliates. All rights reserved.
>   * Licensed under the Universal Permissive License v 1.0 as shown at
>   * http://oss.oracle.com/licenses/upl.
>   */
> @@ -25,9 +25,36 @@ typedef struct conninfo {
>  	 string ci_protocol;	/* protocol (ipv4, ipv6, etc) */
>  } conninfo_t;
>  
> +/*
> + * For compatibility with Solaris.  Here the netstackid will be the pointer
> + * to the net namespace (nd_net in struct net_device).
> + */
> +typedef uint64_t	netstackid_t;
> +typedef __be32		ipaddr_t;
> +typedef struct in6_addr	in6_addr_t;
> +
> +/*
> + * pktinfo is where packet ID info can be made available for deeper
> + * analysis if packet IDs become supported by the kernel in the future.
> + * The pkt_addr member is currently always NULL.
> + */
> +typedef struct pktinfo {
> +	uintptr_t pkt_addr;
> +} pktinfo_t;
> +
> +/*
> + * csinfo is where connection state info is made available.
> + */
> +typedef struct csinfo {
> +	uintptr_t cs_addr;
> +	uint64_t cs_cid;
> +} csinfo_t;
> +
>  /*
>   * We use these values to determine if a probe point is associated
> - * with sending (outbound) or receiving (inbound).
> + * with sending (outbound) or receiving (inbound) or a state-related
> + * probe (i.e. neither inbound our outbound).
>   */
>  inline int NET_PROBE_OUTBOUND =		0x00;
>  inline int NET_PROBE_INBOUND =		0x01;
> +inline int NET_PROBE_STATE =		0x02;
> diff --git a/dlibs/aarch64/6.1/tcp.d b/dlibs/aarch64/6.1/tcp.d
> index 54e310cb..48d9adb4 100644
> --- a/dlibs/aarch64/6.1/tcp.d
> +++ b/dlibs/aarch64/6.1/tcp.d
> @@ -1,13 +1,13 @@
>  /*
>   * Oracle Linux DTrace.
> - * Copyright (c) 2010, 2017, Oracle and/or its affiliates. All rights reserved.
> + * Copyright (c) 2010, 2025, Oracle and/or its affiliates. All rights reserved.
>   * Licensed under the Universal Permissive License v 1.0 as shown at
>   * http://oss.oracle.com/licenses/upl.
>   */
>  
>  #pragma D depends_on module vmlinux
>  #pragma D depends_on library net.d
> -#pragma D depends_on provider ip
> +#pragma D depends_on library ip.d
>  #pragma D depends_on provider tcp
>  
>  inline int TH_FIN =	0x01;
> @@ -111,30 +111,38 @@ translator tcpinfo_t < struct tcphdr *T > {
>  	tcp_seq = T ? ntohl(T->seq) : 0;
>  	tcp_ack = T ? ntohl(T->ack_seq) : 0;
>  	tcp_offset = T ? (*(uint8_t *)(T + 12) & 0xf0) >> 2 : 0;
> -	tcp_flags = T ? *(uint8_t *)(T + 13) : 0;
> +	tcp_flags = T ? *((uint8_t *)T + 13) : 0;
>  	tcp_window = T ? ntohs(T->window) : 0;
>  	tcp_checksum = T ? ntohs(T->check) : 0;
>  	tcp_urgent = T ? ntohs(T->urg_ptr) : 0;
>  	tcp_hdr = (uintptr_t)T;
>  };
>  
> +/* timewait sockets and inet connection sockets do not populate all fields
> + * and are not classified as full sockets; this inline helps translators
> + * spot them and act appropriately.
> + */
> +inline int tcp_fullsock[struct tcp_sock *sk] =
> +	(((struct sock_common *)sk)->skc_state != TCP_STATE_SYN_RECEIVED &&
> +	 ((struct sock_common *)sk)->skc_state != TCP_STATE_TIME_WAIT);
>  /*
>   * In the main we simply translate from the "struct [tcp_]sock *" to
>   * a tcpsinfo_t *.  However there are a few exceptions:
>   *
> - * - tcps_state is always derived from arg6.  The reason is that in some
> + * - tcps_state for state-change is arg5.  The reason is that in some
>   * state transitions sock->sk_state does not reflect the actual TCP
>   * connection state.  For example the TIME_WAIT state is handled in
>   * Linux by creating a separate timewait socket and the state of the
>   * original socket is CLOSED.  In some other cases we also need to
> - * instrument state transition prior to the update of sk_state.  To do
> - * all of this we rely on arg6.
> + * instrument state transition _prior_ to the update of sk_state.  To do
> + * all of this we rely on arg5 to hold the new state. arg6 is set to
> + * NET_PROBE_STATE to quickly identify state-change probes.
>   * - we sometimes need to retrieve local/remote port/address settings from
>   * TCP and IP headers directly, for example prior to the address/port
>   * being committed to the socket.  To do this effectively we need to know
>   * if the packet data is inbound (in which case the local IP/port are the
>   * destination) or outbound (in which case the local IP/port are the source).
> - * arg7 is set to 0 for outbound traffic and 1 for inbound so we use these
> + * arg6 is set to 0 for outbound traffic and 1 for inbound so we use these
>   * to reconstruct the address/port info where necessary.  arg2 used for IP
>   * information while arg4 contains the TCP header, so it is used for port data.
>   * NET_PROBE_INBOUND is defined as 1, NET_PROBE_OUTBOUND as 0 in net.d.
> @@ -158,47 +166,49 @@ translator tcpsinfo_t < struct tcp_sock *T > {
>              ((uint32_t *)&((struct sock *)T)->__sk_common.skc_v6_daddr)[2] &&
>  	    ((uint32_t *)&((struct sock *)T)->__sk_common.skc_v6_rcv_saddr)[3])
>  	    : 0;
> -	tcps_lport = (T && ((struct inet_sock *)T)->inet_sport != 0) ?
> +	tcps_lport = T && ((struct inet_sock *)T)->inet_sport != 0 &&
> +	    tcp_fullsock[T] ?
>  	    ntohs(((struct inet_sock *)T)->inet_sport) :
>  	    (T && ((struct inet_sock *)T)->inet_sport == 0) ?
> -	    ntohs(((struct sock *)T)->__sk_common.skc_num) :
> +	    ((struct sock *)T)->__sk_common.skc_num :
>  	    arg4 != NULL ?
>  	    ntohs(arg7 == NET_PROBE_INBOUND ?
> -	    ((struct tcphdr *)arg4)->dest : ((struct tcphdr *)arg4)->source) :
> +		  ((struct tcphdr *)arg4)->dest :
> +		  ((struct tcphdr *)arg4)->source) :
>  	    0;
>  	tcps_rport = T && ((struct sock *)T)->__sk_common.skc_dport != 0 ?
>  	    ntohs(((struct sock *)T)->__sk_common.skc_dport) :
>  	    arg4 != NULL ?
>  	    ntohs(arg7 == NET_PROBE_INBOUND ?
> -            ((struct tcphdr *)arg4)->source : ((struct tcphdr *)arg4)->dest) :
> +		  ((struct tcphdr *)arg4)->source :
> +		  ((struct tcphdr *)arg4)->dest) :
>  	    0;
>  	tcps_laddr =
>  	    T && ((struct sock *)T)->__sk_common.skc_family == AF_INET ?
>  	    inet_ntoa(&((struct sock *)T)->__sk_common.skc_rcv_saddr) :
>  	    T && ((struct sock *)T)->__sk_common.skc_family == AF_INET6 ?
>  	    inet_ntoa6(&((struct sock *)T)->__sk_common.skc_v6_rcv_saddr) :
> -	    arg2 != NULL && (*(uint8_t *)arg2) >> 4 == 4 ?
> -	    inet_ntoa(arg7 == NET_PROBE_INBOUND ?
> -	    &((struct iphdr *)arg2)->daddr : &((struct iphdr *)arg2)->saddr) :
> -	    arg2 != NULL && *((uint8_t *)arg2) >> 4 == 6 ?
> -	    inet_ntoa6(arg7 == NET_PROBE_INBOUND ?
> -	    &((struct ipv6hdr *)arg2)->daddr :
> -	    &((struct ipv6hdr *)arg2)->saddr) :
> +	    arg2 != NULL && (*(uint8_t *)arg2 >> 4) == 4 ?
> +	    inet_ntoa(&((struct iphdr *)arg2)->daddr) :
> +	    arg2 != NULL && (*(uint8_t *)arg2 >> 4) == 6 ?
> +	    inet_ntoa6(&((struct ipv6hdr *)arg2)->daddr) :
>  	    "<unknown>";
>  	tcps_raddr =
>  	    T && ((struct sock *)T)->__sk_common.skc_family == AF_INET ?
>  	    inet_ntoa(&((struct sock *)T)->__sk_common.skc_daddr) :
>  	    T && ((struct sock *)T)->__sk_common.skc_family == AF_INET6 ?
>  	    inet_ntoa6(&((struct sock *)T)->__sk_common.skc_v6_daddr) :
> -	    arg2 != NULL && (*(uint8_t *)arg2) >> 4 == 4 ?
> -	    inet_ntoa(arg7 == NET_PROBE_INBOUND ?
> -	    &((struct iphdr *)arg2)->saddr : &((struct iphdr *)arg2)->daddr) :
> -	    arg2 != NULL && *((uint8_t *)arg2) >> 4 == 6 ?
> -	    inet_ntoa6(arg7 == NET_PROBE_INBOUND ?
> -	    &((struct ipv6hdr *)arg2)->saddr :
> -	    &((struct ipv6hdr *)arg2)->daddr) :
> +	    arg2 != NULL && (*(uint8_t *)arg2 >> 4) == 4 ?
> +	    inet_ntoa(&((struct iphdr *)arg2)->saddr) :
> +	    arg2 != NULL && (*(uint8_t *)arg2 >> 4) == 6 ?
> +	    inet_ntoa6(&((struct ipv6hdr *)arg2)->saddr) :
>  	    "<unknown>";
> -	tcps_state = arg6;
> +	/* For state-change we probe right before state has changed, but
> +	 * provider definition wants new state in tcps_state; for
> +	 * state-change probes the trampoline stores it in arg5.
> +	 */
> +	tcps_state = arg6 == NET_PROBE_STATE ? arg5 :
> +	    T ? ((struct sock *)T)->__sk_common.skc_state : 0;
>  	tcps_iss = T ?
>  	    T->snd_una - (uint32_t)T->bytes_acked : 0;
>  	tcps_suna = T ? T->snd_una : 0;
> @@ -225,7 +235,10 @@ translator tcpsinfo_t < struct tcp_sock *T > {
>  	    T->rcv_nxt - (uint32_t)T->bytes_received : 0;
>  };
>  
> +/* state-change trampoline stores new state in arg5; at time of firing,
> + * state has not been updated, so last state is in tcp_sock state.
> + */
>  #pragma D binding "1.6.3" translator
>  translator tcplsinfo_t < int I > {
> -	tcps_state = I;
> +	tcps_state = arg3 ? ((struct sock *)arg3)->__sk_common.skc_state : 0;
>  };
> diff --git a/dlibs/aarch64/6.10/ip.d b/dlibs/aarch64/6.10/ip.d
> index f8b77f12..493b75a0 100644
> --- a/dlibs/aarch64/6.10/ip.d
> +++ b/dlibs/aarch64/6.10/ip.d
> @@ -1,6 +1,6 @@
>  /*
>   * Oracle Linux DTrace.
> - * Copyright (c) 2007, 2023, Oracle and/or its affiliates. All rights reserved.
> + * Copyright (c) 2007, 2025, Oracle and/or its affiliates. All rights reserved.
>   * Licensed under the Universal Permissive License v 1.0 as shown at
>   * http://oss.oracle.com/licenses/upl.
>   */
> @@ -46,31 +46,6 @@ inline int IPPROTO_MH		=	135;
>  
>  inline int TCP_MIN_HEADER_LENGTH =	20;
>  
> -/*
> - * For compatibility with Solaris.  Here the netstackid will be the pointer
> - * to the net namespace (nd_net in struct net_device).
> - */
> -typedef uint64_t	netstackid_t;
> -typedef __be32		ipaddr_t;
> -typedef struct in6_addr	in6_addr_t;
> -
> -/*
> - * pktinfo is where packet ID info can be made available for deeper
> - * analysis if packet IDs become supported by the kernel in the future.
> - * The pkt_addr member is currently always NULL.
> - */
> -typedef struct pktinfo {
> -	uintptr_t pkt_addr;
> -} pktinfo_t;
> -
> -/*
> - * csinfo is where connection state info is made available.
> - */
> -typedef struct csinfo {
> -	uintptr_t cs_addr;
> -	uint64_t cs_cid;
> -} csinfo_t;
> -
>  /*
>   * ipinfo contains common IP info for both IPv4 and IPv6.
>   */
> diff --git a/dlibs/aarch64/6.10/net.d b/dlibs/aarch64/6.10/net.d
> index 6ac34287..f1291696 100644
> --- a/dlibs/aarch64/6.10/net.d
> +++ b/dlibs/aarch64/6.10/net.d
> @@ -1,6 +1,6 @@
>  /*
>   * Oracle Linux DTrace.
> - * Copyright (c) 2007, 2017, Oracle and/or its affiliates. All rights reserved.
> + * Copyright (c) 2007, 2025, Oracle and/or its affiliates. All rights reserved.
>   * Licensed under the Universal Permissive License v 1.0 as shown at
>   * http://oss.oracle.com/licenses/upl.
>   */
> @@ -25,9 +25,36 @@ typedef struct conninfo {
>  	 string ci_protocol;	/* protocol (ipv4, ipv6, etc) */
>  } conninfo_t;
>  
> +/*
> + * For compatibility with Solaris.  Here the netstackid will be the pointer
> + * to the net namespace (nd_net in struct net_device).
> + */
> +typedef uint64_t	netstackid_t;
> +typedef __be32		ipaddr_t;
> +typedef struct in6_addr	in6_addr_t;
> +
> +/*
> + * pktinfo is where packet ID info can be made available for deeper
> + * analysis if packet IDs become supported by the kernel in the future.
> + * The pkt_addr member is currently always NULL.
> + */
> +typedef struct pktinfo {
> +	uintptr_t pkt_addr;
> +} pktinfo_t;
> +
> +/*
> + * csinfo is where connection state info is made available.
> + */
> +typedef struct csinfo {
> +	uintptr_t cs_addr;
> +	uint64_t cs_cid;
> +} csinfo_t;
> +
>  /*
>   * We use these values to determine if a probe point is associated
> - * with sending (outbound) or receiving (inbound).
> + * with sending (outbound) or receiving (inbound) or a state-related
> + * probe (i.e. neither inbound our outbound).
>   */
>  inline int NET_PROBE_OUTBOUND =		0x00;
>  inline int NET_PROBE_INBOUND =		0x01;
> +inline int NET_PROBE_STATE =		0x02;
> diff --git a/dlibs/aarch64/6.10/tcp.d b/dlibs/aarch64/6.10/tcp.d
> index 54e310cb..48d9adb4 100644
> --- a/dlibs/aarch64/6.10/tcp.d
> +++ b/dlibs/aarch64/6.10/tcp.d
> @@ -1,13 +1,13 @@
>  /*
>   * Oracle Linux DTrace.
> - * Copyright (c) 2010, 2017, Oracle and/or its affiliates. All rights reserved.
> + * Copyright (c) 2010, 2025, Oracle and/or its affiliates. All rights reserved.
>   * Licensed under the Universal Permissive License v 1.0 as shown at
>   * http://oss.oracle.com/licenses/upl.
>   */
>  
>  #pragma D depends_on module vmlinux
>  #pragma D depends_on library net.d
> -#pragma D depends_on provider ip
> +#pragma D depends_on library ip.d
>  #pragma D depends_on provider tcp
>  
>  inline int TH_FIN =	0x01;
> @@ -111,30 +111,38 @@ translator tcpinfo_t < struct tcphdr *T > {
>  	tcp_seq = T ? ntohl(T->seq) : 0;
>  	tcp_ack = T ? ntohl(T->ack_seq) : 0;
>  	tcp_offset = T ? (*(uint8_t *)(T + 12) & 0xf0) >> 2 : 0;
> -	tcp_flags = T ? *(uint8_t *)(T + 13) : 0;
> +	tcp_flags = T ? *((uint8_t *)T + 13) : 0;
>  	tcp_window = T ? ntohs(T->window) : 0;
>  	tcp_checksum = T ? ntohs(T->check) : 0;
>  	tcp_urgent = T ? ntohs(T->urg_ptr) : 0;
>  	tcp_hdr = (uintptr_t)T;
>  };
>  
> +/* timewait sockets and inet connection sockets do not populate all fields
> + * and are not classified as full sockets; this inline helps translators
> + * spot them and act appropriately.
> + */
> +inline int tcp_fullsock[struct tcp_sock *sk] =
> +	(((struct sock_common *)sk)->skc_state != TCP_STATE_SYN_RECEIVED &&
> +	 ((struct sock_common *)sk)->skc_state != TCP_STATE_TIME_WAIT);
>  /*
>   * In the main we simply translate from the "struct [tcp_]sock *" to
>   * a tcpsinfo_t *.  However there are a few exceptions:
>   *
> - * - tcps_state is always derived from arg6.  The reason is that in some
> + * - tcps_state for state-change is arg5.  The reason is that in some
>   * state transitions sock->sk_state does not reflect the actual TCP
>   * connection state.  For example the TIME_WAIT state is handled in
>   * Linux by creating a separate timewait socket and the state of the
>   * original socket is CLOSED.  In some other cases we also need to
> - * instrument state transition prior to the update of sk_state.  To do
> - * all of this we rely on arg6.
> + * instrument state transition _prior_ to the update of sk_state.  To do
> + * all of this we rely on arg5 to hold the new state. arg6 is set to
> + * NET_PROBE_STATE to quickly identify state-change probes.
>   * - we sometimes need to retrieve local/remote port/address settings from
>   * TCP and IP headers directly, for example prior to the address/port
>   * being committed to the socket.  To do this effectively we need to know
>   * if the packet data is inbound (in which case the local IP/port are the
>   * destination) or outbound (in which case the local IP/port are the source).
> - * arg7 is set to 0 for outbound traffic and 1 for inbound so we use these
> + * arg6 is set to 0 for outbound traffic and 1 for inbound so we use these
>   * to reconstruct the address/port info where necessary.  arg2 used for IP
>   * information while arg4 contains the TCP header, so it is used for port data.
>   * NET_PROBE_INBOUND is defined as 1, NET_PROBE_OUTBOUND as 0 in net.d.
> @@ -158,47 +166,49 @@ translator tcpsinfo_t < struct tcp_sock *T > {
>              ((uint32_t *)&((struct sock *)T)->__sk_common.skc_v6_daddr)[2] &&
>  	    ((uint32_t *)&((struct sock *)T)->__sk_common.skc_v6_rcv_saddr)[3])
>  	    : 0;
> -	tcps_lport = (T && ((struct inet_sock *)T)->inet_sport != 0) ?
> +	tcps_lport = T && ((struct inet_sock *)T)->inet_sport != 0 &&
> +	    tcp_fullsock[T] ?
>  	    ntohs(((struct inet_sock *)T)->inet_sport) :
>  	    (T && ((struct inet_sock *)T)->inet_sport == 0) ?
> -	    ntohs(((struct sock *)T)->__sk_common.skc_num) :
> +	    ((struct sock *)T)->__sk_common.skc_num :
>  	    arg4 != NULL ?
>  	    ntohs(arg7 == NET_PROBE_INBOUND ?
> -	    ((struct tcphdr *)arg4)->dest : ((struct tcphdr *)arg4)->source) :
> +		  ((struct tcphdr *)arg4)->dest :
> +		  ((struct tcphdr *)arg4)->source) :
>  	    0;
>  	tcps_rport = T && ((struct sock *)T)->__sk_common.skc_dport != 0 ?
>  	    ntohs(((struct sock *)T)->__sk_common.skc_dport) :
>  	    arg4 != NULL ?
>  	    ntohs(arg7 == NET_PROBE_INBOUND ?
> -            ((struct tcphdr *)arg4)->source : ((struct tcphdr *)arg4)->dest) :
> +		  ((struct tcphdr *)arg4)->source :
> +		  ((struct tcphdr *)arg4)->dest) :
>  	    0;
>  	tcps_laddr =
>  	    T && ((struct sock *)T)->__sk_common.skc_family == AF_INET ?
>  	    inet_ntoa(&((struct sock *)T)->__sk_common.skc_rcv_saddr) :
>  	    T && ((struct sock *)T)->__sk_common.skc_family == AF_INET6 ?
>  	    inet_ntoa6(&((struct sock *)T)->__sk_common.skc_v6_rcv_saddr) :
> -	    arg2 != NULL && (*(uint8_t *)arg2) >> 4 == 4 ?
> -	    inet_ntoa(arg7 == NET_PROBE_INBOUND ?
> -	    &((struct iphdr *)arg2)->daddr : &((struct iphdr *)arg2)->saddr) :
> -	    arg2 != NULL && *((uint8_t *)arg2) >> 4 == 6 ?
> -	    inet_ntoa6(arg7 == NET_PROBE_INBOUND ?
> -	    &((struct ipv6hdr *)arg2)->daddr :
> -	    &((struct ipv6hdr *)arg2)->saddr) :
> +	    arg2 != NULL && (*(uint8_t *)arg2 >> 4) == 4 ?
> +	    inet_ntoa(&((struct iphdr *)arg2)->daddr) :
> +	    arg2 != NULL && (*(uint8_t *)arg2 >> 4) == 6 ?
> +	    inet_ntoa6(&((struct ipv6hdr *)arg2)->daddr) :
>  	    "<unknown>";
>  	tcps_raddr =
>  	    T && ((struct sock *)T)->__sk_common.skc_family == AF_INET ?
>  	    inet_ntoa(&((struct sock *)T)->__sk_common.skc_daddr) :
>  	    T && ((struct sock *)T)->__sk_common.skc_family == AF_INET6 ?
>  	    inet_ntoa6(&((struct sock *)T)->__sk_common.skc_v6_daddr) :
> -	    arg2 != NULL && (*(uint8_t *)arg2) >> 4 == 4 ?
> -	    inet_ntoa(arg7 == NET_PROBE_INBOUND ?
> -	    &((struct iphdr *)arg2)->saddr : &((struct iphdr *)arg2)->daddr) :
> -	    arg2 != NULL && *((uint8_t *)arg2) >> 4 == 6 ?
> -	    inet_ntoa6(arg7 == NET_PROBE_INBOUND ?
> -	    &((struct ipv6hdr *)arg2)->saddr :
> -	    &((struct ipv6hdr *)arg2)->daddr) :
> +	    arg2 != NULL && (*(uint8_t *)arg2 >> 4) == 4 ?
> +	    inet_ntoa(&((struct iphdr *)arg2)->saddr) :
> +	    arg2 != NULL && (*(uint8_t *)arg2 >> 4) == 6 ?
> +	    inet_ntoa6(&((struct ipv6hdr *)arg2)->saddr) :
>  	    "<unknown>";
> -	tcps_state = arg6;
> +	/* For state-change we probe right before state has changed, but
> +	 * provider definition wants new state in tcps_state; for
> +	 * state-change probes the trampoline stores it in arg5.
> +	 */
> +	tcps_state = arg6 == NET_PROBE_STATE ? arg5 :
> +	    T ? ((struct sock *)T)->__sk_common.skc_state : 0;
>  	tcps_iss = T ?
>  	    T->snd_una - (uint32_t)T->bytes_acked : 0;
>  	tcps_suna = T ? T->snd_una : 0;
> @@ -225,7 +235,10 @@ translator tcpsinfo_t < struct tcp_sock *T > {
>  	    T->rcv_nxt - (uint32_t)T->bytes_received : 0;
>  };
>  
> +/* state-change trampoline stores new state in arg5; at time of firing,
> + * state has not been updated, so last state is in tcp_sock state.
> + */
>  #pragma D binding "1.6.3" translator
>  translator tcplsinfo_t < int I > {
> -	tcps_state = I;
> +	tcps_state = arg3 ? ((struct sock *)arg3)->__sk_common.skc_state : 0;
>  };
> diff --git a/dlibs/x86_64/5.11/ip.d b/dlibs/x86_64/5.11/ip.d
> index f8b77f12..493b75a0 100644
> --- a/dlibs/x86_64/5.11/ip.d
> +++ b/dlibs/x86_64/5.11/ip.d
> @@ -1,6 +1,6 @@
>  /*
>   * Oracle Linux DTrace.
> - * Copyright (c) 2007, 2023, Oracle and/or its affiliates. All rights reserved.
> + * Copyright (c) 2007, 2025, Oracle and/or its affiliates. All rights reserved.
>   * Licensed under the Universal Permissive License v 1.0 as shown at
>   * http://oss.oracle.com/licenses/upl.
>   */
> @@ -46,31 +46,6 @@ inline int IPPROTO_MH		=	135;
>  
>  inline int TCP_MIN_HEADER_LENGTH =	20;
>  
> -/*
> - * For compatibility with Solaris.  Here the netstackid will be the pointer
> - * to the net namespace (nd_net in struct net_device).
> - */
> -typedef uint64_t	netstackid_t;
> -typedef __be32		ipaddr_t;
> -typedef struct in6_addr	in6_addr_t;
> -
> -/*
> - * pktinfo is where packet ID info can be made available for deeper
> - * analysis if packet IDs become supported by the kernel in the future.
> - * The pkt_addr member is currently always NULL.
> - */
> -typedef struct pktinfo {
> -	uintptr_t pkt_addr;
> -} pktinfo_t;
> -
> -/*
> - * csinfo is where connection state info is made available.
> - */
> -typedef struct csinfo {
> -	uintptr_t cs_addr;
> -	uint64_t cs_cid;
> -} csinfo_t;
> -
>  /*
>   * ipinfo contains common IP info for both IPv4 and IPv6.
>   */
> diff --git a/dlibs/x86_64/5.11/net.d b/dlibs/x86_64/5.11/net.d
> index 6ac34287..f1291696 100644
> --- a/dlibs/x86_64/5.11/net.d
> +++ b/dlibs/x86_64/5.11/net.d
> @@ -1,6 +1,6 @@
>  /*
>   * Oracle Linux DTrace.
> - * Copyright (c) 2007, 2017, Oracle and/or its affiliates. All rights reserved.
> + * Copyright (c) 2007, 2025, Oracle and/or its affiliates. All rights reserved.
>   * Licensed under the Universal Permissive License v 1.0 as shown at
>   * http://oss.oracle.com/licenses/upl.
>   */
> @@ -25,9 +25,36 @@ typedef struct conninfo {
>  	 string ci_protocol;	/* protocol (ipv4, ipv6, etc) */
>  } conninfo_t;
>  
> +/*
> + * For compatibility with Solaris.  Here the netstackid will be the pointer
> + * to the net namespace (nd_net in struct net_device).
> + */
> +typedef uint64_t	netstackid_t;
> +typedef __be32		ipaddr_t;
> +typedef struct in6_addr	in6_addr_t;
> +
> +/*
> + * pktinfo is where packet ID info can be made available for deeper
> + * analysis if packet IDs become supported by the kernel in the future.
> + * The pkt_addr member is currently always NULL.
> + */
> +typedef struct pktinfo {
> +	uintptr_t pkt_addr;
> +} pktinfo_t;
> +
> +/*
> + * csinfo is where connection state info is made available.
> + */
> +typedef struct csinfo {
> +	uintptr_t cs_addr;
> +	uint64_t cs_cid;
> +} csinfo_t;
> +
>  /*
>   * We use these values to determine if a probe point is associated
> - * with sending (outbound) or receiving (inbound).
> + * with sending (outbound) or receiving (inbound) or a state-related
> + * probe (i.e. neither inbound our outbound).
>   */
>  inline int NET_PROBE_OUTBOUND =		0x00;
>  inline int NET_PROBE_INBOUND =		0x01;
> +inline int NET_PROBE_STATE =		0x02;
> diff --git a/dlibs/x86_64/5.11/tcp.d b/dlibs/x86_64/5.11/tcp.d
> index 54e310cb..48d9adb4 100644
> --- a/dlibs/x86_64/5.11/tcp.d
> +++ b/dlibs/x86_64/5.11/tcp.d
> @@ -1,13 +1,13 @@
>  /*
>   * Oracle Linux DTrace.
> - * Copyright (c) 2010, 2017, Oracle and/or its affiliates. All rights reserved.
> + * Copyright (c) 2010, 2025, Oracle and/or its affiliates. All rights reserved.
>   * Licensed under the Universal Permissive License v 1.0 as shown at
>   * http://oss.oracle.com/licenses/upl.
>   */
>  
>  #pragma D depends_on module vmlinux
>  #pragma D depends_on library net.d
> -#pragma D depends_on provider ip
> +#pragma D depends_on library ip.d
>  #pragma D depends_on provider tcp
>  
>  inline int TH_FIN =	0x01;
> @@ -111,30 +111,38 @@ translator tcpinfo_t < struct tcphdr *T > {
>  	tcp_seq = T ? ntohl(T->seq) : 0;
>  	tcp_ack = T ? ntohl(T->ack_seq) : 0;
>  	tcp_offset = T ? (*(uint8_t *)(T + 12) & 0xf0) >> 2 : 0;
> -	tcp_flags = T ? *(uint8_t *)(T + 13) : 0;
> +	tcp_flags = T ? *((uint8_t *)T + 13) : 0;
>  	tcp_window = T ? ntohs(T->window) : 0;
>  	tcp_checksum = T ? ntohs(T->check) : 0;
>  	tcp_urgent = T ? ntohs(T->urg_ptr) : 0;
>  	tcp_hdr = (uintptr_t)T;
>  };
>  
> +/* timewait sockets and inet connection sockets do not populate all fields
> + * and are not classified as full sockets; this inline helps translators
> + * spot them and act appropriately.
> + */
> +inline int tcp_fullsock[struct tcp_sock *sk] =
> +	(((struct sock_common *)sk)->skc_state != TCP_STATE_SYN_RECEIVED &&
> +	 ((struct sock_common *)sk)->skc_state != TCP_STATE_TIME_WAIT);
>  /*
>   * In the main we simply translate from the "struct [tcp_]sock *" to
>   * a tcpsinfo_t *.  However there are a few exceptions:
>   *
> - * - tcps_state is always derived from arg6.  The reason is that in some
> + * - tcps_state for state-change is arg5.  The reason is that in some
>   * state transitions sock->sk_state does not reflect the actual TCP
>   * connection state.  For example the TIME_WAIT state is handled in
>   * Linux by creating a separate timewait socket and the state of the
>   * original socket is CLOSED.  In some other cases we also need to
> - * instrument state transition prior to the update of sk_state.  To do
> - * all of this we rely on arg6.
> + * instrument state transition _prior_ to the update of sk_state.  To do
> + * all of this we rely on arg5 to hold the new state. arg6 is set to
> + * NET_PROBE_STATE to quickly identify state-change probes.
>   * - we sometimes need to retrieve local/remote port/address settings from
>   * TCP and IP headers directly, for example prior to the address/port
>   * being committed to the socket.  To do this effectively we need to know
>   * if the packet data is inbound (in which case the local IP/port are the
>   * destination) or outbound (in which case the local IP/port are the source).
> - * arg7 is set to 0 for outbound traffic and 1 for inbound so we use these
> + * arg6 is set to 0 for outbound traffic and 1 for inbound so we use these
>   * to reconstruct the address/port info where necessary.  arg2 used for IP
>   * information while arg4 contains the TCP header, so it is used for port data.
>   * NET_PROBE_INBOUND is defined as 1, NET_PROBE_OUTBOUND as 0 in net.d.
> @@ -158,47 +166,49 @@ translator tcpsinfo_t < struct tcp_sock *T > {
>              ((uint32_t *)&((struct sock *)T)->__sk_common.skc_v6_daddr)[2] &&
>  	    ((uint32_t *)&((struct sock *)T)->__sk_common.skc_v6_rcv_saddr)[3])
>  	    : 0;
> -	tcps_lport = (T && ((struct inet_sock *)T)->inet_sport != 0) ?
> +	tcps_lport = T && ((struct inet_sock *)T)->inet_sport != 0 &&
> +	    tcp_fullsock[T] ?
>  	    ntohs(((struct inet_sock *)T)->inet_sport) :
>  	    (T && ((struct inet_sock *)T)->inet_sport == 0) ?
> -	    ntohs(((struct sock *)T)->__sk_common.skc_num) :
> +	    ((struct sock *)T)->__sk_common.skc_num :
>  	    arg4 != NULL ?
>  	    ntohs(arg7 == NET_PROBE_INBOUND ?
> -	    ((struct tcphdr *)arg4)->dest : ((struct tcphdr *)arg4)->source) :
> +		  ((struct tcphdr *)arg4)->dest :
> +		  ((struct tcphdr *)arg4)->source) :
>  	    0;
>  	tcps_rport = T && ((struct sock *)T)->__sk_common.skc_dport != 0 ?
>  	    ntohs(((struct sock *)T)->__sk_common.skc_dport) :
>  	    arg4 != NULL ?
>  	    ntohs(arg7 == NET_PROBE_INBOUND ?
> -            ((struct tcphdr *)arg4)->source : ((struct tcphdr *)arg4)->dest) :
> +		  ((struct tcphdr *)arg4)->source :
> +		  ((struct tcphdr *)arg4)->dest) :
>  	    0;
>  	tcps_laddr =
>  	    T && ((struct sock *)T)->__sk_common.skc_family == AF_INET ?
>  	    inet_ntoa(&((struct sock *)T)->__sk_common.skc_rcv_saddr) :
>  	    T && ((struct sock *)T)->__sk_common.skc_family == AF_INET6 ?
>  	    inet_ntoa6(&((struct sock *)T)->__sk_common.skc_v6_rcv_saddr) :
> -	    arg2 != NULL && (*(uint8_t *)arg2) >> 4 == 4 ?
> -	    inet_ntoa(arg7 == NET_PROBE_INBOUND ?
> -	    &((struct iphdr *)arg2)->daddr : &((struct iphdr *)arg2)->saddr) :
> -	    arg2 != NULL && *((uint8_t *)arg2) >> 4 == 6 ?
> -	    inet_ntoa6(arg7 == NET_PROBE_INBOUND ?
> -	    &((struct ipv6hdr *)arg2)->daddr :
> -	    &((struct ipv6hdr *)arg2)->saddr) :
> +	    arg2 != NULL && (*(uint8_t *)arg2 >> 4) == 4 ?
> +	    inet_ntoa(&((struct iphdr *)arg2)->daddr) :
> +	    arg2 != NULL && (*(uint8_t *)arg2 >> 4) == 6 ?
> +	    inet_ntoa6(&((struct ipv6hdr *)arg2)->daddr) :
>  	    "<unknown>";
>  	tcps_raddr =
>  	    T && ((struct sock *)T)->__sk_common.skc_family == AF_INET ?
>  	    inet_ntoa(&((struct sock *)T)->__sk_common.skc_daddr) :
>  	    T && ((struct sock *)T)->__sk_common.skc_family == AF_INET6 ?
>  	    inet_ntoa6(&((struct sock *)T)->__sk_common.skc_v6_daddr) :
> -	    arg2 != NULL && (*(uint8_t *)arg2) >> 4 == 4 ?
> -	    inet_ntoa(arg7 == NET_PROBE_INBOUND ?
> -	    &((struct iphdr *)arg2)->saddr : &((struct iphdr *)arg2)->daddr) :
> -	    arg2 != NULL && *((uint8_t *)arg2) >> 4 == 6 ?
> -	    inet_ntoa6(arg7 == NET_PROBE_INBOUND ?
> -	    &((struct ipv6hdr *)arg2)->saddr :
> -	    &((struct ipv6hdr *)arg2)->daddr) :
> +	    arg2 != NULL && (*(uint8_t *)arg2 >> 4) == 4 ?
> +	    inet_ntoa(&((struct iphdr *)arg2)->saddr) :
> +	    arg2 != NULL && (*(uint8_t *)arg2 >> 4) == 6 ?
> +	    inet_ntoa6(&((struct ipv6hdr *)arg2)->saddr) :
>  	    "<unknown>";
> -	tcps_state = arg6;
> +	/* For state-change we probe right before state has changed, but
> +	 * provider definition wants new state in tcps_state; for
> +	 * state-change probes the trampoline stores it in arg5.
> +	 */
> +	tcps_state = arg6 == NET_PROBE_STATE ? arg5 :
> +	    T ? ((struct sock *)T)->__sk_common.skc_state : 0;
>  	tcps_iss = T ?
>  	    T->snd_una - (uint32_t)T->bytes_acked : 0;
>  	tcps_suna = T ? T->snd_una : 0;
> @@ -225,7 +235,10 @@ translator tcpsinfo_t < struct tcp_sock *T > {
>  	    T->rcv_nxt - (uint32_t)T->bytes_received : 0;
>  };
>  
> +/* state-change trampoline stores new state in arg5; at time of firing,
> + * state has not been updated, so last state is in tcp_sock state.
> + */
>  #pragma D binding "1.6.3" translator
>  translator tcplsinfo_t < int I > {
> -	tcps_state = I;
> +	tcps_state = arg3 ? ((struct sock *)arg3)->__sk_common.skc_state : 0;
>  };
> diff --git a/dlibs/x86_64/5.12/ip.d b/dlibs/x86_64/5.12/ip.d
> index f8b77f12..493b75a0 100644
> --- a/dlibs/x86_64/5.12/ip.d
> +++ b/dlibs/x86_64/5.12/ip.d
> @@ -1,6 +1,6 @@
>  /*
>   * Oracle Linux DTrace.
> - * Copyright (c) 2007, 2023, Oracle and/or its affiliates. All rights reserved.
> + * Copyright (c) 2007, 2025, Oracle and/or its affiliates. All rights reserved.
>   * Licensed under the Universal Permissive License v 1.0 as shown at
>   * http://oss.oracle.com/licenses/upl.
>   */
> @@ -46,31 +46,6 @@ inline int IPPROTO_MH		=	135;
>  
>  inline int TCP_MIN_HEADER_LENGTH =	20;
>  
> -/*
> - * For compatibility with Solaris.  Here the netstackid will be the pointer
> - * to the net namespace (nd_net in struct net_device).
> - */
> -typedef uint64_t	netstackid_t;
> -typedef __be32		ipaddr_t;
> -typedef struct in6_addr	in6_addr_t;
> -
> -/*
> - * pktinfo is where packet ID info can be made available for deeper
> - * analysis if packet IDs become supported by the kernel in the future.
> - * The pkt_addr member is currently always NULL.
> - */
> -typedef struct pktinfo {
> -	uintptr_t pkt_addr;
> -} pktinfo_t;
> -
> -/*
> - * csinfo is where connection state info is made available.
> - */
> -typedef struct csinfo {
> -	uintptr_t cs_addr;
> -	uint64_t cs_cid;
> -} csinfo_t;
> -
>  /*
>   * ipinfo contains common IP info for both IPv4 and IPv6.
>   */
> diff --git a/dlibs/x86_64/5.12/net.d b/dlibs/x86_64/5.12/net.d
> index 6ac34287..f1291696 100644
> --- a/dlibs/x86_64/5.12/net.d
> +++ b/dlibs/x86_64/5.12/net.d
> @@ -1,6 +1,6 @@
>  /*
>   * Oracle Linux DTrace.
> - * Copyright (c) 2007, 2017, Oracle and/or its affiliates. All rights reserved.
> + * Copyright (c) 2007, 2025, Oracle and/or its affiliates. All rights reserved.
>   * Licensed under the Universal Permissive License v 1.0 as shown at
>   * http://oss.oracle.com/licenses/upl.
>   */
> @@ -25,9 +25,36 @@ typedef struct conninfo {
>  	 string ci_protocol;	/* protocol (ipv4, ipv6, etc) */
>  } conninfo_t;
>  
> +/*
> + * For compatibility with Solaris.  Here the netstackid will be the pointer
> + * to the net namespace (nd_net in struct net_device).
> + */
> +typedef uint64_t	netstackid_t;
> +typedef __be32		ipaddr_t;
> +typedef struct in6_addr	in6_addr_t;
> +
> +/*
> + * pktinfo is where packet ID info can be made available for deeper
> + * analysis if packet IDs become supported by the kernel in the future.
> + * The pkt_addr member is currently always NULL.
> + */
> +typedef struct pktinfo {
> +	uintptr_t pkt_addr;
> +} pktinfo_t;
> +
> +/*
> + * csinfo is where connection state info is made available.
> + */
> +typedef struct csinfo {
> +	uintptr_t cs_addr;
> +	uint64_t cs_cid;
> +} csinfo_t;
> +
>  /*
>   * We use these values to determine if a probe point is associated
> - * with sending (outbound) or receiving (inbound).
> + * with sending (outbound) or receiving (inbound) or a state-related
> + * probe (i.e. neither inbound our outbound).
>   */
>  inline int NET_PROBE_OUTBOUND =		0x00;
>  inline int NET_PROBE_INBOUND =		0x01;
> +inline int NET_PROBE_STATE =		0x02;
> diff --git a/dlibs/x86_64/5.12/tcp.d b/dlibs/x86_64/5.12/tcp.d
> index 54e310cb..48d9adb4 100644
> --- a/dlibs/x86_64/5.12/tcp.d
> +++ b/dlibs/x86_64/5.12/tcp.d
> @@ -1,13 +1,13 @@
>  /*
>   * Oracle Linux DTrace.
> - * Copyright (c) 2010, 2017, Oracle and/or its affiliates. All rights reserved.
> + * Copyright (c) 2010, 2025, Oracle and/or its affiliates. All rights reserved.
>   * Licensed under the Universal Permissive License v 1.0 as shown at
>   * http://oss.oracle.com/licenses/upl.
>   */
>  
>  #pragma D depends_on module vmlinux
>  #pragma D depends_on library net.d
> -#pragma D depends_on provider ip
> +#pragma D depends_on library ip.d
>  #pragma D depends_on provider tcp
>  
>  inline int TH_FIN =	0x01;
> @@ -111,30 +111,38 @@ translator tcpinfo_t < struct tcphdr *T > {
>  	tcp_seq = T ? ntohl(T->seq) : 0;
>  	tcp_ack = T ? ntohl(T->ack_seq) : 0;
>  	tcp_offset = T ? (*(uint8_t *)(T + 12) & 0xf0) >> 2 : 0;
> -	tcp_flags = T ? *(uint8_t *)(T + 13) : 0;
> +	tcp_flags = T ? *((uint8_t *)T + 13) : 0;
>  	tcp_window = T ? ntohs(T->window) : 0;
>  	tcp_checksum = T ? ntohs(T->check) : 0;
>  	tcp_urgent = T ? ntohs(T->urg_ptr) : 0;
>  	tcp_hdr = (uintptr_t)T;
>  };
>  
> +/* timewait sockets and inet connection sockets do not populate all fields
> + * and are not classified as full sockets; this inline helps translators
> + * spot them and act appropriately.
> + */
> +inline int tcp_fullsock[struct tcp_sock *sk] =
> +	(((struct sock_common *)sk)->skc_state != TCP_STATE_SYN_RECEIVED &&
> +	 ((struct sock_common *)sk)->skc_state != TCP_STATE_TIME_WAIT);
>  /*
>   * In the main we simply translate from the "struct [tcp_]sock *" to
>   * a tcpsinfo_t *.  However there are a few exceptions:
>   *
> - * - tcps_state is always derived from arg6.  The reason is that in some
> + * - tcps_state for state-change is arg5.  The reason is that in some
>   * state transitions sock->sk_state does not reflect the actual TCP
>   * connection state.  For example the TIME_WAIT state is handled in
>   * Linux by creating a separate timewait socket and the state of the
>   * original socket is CLOSED.  In some other cases we also need to
> - * instrument state transition prior to the update of sk_state.  To do
> - * all of this we rely on arg6.
> + * instrument state transition _prior_ to the update of sk_state.  To do
> + * all of this we rely on arg5 to hold the new state. arg6 is set to
> + * NET_PROBE_STATE to quickly identify state-change probes.
>   * - we sometimes need to retrieve local/remote port/address settings from
>   * TCP and IP headers directly, for example prior to the address/port
>   * being committed to the socket.  To do this effectively we need to know
>   * if the packet data is inbound (in which case the local IP/port are the
>   * destination) or outbound (in which case the local IP/port are the source).
> - * arg7 is set to 0 for outbound traffic and 1 for inbound so we use these
> + * arg6 is set to 0 for outbound traffic and 1 for inbound so we use these
>   * to reconstruct the address/port info where necessary.  arg2 used for IP
>   * information while arg4 contains the TCP header, so it is used for port data.
>   * NET_PROBE_INBOUND is defined as 1, NET_PROBE_OUTBOUND as 0 in net.d.
> @@ -158,47 +166,49 @@ translator tcpsinfo_t < struct tcp_sock *T > {
>              ((uint32_t *)&((struct sock *)T)->__sk_common.skc_v6_daddr)[2] &&
>  	    ((uint32_t *)&((struct sock *)T)->__sk_common.skc_v6_rcv_saddr)[3])
>  	    : 0;
> -	tcps_lport = (T && ((struct inet_sock *)T)->inet_sport != 0) ?
> +	tcps_lport = T && ((struct inet_sock *)T)->inet_sport != 0 &&
> +	    tcp_fullsock[T] ?
>  	    ntohs(((struct inet_sock *)T)->inet_sport) :
>  	    (T && ((struct inet_sock *)T)->inet_sport == 0) ?
> -	    ntohs(((struct sock *)T)->__sk_common.skc_num) :
> +	    ((struct sock *)T)->__sk_common.skc_num :
>  	    arg4 != NULL ?
>  	    ntohs(arg7 == NET_PROBE_INBOUND ?
> -	    ((struct tcphdr *)arg4)->dest : ((struct tcphdr *)arg4)->source) :
> +		  ((struct tcphdr *)arg4)->dest :
> +		  ((struct tcphdr *)arg4)->source) :
>  	    0;
>  	tcps_rport = T && ((struct sock *)T)->__sk_common.skc_dport != 0 ?
>  	    ntohs(((struct sock *)T)->__sk_common.skc_dport) :
>  	    arg4 != NULL ?
>  	    ntohs(arg7 == NET_PROBE_INBOUND ?
> -            ((struct tcphdr *)arg4)->source : ((struct tcphdr *)arg4)->dest) :
> +		  ((struct tcphdr *)arg4)->source :
> +		  ((struct tcphdr *)arg4)->dest) :
>  	    0;
>  	tcps_laddr =
>  	    T && ((struct sock *)T)->__sk_common.skc_family == AF_INET ?
>  	    inet_ntoa(&((struct sock *)T)->__sk_common.skc_rcv_saddr) :
>  	    T && ((struct sock *)T)->__sk_common.skc_family == AF_INET6 ?
>  	    inet_ntoa6(&((struct sock *)T)->__sk_common.skc_v6_rcv_saddr) :
> -	    arg2 != NULL && (*(uint8_t *)arg2) >> 4 == 4 ?
> -	    inet_ntoa(arg7 == NET_PROBE_INBOUND ?
> -	    &((struct iphdr *)arg2)->daddr : &((struct iphdr *)arg2)->saddr) :
> -	    arg2 != NULL && *((uint8_t *)arg2) >> 4 == 6 ?
> -	    inet_ntoa6(arg7 == NET_PROBE_INBOUND ?
> -	    &((struct ipv6hdr *)arg2)->daddr :
> -	    &((struct ipv6hdr *)arg2)->saddr) :
> +	    arg2 != NULL && (*(uint8_t *)arg2 >> 4) == 4 ?
> +	    inet_ntoa(&((struct iphdr *)arg2)->daddr) :
> +	    arg2 != NULL && (*(uint8_t *)arg2 >> 4) == 6 ?
> +	    inet_ntoa6(&((struct ipv6hdr *)arg2)->daddr) :
>  	    "<unknown>";
>  	tcps_raddr =
>  	    T && ((struct sock *)T)->__sk_common.skc_family == AF_INET ?
>  	    inet_ntoa(&((struct sock *)T)->__sk_common.skc_daddr) :
>  	    T && ((struct sock *)T)->__sk_common.skc_family == AF_INET6 ?
>  	    inet_ntoa6(&((struct sock *)T)->__sk_common.skc_v6_daddr) :
> -	    arg2 != NULL && (*(uint8_t *)arg2) >> 4 == 4 ?
> -	    inet_ntoa(arg7 == NET_PROBE_INBOUND ?
> -	    &((struct iphdr *)arg2)->saddr : &((struct iphdr *)arg2)->daddr) :
> -	    arg2 != NULL && *((uint8_t *)arg2) >> 4 == 6 ?
> -	    inet_ntoa6(arg7 == NET_PROBE_INBOUND ?
> -	    &((struct ipv6hdr *)arg2)->saddr :
> -	    &((struct ipv6hdr *)arg2)->daddr) :
> +	    arg2 != NULL && (*(uint8_t *)arg2 >> 4) == 4 ?
> +	    inet_ntoa(&((struct iphdr *)arg2)->saddr) :
> +	    arg2 != NULL && (*(uint8_t *)arg2 >> 4) == 6 ?
> +	    inet_ntoa6(&((struct ipv6hdr *)arg2)->saddr) :
>  	    "<unknown>";
> -	tcps_state = arg6;
> +	/* For state-change we probe right before state has changed, but
> +	 * provider definition wants new state in tcps_state; for
> +	 * state-change probes the trampoline stores it in arg5.
> +	 */
> +	tcps_state = arg6 == NET_PROBE_STATE ? arg5 :
> +	    T ? ((struct sock *)T)->__sk_common.skc_state : 0;
>  	tcps_iss = T ?
>  	    T->snd_una - (uint32_t)T->bytes_acked : 0;
>  	tcps_suna = T ? T->snd_una : 0;
> @@ -225,7 +235,10 @@ translator tcpsinfo_t < struct tcp_sock *T > {
>  	    T->rcv_nxt - (uint32_t)T->bytes_received : 0;
>  };
>  
> +/* state-change trampoline stores new state in arg5; at time of firing,
> + * state has not been updated, so last state is in tcp_sock state.
> + */
>  #pragma D binding "1.6.3" translator
>  translator tcplsinfo_t < int I > {
> -	tcps_state = I;
> +	tcps_state = arg3 ? ((struct sock *)arg3)->__sk_common.skc_state : 0;
>  };
> diff --git a/dlibs/x86_64/5.14/ip.d b/dlibs/x86_64/5.14/ip.d
> index f8b77f12..493b75a0 100644
> --- a/dlibs/x86_64/5.14/ip.d
> +++ b/dlibs/x86_64/5.14/ip.d
> @@ -1,6 +1,6 @@
>  /*
>   * Oracle Linux DTrace.
> - * Copyright (c) 2007, 2023, Oracle and/or its affiliates. All rights reserved.
> + * Copyright (c) 2007, 2025, Oracle and/or its affiliates. All rights reserved.
>   * Licensed under the Universal Permissive License v 1.0 as shown at
>   * http://oss.oracle.com/licenses/upl.
>   */
> @@ -46,31 +46,6 @@ inline int IPPROTO_MH		=	135;
>  
>  inline int TCP_MIN_HEADER_LENGTH =	20;
>  
> -/*
> - * For compatibility with Solaris.  Here the netstackid will be the pointer
> - * to the net namespace (nd_net in struct net_device).
> - */
> -typedef uint64_t	netstackid_t;
> -typedef __be32		ipaddr_t;
> -typedef struct in6_addr	in6_addr_t;
> -
> -/*
> - * pktinfo is where packet ID info can be made available for deeper
> - * analysis if packet IDs become supported by the kernel in the future.
> - * The pkt_addr member is currently always NULL.
> - */
> -typedef struct pktinfo {
> -	uintptr_t pkt_addr;
> -} pktinfo_t;
> -
> -/*
> - * csinfo is where connection state info is made available.
> - */
> -typedef struct csinfo {
> -	uintptr_t cs_addr;
> -	uint64_t cs_cid;
> -} csinfo_t;
> -
>  /*
>   * ipinfo contains common IP info for both IPv4 and IPv6.
>   */
> diff --git a/dlibs/x86_64/5.14/net.d b/dlibs/x86_64/5.14/net.d
> index 6ac34287..f1291696 100644
> --- a/dlibs/x86_64/5.14/net.d
> +++ b/dlibs/x86_64/5.14/net.d
> @@ -1,6 +1,6 @@
>  /*
>   * Oracle Linux DTrace.
> - * Copyright (c) 2007, 2017, Oracle and/or its affiliates. All rights reserved.
> + * Copyright (c) 2007, 2025, Oracle and/or its affiliates. All rights reserved.
>   * Licensed under the Universal Permissive License v 1.0 as shown at
>   * http://oss.oracle.com/licenses/upl.
>   */
> @@ -25,9 +25,36 @@ typedef struct conninfo {
>  	 string ci_protocol;	/* protocol (ipv4, ipv6, etc) */
>  } conninfo_t;
>  
> +/*
> + * For compatibility with Solaris.  Here the netstackid will be the pointer
> + * to the net namespace (nd_net in struct net_device).
> + */
> +typedef uint64_t	netstackid_t;
> +typedef __be32		ipaddr_t;
> +typedef struct in6_addr	in6_addr_t;
> +
> +/*
> + * pktinfo is where packet ID info can be made available for deeper
> + * analysis if packet IDs become supported by the kernel in the future.
> + * The pkt_addr member is currently always NULL.
> + */
> +typedef struct pktinfo {
> +	uintptr_t pkt_addr;
> +} pktinfo_t;
> +
> +/*
> + * csinfo is where connection state info is made available.
> + */
> +typedef struct csinfo {
> +	uintptr_t cs_addr;
> +	uint64_t cs_cid;
> +} csinfo_t;
> +
>  /*
>   * We use these values to determine if a probe point is associated
> - * with sending (outbound) or receiving (inbound).
> + * with sending (outbound) or receiving (inbound) or a state-related
> + * probe (i.e. neither inbound our outbound).
>   */
>  inline int NET_PROBE_OUTBOUND =		0x00;
>  inline int NET_PROBE_INBOUND =		0x01;
> +inline int NET_PROBE_STATE =		0x02;
> diff --git a/dlibs/x86_64/5.14/tcp.d b/dlibs/x86_64/5.14/tcp.d
> index 54e310cb..48d9adb4 100644
> --- a/dlibs/x86_64/5.14/tcp.d
> +++ b/dlibs/x86_64/5.14/tcp.d
> @@ -1,13 +1,13 @@
>  /*
>   * Oracle Linux DTrace.
> - * Copyright (c) 2010, 2017, Oracle and/or its affiliates. All rights reserved.
> + * Copyright (c) 2010, 2025, Oracle and/or its affiliates. All rights reserved.
>   * Licensed under the Universal Permissive License v 1.0 as shown at
>   * http://oss.oracle.com/licenses/upl.
>   */
>  
>  #pragma D depends_on module vmlinux
>  #pragma D depends_on library net.d
> -#pragma D depends_on provider ip
> +#pragma D depends_on library ip.d
>  #pragma D depends_on provider tcp
>  
>  inline int TH_FIN =	0x01;
> @@ -111,30 +111,38 @@ translator tcpinfo_t < struct tcphdr *T > {
>  	tcp_seq = T ? ntohl(T->seq) : 0;
>  	tcp_ack = T ? ntohl(T->ack_seq) : 0;
>  	tcp_offset = T ? (*(uint8_t *)(T + 12) & 0xf0) >> 2 : 0;
> -	tcp_flags = T ? *(uint8_t *)(T + 13) : 0;
> +	tcp_flags = T ? *((uint8_t *)T + 13) : 0;
>  	tcp_window = T ? ntohs(T->window) : 0;
>  	tcp_checksum = T ? ntohs(T->check) : 0;
>  	tcp_urgent = T ? ntohs(T->urg_ptr) : 0;
>  	tcp_hdr = (uintptr_t)T;
>  };
>  
> +/* timewait sockets and inet connection sockets do not populate all fields
> + * and are not classified as full sockets; this inline helps translators
> + * spot them and act appropriately.
> + */
> +inline int tcp_fullsock[struct tcp_sock *sk] =
> +	(((struct sock_common *)sk)->skc_state != TCP_STATE_SYN_RECEIVED &&
> +	 ((struct sock_common *)sk)->skc_state != TCP_STATE_TIME_WAIT);
>  /*
>   * In the main we simply translate from the "struct [tcp_]sock *" to
>   * a tcpsinfo_t *.  However there are a few exceptions:
>   *
> - * - tcps_state is always derived from arg6.  The reason is that in some
> + * - tcps_state for state-change is arg5.  The reason is that in some
>   * state transitions sock->sk_state does not reflect the actual TCP
>   * connection state.  For example the TIME_WAIT state is handled in
>   * Linux by creating a separate timewait socket and the state of the
>   * original socket is CLOSED.  In some other cases we also need to
> - * instrument state transition prior to the update of sk_state.  To do
> - * all of this we rely on arg6.
> + * instrument state transition _prior_ to the update of sk_state.  To do
> + * all of this we rely on arg5 to hold the new state. arg6 is set to
> + * NET_PROBE_STATE to quickly identify state-change probes.
>   * - we sometimes need to retrieve local/remote port/address settings from
>   * TCP and IP headers directly, for example prior to the address/port
>   * being committed to the socket.  To do this effectively we need to know
>   * if the packet data is inbound (in which case the local IP/port are the
>   * destination) or outbound (in which case the local IP/port are the source).
> - * arg7 is set to 0 for outbound traffic and 1 for inbound so we use these
> + * arg6 is set to 0 for outbound traffic and 1 for inbound so we use these
>   * to reconstruct the address/port info where necessary.  arg2 used for IP
>   * information while arg4 contains the TCP header, so it is used for port data.
>   * NET_PROBE_INBOUND is defined as 1, NET_PROBE_OUTBOUND as 0 in net.d.
> @@ -158,47 +166,49 @@ translator tcpsinfo_t < struct tcp_sock *T > {
>              ((uint32_t *)&((struct sock *)T)->__sk_common.skc_v6_daddr)[2] &&
>  	    ((uint32_t *)&((struct sock *)T)->__sk_common.skc_v6_rcv_saddr)[3])
>  	    : 0;
> -	tcps_lport = (T && ((struct inet_sock *)T)->inet_sport != 0) ?
> +	tcps_lport = T && ((struct inet_sock *)T)->inet_sport != 0 &&
> +	    tcp_fullsock[T] ?
>  	    ntohs(((struct inet_sock *)T)->inet_sport) :
>  	    (T && ((struct inet_sock *)T)->inet_sport == 0) ?
> -	    ntohs(((struct sock *)T)->__sk_common.skc_num) :
> +	    ((struct sock *)T)->__sk_common.skc_num :
>  	    arg4 != NULL ?
>  	    ntohs(arg7 == NET_PROBE_INBOUND ?
> -	    ((struct tcphdr *)arg4)->dest : ((struct tcphdr *)arg4)->source) :
> +		  ((struct tcphdr *)arg4)->dest :
> +		  ((struct tcphdr *)arg4)->source) :
>  	    0;
>  	tcps_rport = T && ((struct sock *)T)->__sk_common.skc_dport != 0 ?
>  	    ntohs(((struct sock *)T)->__sk_common.skc_dport) :
>  	    arg4 != NULL ?
>  	    ntohs(arg7 == NET_PROBE_INBOUND ?
> -            ((struct tcphdr *)arg4)->source : ((struct tcphdr *)arg4)->dest) :
> +		  ((struct tcphdr *)arg4)->source :
> +		  ((struct tcphdr *)arg4)->dest) :
>  	    0;
>  	tcps_laddr =
>  	    T && ((struct sock *)T)->__sk_common.skc_family == AF_INET ?
>  	    inet_ntoa(&((struct sock *)T)->__sk_common.skc_rcv_saddr) :
>  	    T && ((struct sock *)T)->__sk_common.skc_family == AF_INET6 ?
>  	    inet_ntoa6(&((struct sock *)T)->__sk_common.skc_v6_rcv_saddr) :
> -	    arg2 != NULL && (*(uint8_t *)arg2) >> 4 == 4 ?
> -	    inet_ntoa(arg7 == NET_PROBE_INBOUND ?
> -	    &((struct iphdr *)arg2)->daddr : &((struct iphdr *)arg2)->saddr) :
> -	    arg2 != NULL && *((uint8_t *)arg2) >> 4 == 6 ?
> -	    inet_ntoa6(arg7 == NET_PROBE_INBOUND ?
> -	    &((struct ipv6hdr *)arg2)->daddr :
> -	    &((struct ipv6hdr *)arg2)->saddr) :
> +	    arg2 != NULL && (*(uint8_t *)arg2 >> 4) == 4 ?
> +	    inet_ntoa(&((struct iphdr *)arg2)->daddr) :
> +	    arg2 != NULL && (*(uint8_t *)arg2 >> 4) == 6 ?
> +	    inet_ntoa6(&((struct ipv6hdr *)arg2)->daddr) :
>  	    "<unknown>";
>  	tcps_raddr =
>  	    T && ((struct sock *)T)->__sk_common.skc_family == AF_INET ?
>  	    inet_ntoa(&((struct sock *)T)->__sk_common.skc_daddr) :
>  	    T && ((struct sock *)T)->__sk_common.skc_family == AF_INET6 ?
>  	    inet_ntoa6(&((struct sock *)T)->__sk_common.skc_v6_daddr) :
> -	    arg2 != NULL && (*(uint8_t *)arg2) >> 4 == 4 ?
> -	    inet_ntoa(arg7 == NET_PROBE_INBOUND ?
> -	    &((struct iphdr *)arg2)->saddr : &((struct iphdr *)arg2)->daddr) :
> -	    arg2 != NULL && *((uint8_t *)arg2) >> 4 == 6 ?
> -	    inet_ntoa6(arg7 == NET_PROBE_INBOUND ?
> -	    &((struct ipv6hdr *)arg2)->saddr :
> -	    &((struct ipv6hdr *)arg2)->daddr) :
> +	    arg2 != NULL && (*(uint8_t *)arg2 >> 4) == 4 ?
> +	    inet_ntoa(&((struct iphdr *)arg2)->saddr) :
> +	    arg2 != NULL && (*(uint8_t *)arg2 >> 4) == 6 ?
> +	    inet_ntoa6(&((struct ipv6hdr *)arg2)->saddr) :
>  	    "<unknown>";
> -	tcps_state = arg6;
> +	/* For state-change we probe right before state has changed, but
> +	 * provider definition wants new state in tcps_state; for
> +	 * state-change probes the trampoline stores it in arg5.
> +	 */
> +	tcps_state = arg6 == NET_PROBE_STATE ? arg5 :
> +	    T ? ((struct sock *)T)->__sk_common.skc_state : 0;
>  	tcps_iss = T ?
>  	    T->snd_una - (uint32_t)T->bytes_acked : 0;
>  	tcps_suna = T ? T->snd_una : 0;
> @@ -225,7 +235,10 @@ translator tcpsinfo_t < struct tcp_sock *T > {
>  	    T->rcv_nxt - (uint32_t)T->bytes_received : 0;
>  };
>  
> +/* state-change trampoline stores new state in arg5; at time of firing,
> + * state has not been updated, so last state is in tcp_sock state.
> + */
>  #pragma D binding "1.6.3" translator
>  translator tcplsinfo_t < int I > {
> -	tcps_state = I;
> +	tcps_state = arg3 ? ((struct sock *)arg3)->__sk_common.skc_state : 0;
>  };
> diff --git a/dlibs/x86_64/5.16/ip.d b/dlibs/x86_64/5.16/ip.d
> index f8b77f12..493b75a0 100644
> --- a/dlibs/x86_64/5.16/ip.d
> +++ b/dlibs/x86_64/5.16/ip.d
> @@ -1,6 +1,6 @@
>  /*
>   * Oracle Linux DTrace.
> - * Copyright (c) 2007, 2023, Oracle and/or its affiliates. All rights reserved.
> + * Copyright (c) 2007, 2025, Oracle and/or its affiliates. All rights reserved.
>   * Licensed under the Universal Permissive License v 1.0 as shown at
>   * http://oss.oracle.com/licenses/upl.
>   */
> @@ -46,31 +46,6 @@ inline int IPPROTO_MH		=	135;
>  
>  inline int TCP_MIN_HEADER_LENGTH =	20;
>  
> -/*
> - * For compatibility with Solaris.  Here the netstackid will be the pointer
> - * to the net namespace (nd_net in struct net_device).
> - */
> -typedef uint64_t	netstackid_t;
> -typedef __be32		ipaddr_t;
> -typedef struct in6_addr	in6_addr_t;
> -
> -/*
> - * pktinfo is where packet ID info can be made available for deeper
> - * analysis if packet IDs become supported by the kernel in the future.
> - * The pkt_addr member is currently always NULL.
> - */
> -typedef struct pktinfo {
> -	uintptr_t pkt_addr;
> -} pktinfo_t;
> -
> -/*
> - * csinfo is where connection state info is made available.
> - */
> -typedef struct csinfo {
> -	uintptr_t cs_addr;
> -	uint64_t cs_cid;
> -} csinfo_t;
> -
>  /*
>   * ipinfo contains common IP info for both IPv4 and IPv6.
>   */
> diff --git a/dlibs/x86_64/5.16/net.d b/dlibs/x86_64/5.16/net.d
> index 6ac34287..f1291696 100644
> --- a/dlibs/x86_64/5.16/net.d
> +++ b/dlibs/x86_64/5.16/net.d
> @@ -1,6 +1,6 @@
>  /*
>   * Oracle Linux DTrace.
> - * Copyright (c) 2007, 2017, Oracle and/or its affiliates. All rights reserved.
> + * Copyright (c) 2007, 2025, Oracle and/or its affiliates. All rights reserved.
>   * Licensed under the Universal Permissive License v 1.0 as shown at
>   * http://oss.oracle.com/licenses/upl.
>   */
> @@ -25,9 +25,36 @@ typedef struct conninfo {
>  	 string ci_protocol;	/* protocol (ipv4, ipv6, etc) */
>  } conninfo_t;
>  
> +/*
> + * For compatibility with Solaris.  Here the netstackid will be the pointer
> + * to the net namespace (nd_net in struct net_device).
> + */
> +typedef uint64_t	netstackid_t;
> +typedef __be32		ipaddr_t;
> +typedef struct in6_addr	in6_addr_t;
> +
> +/*
> + * pktinfo is where packet ID info can be made available for deeper
> + * analysis if packet IDs become supported by the kernel in the future.
> + * The pkt_addr member is currently always NULL.
> + */
> +typedef struct pktinfo {
> +	uintptr_t pkt_addr;
> +} pktinfo_t;
> +
> +/*
> + * csinfo is where connection state info is made available.
> + */
> +typedef struct csinfo {
> +	uintptr_t cs_addr;
> +	uint64_t cs_cid;
> +} csinfo_t;
> +
>  /*
>   * We use these values to determine if a probe point is associated
> - * with sending (outbound) or receiving (inbound).
> + * with sending (outbound) or receiving (inbound) or a state-related
> + * probe (i.e. neither inbound our outbound).
>   */
>  inline int NET_PROBE_OUTBOUND =		0x00;
>  inline int NET_PROBE_INBOUND =		0x01;
> +inline int NET_PROBE_STATE =		0x02;
> diff --git a/dlibs/x86_64/5.16/tcp.d b/dlibs/x86_64/5.16/tcp.d
> index 54e310cb..48d9adb4 100644
> --- a/dlibs/x86_64/5.16/tcp.d
> +++ b/dlibs/x86_64/5.16/tcp.d
> @@ -1,13 +1,13 @@
>  /*
>   * Oracle Linux DTrace.
> - * Copyright (c) 2010, 2017, Oracle and/or its affiliates. All rights reserved.
> + * Copyright (c) 2010, 2025, Oracle and/or its affiliates. All rights reserved.
>   * Licensed under the Universal Permissive License v 1.0 as shown at
>   * http://oss.oracle.com/licenses/upl.
>   */
>  
>  #pragma D depends_on module vmlinux
>  #pragma D depends_on library net.d
> -#pragma D depends_on provider ip
> +#pragma D depends_on library ip.d
>  #pragma D depends_on provider tcp
>  
>  inline int TH_FIN =	0x01;
> @@ -111,30 +111,38 @@ translator tcpinfo_t < struct tcphdr *T > {
>  	tcp_seq = T ? ntohl(T->seq) : 0;
>  	tcp_ack = T ? ntohl(T->ack_seq) : 0;
>  	tcp_offset = T ? (*(uint8_t *)(T + 12) & 0xf0) >> 2 : 0;
> -	tcp_flags = T ? *(uint8_t *)(T + 13) : 0;
> +	tcp_flags = T ? *((uint8_t *)T + 13) : 0;
>  	tcp_window = T ? ntohs(T->window) : 0;
>  	tcp_checksum = T ? ntohs(T->check) : 0;
>  	tcp_urgent = T ? ntohs(T->urg_ptr) : 0;
>  	tcp_hdr = (uintptr_t)T;
>  };
>  
> +/* timewait sockets and inet connection sockets do not populate all fields
> + * and are not classified as full sockets; this inline helps translators
> + * spot them and act appropriately.
> + */
> +inline int tcp_fullsock[struct tcp_sock *sk] =
> +	(((struct sock_common *)sk)->skc_state != TCP_STATE_SYN_RECEIVED &&
> +	 ((struct sock_common *)sk)->skc_state != TCP_STATE_TIME_WAIT);
>  /*
>   * In the main we simply translate from the "struct [tcp_]sock *" to
>   * a tcpsinfo_t *.  However there are a few exceptions:
>   *
> - * - tcps_state is always derived from arg6.  The reason is that in some
> + * - tcps_state for state-change is arg5.  The reason is that in some
>   * state transitions sock->sk_state does not reflect the actual TCP
>   * connection state.  For example the TIME_WAIT state is handled in
>   * Linux by creating a separate timewait socket and the state of the
>   * original socket is CLOSED.  In some other cases we also need to
> - * instrument state transition prior to the update of sk_state.  To do
> - * all of this we rely on arg6.
> + * instrument state transition _prior_ to the update of sk_state.  To do
> + * all of this we rely on arg5 to hold the new state. arg6 is set to
> + * NET_PROBE_STATE to quickly identify state-change probes.
>   * - we sometimes need to retrieve local/remote port/address settings from
>   * TCP and IP headers directly, for example prior to the address/port
>   * being committed to the socket.  To do this effectively we need to know
>   * if the packet data is inbound (in which case the local IP/port are the
>   * destination) or outbound (in which case the local IP/port are the source).
> - * arg7 is set to 0 for outbound traffic and 1 for inbound so we use these
> + * arg6 is set to 0 for outbound traffic and 1 for inbound so we use these
>   * to reconstruct the address/port info where necessary.  arg2 used for IP
>   * information while arg4 contains the TCP header, so it is used for port data.
>   * NET_PROBE_INBOUND is defined as 1, NET_PROBE_OUTBOUND as 0 in net.d.
> @@ -158,47 +166,49 @@ translator tcpsinfo_t < struct tcp_sock *T > {
>              ((uint32_t *)&((struct sock *)T)->__sk_common.skc_v6_daddr)[2] &&
>  	    ((uint32_t *)&((struct sock *)T)->__sk_common.skc_v6_rcv_saddr)[3])
>  	    : 0;
> -	tcps_lport = (T && ((struct inet_sock *)T)->inet_sport != 0) ?
> +	tcps_lport = T && ((struct inet_sock *)T)->inet_sport != 0 &&
> +	    tcp_fullsock[T] ?
>  	    ntohs(((struct inet_sock *)T)->inet_sport) :
>  	    (T && ((struct inet_sock *)T)->inet_sport == 0) ?
> -	    ntohs(((struct sock *)T)->__sk_common.skc_num) :
> +	    ((struct sock *)T)->__sk_common.skc_num :
>  	    arg4 != NULL ?
>  	    ntohs(arg7 == NET_PROBE_INBOUND ?
> -	    ((struct tcphdr *)arg4)->dest : ((struct tcphdr *)arg4)->source) :
> +		  ((struct tcphdr *)arg4)->dest :
> +		  ((struct tcphdr *)arg4)->source) :
>  	    0;
>  	tcps_rport = T && ((struct sock *)T)->__sk_common.skc_dport != 0 ?
>  	    ntohs(((struct sock *)T)->__sk_common.skc_dport) :
>  	    arg4 != NULL ?
>  	    ntohs(arg7 == NET_PROBE_INBOUND ?
> -            ((struct tcphdr *)arg4)->source : ((struct tcphdr *)arg4)->dest) :
> +		  ((struct tcphdr *)arg4)->source :
> +		  ((struct tcphdr *)arg4)->dest) :
>  	    0;
>  	tcps_laddr =
>  	    T && ((struct sock *)T)->__sk_common.skc_family == AF_INET ?
>  	    inet_ntoa(&((struct sock *)T)->__sk_common.skc_rcv_saddr) :
>  	    T && ((struct sock *)T)->__sk_common.skc_family == AF_INET6 ?
>  	    inet_ntoa6(&((struct sock *)T)->__sk_common.skc_v6_rcv_saddr) :
> -	    arg2 != NULL && (*(uint8_t *)arg2) >> 4 == 4 ?
> -	    inet_ntoa(arg7 == NET_PROBE_INBOUND ?
> -	    &((struct iphdr *)arg2)->daddr : &((struct iphdr *)arg2)->saddr) :
> -	    arg2 != NULL && *((uint8_t *)arg2) >> 4 == 6 ?
> -	    inet_ntoa6(arg7 == NET_PROBE_INBOUND ?
> -	    &((struct ipv6hdr *)arg2)->daddr :
> -	    &((struct ipv6hdr *)arg2)->saddr) :
> +	    arg2 != NULL && (*(uint8_t *)arg2 >> 4) == 4 ?
> +	    inet_ntoa(&((struct iphdr *)arg2)->daddr) :
> +	    arg2 != NULL && (*(uint8_t *)arg2 >> 4) == 6 ?
> +	    inet_ntoa6(&((struct ipv6hdr *)arg2)->daddr) :
>  	    "<unknown>";
>  	tcps_raddr =
>  	    T && ((struct sock *)T)->__sk_common.skc_family == AF_INET ?
>  	    inet_ntoa(&((struct sock *)T)->__sk_common.skc_daddr) :
>  	    T && ((struct sock *)T)->__sk_common.skc_family == AF_INET6 ?
>  	    inet_ntoa6(&((struct sock *)T)->__sk_common.skc_v6_daddr) :
> -	    arg2 != NULL && (*(uint8_t *)arg2) >> 4 == 4 ?
> -	    inet_ntoa(arg7 == NET_PROBE_INBOUND ?
> -	    &((struct iphdr *)arg2)->saddr : &((struct iphdr *)arg2)->daddr) :
> -	    arg2 != NULL && *((uint8_t *)arg2) >> 4 == 6 ?
> -	    inet_ntoa6(arg7 == NET_PROBE_INBOUND ?
> -	    &((struct ipv6hdr *)arg2)->saddr :
> -	    &((struct ipv6hdr *)arg2)->daddr) :
> +	    arg2 != NULL && (*(uint8_t *)arg2 >> 4) == 4 ?
> +	    inet_ntoa(&((struct iphdr *)arg2)->saddr) :
> +	    arg2 != NULL && (*(uint8_t *)arg2 >> 4) == 6 ?
> +	    inet_ntoa6(&((struct ipv6hdr *)arg2)->saddr) :
>  	    "<unknown>";
> -	tcps_state = arg6;
> +	/* For state-change we probe right before state has changed, but
> +	 * provider definition wants new state in tcps_state; for
> +	 * state-change probes the trampoline stores it in arg5.
> +	 */
> +	tcps_state = arg6 == NET_PROBE_STATE ? arg5 :
> +	    T ? ((struct sock *)T)->__sk_common.skc_state : 0;
>  	tcps_iss = T ?
>  	    T->snd_una - (uint32_t)T->bytes_acked : 0;
>  	tcps_suna = T ? T->snd_una : 0;
> @@ -225,7 +235,10 @@ translator tcpsinfo_t < struct tcp_sock *T > {
>  	    T->rcv_nxt - (uint32_t)T->bytes_received : 0;
>  };
>  
> +/* state-change trampoline stores new state in arg5; at time of firing,
> + * state has not been updated, so last state is in tcp_sock state.
> + */
>  #pragma D binding "1.6.3" translator
>  translator tcplsinfo_t < int I > {
> -	tcps_state = I;
> +	tcps_state = arg3 ? ((struct sock *)arg3)->__sk_common.skc_state : 0;
>  };
> diff --git a/dlibs/x86_64/5.2/ip.d b/dlibs/x86_64/5.2/ip.d
> index f8b77f12..493b75a0 100644
> --- a/dlibs/x86_64/5.2/ip.d
> +++ b/dlibs/x86_64/5.2/ip.d
> @@ -1,6 +1,6 @@
>  /*
>   * Oracle Linux DTrace.
> - * Copyright (c) 2007, 2023, Oracle and/or its affiliates. All rights reserved.
> + * Copyright (c) 2007, 2025, Oracle and/or its affiliates. All rights reserved.
>   * Licensed under the Universal Permissive License v 1.0 as shown at
>   * http://oss.oracle.com/licenses/upl.
>   */
> @@ -46,31 +46,6 @@ inline int IPPROTO_MH		=	135;
>  
>  inline int TCP_MIN_HEADER_LENGTH =	20;
>  
> -/*
> - * For compatibility with Solaris.  Here the netstackid will be the pointer
> - * to the net namespace (nd_net in struct net_device).
> - */
> -typedef uint64_t	netstackid_t;
> -typedef __be32		ipaddr_t;
> -typedef struct in6_addr	in6_addr_t;
> -
> -/*
> - * pktinfo is where packet ID info can be made available for deeper
> - * analysis if packet IDs become supported by the kernel in the future.
> - * The pkt_addr member is currently always NULL.
> - */
> -typedef struct pktinfo {
> -	uintptr_t pkt_addr;
> -} pktinfo_t;
> -
> -/*
> - * csinfo is where connection state info is made available.
> - */
> -typedef struct csinfo {
> -	uintptr_t cs_addr;
> -	uint64_t cs_cid;
> -} csinfo_t;
> -
>  /*
>   * ipinfo contains common IP info for both IPv4 and IPv6.
>   */
> diff --git a/dlibs/x86_64/5.2/net.d b/dlibs/x86_64/5.2/net.d
> index 6ac34287..f1291696 100644
> --- a/dlibs/x86_64/5.2/net.d
> +++ b/dlibs/x86_64/5.2/net.d
> @@ -1,6 +1,6 @@
>  /*
>   * Oracle Linux DTrace.
> - * Copyright (c) 2007, 2017, Oracle and/or its affiliates. All rights reserved.
> + * Copyright (c) 2007, 2025, Oracle and/or its affiliates. All rights reserved.
>   * Licensed under the Universal Permissive License v 1.0 as shown at
>   * http://oss.oracle.com/licenses/upl.
>   */
> @@ -25,9 +25,36 @@ typedef struct conninfo {
>  	 string ci_protocol;	/* protocol (ipv4, ipv6, etc) */
>  } conninfo_t;
>  
> +/*
> + * For compatibility with Solaris.  Here the netstackid will be the pointer
> + * to the net namespace (nd_net in struct net_device).
> + */
> +typedef uint64_t	netstackid_t;
> +typedef __be32		ipaddr_t;
> +typedef struct in6_addr	in6_addr_t;
> +
> +/*
> + * pktinfo is where packet ID info can be made available for deeper
> + * analysis if packet IDs become supported by the kernel in the future.
> + * The pkt_addr member is currently always NULL.
> + */
> +typedef struct pktinfo {
> +	uintptr_t pkt_addr;
> +} pktinfo_t;
> +
> +/*
> + * csinfo is where connection state info is made available.
> + */
> +typedef struct csinfo {
> +	uintptr_t cs_addr;
> +	uint64_t cs_cid;
> +} csinfo_t;
> +
>  /*
>   * We use these values to determine if a probe point is associated
> - * with sending (outbound) or receiving (inbound).
> + * with sending (outbound) or receiving (inbound) or a state-related
> + * probe (i.e. neither inbound our outbound).
>   */
>  inline int NET_PROBE_OUTBOUND =		0x00;
>  inline int NET_PROBE_INBOUND =		0x01;
> +inline int NET_PROBE_STATE =		0x02;
> diff --git a/dlibs/x86_64/5.2/tcp.d b/dlibs/x86_64/5.2/tcp.d
> index 54e310cb..48d9adb4 100644
> --- a/dlibs/x86_64/5.2/tcp.d
> +++ b/dlibs/x86_64/5.2/tcp.d
> @@ -1,13 +1,13 @@
>  /*
>   * Oracle Linux DTrace.
> - * Copyright (c) 2010, 2017, Oracle and/or its affiliates. All rights reserved.
> + * Copyright (c) 2010, 2025, Oracle and/or its affiliates. All rights reserved.
>   * Licensed under the Universal Permissive License v 1.0 as shown at
>   * http://oss.oracle.com/licenses/upl.
>   */
>  
>  #pragma D depends_on module vmlinux
>  #pragma D depends_on library net.d
> -#pragma D depends_on provider ip
> +#pragma D depends_on library ip.d
>  #pragma D depends_on provider tcp
>  
>  inline int TH_FIN =	0x01;
> @@ -111,30 +111,38 @@ translator tcpinfo_t < struct tcphdr *T > {
>  	tcp_seq = T ? ntohl(T->seq) : 0;
>  	tcp_ack = T ? ntohl(T->ack_seq) : 0;
>  	tcp_offset = T ? (*(uint8_t *)(T + 12) & 0xf0) >> 2 : 0;
> -	tcp_flags = T ? *(uint8_t *)(T + 13) : 0;
> +	tcp_flags = T ? *((uint8_t *)T + 13) : 0;
>  	tcp_window = T ? ntohs(T->window) : 0;
>  	tcp_checksum = T ? ntohs(T->check) : 0;
>  	tcp_urgent = T ? ntohs(T->urg_ptr) : 0;
>  	tcp_hdr = (uintptr_t)T;
>  };
>  
> +/* timewait sockets and inet connection sockets do not populate all fields
> + * and are not classified as full sockets; this inline helps translators
> + * spot them and act appropriately.
> + */
> +inline int tcp_fullsock[struct tcp_sock *sk] =
> +	(((struct sock_common *)sk)->skc_state != TCP_STATE_SYN_RECEIVED &&
> +	 ((struct sock_common *)sk)->skc_state != TCP_STATE_TIME_WAIT);
>  /*
>   * In the main we simply translate from the "struct [tcp_]sock *" to
>   * a tcpsinfo_t *.  However there are a few exceptions:
>   *
> - * - tcps_state is always derived from arg6.  The reason is that in some
> + * - tcps_state for state-change is arg5.  The reason is that in some
>   * state transitions sock->sk_state does not reflect the actual TCP
>   * connection state.  For example the TIME_WAIT state is handled in
>   * Linux by creating a separate timewait socket and the state of the
>   * original socket is CLOSED.  In some other cases we also need to
> - * instrument state transition prior to the update of sk_state.  To do
> - * all of this we rely on arg6.
> + * instrument state transition _prior_ to the update of sk_state.  To do
> + * all of this we rely on arg5 to hold the new state. arg6 is set to
> + * NET_PROBE_STATE to quickly identify state-change probes.
>   * - we sometimes need to retrieve local/remote port/address settings from
>   * TCP and IP headers directly, for example prior to the address/port
>   * being committed to the socket.  To do this effectively we need to know
>   * if the packet data is inbound (in which case the local IP/port are the
>   * destination) or outbound (in which case the local IP/port are the source).
> - * arg7 is set to 0 for outbound traffic and 1 for inbound so we use these
> + * arg6 is set to 0 for outbound traffic and 1 for inbound so we use these
>   * to reconstruct the address/port info where necessary.  arg2 used for IP
>   * information while arg4 contains the TCP header, so it is used for port data.
>   * NET_PROBE_INBOUND is defined as 1, NET_PROBE_OUTBOUND as 0 in net.d.
> @@ -158,47 +166,49 @@ translator tcpsinfo_t < struct tcp_sock *T > {
>              ((uint32_t *)&((struct sock *)T)->__sk_common.skc_v6_daddr)[2] &&
>  	    ((uint32_t *)&((struct sock *)T)->__sk_common.skc_v6_rcv_saddr)[3])
>  	    : 0;
> -	tcps_lport = (T && ((struct inet_sock *)T)->inet_sport != 0) ?
> +	tcps_lport = T && ((struct inet_sock *)T)->inet_sport != 0 &&
> +	    tcp_fullsock[T] ?
>  	    ntohs(((struct inet_sock *)T)->inet_sport) :
>  	    (T && ((struct inet_sock *)T)->inet_sport == 0) ?
> -	    ntohs(((struct sock *)T)->__sk_common.skc_num) :
> +	    ((struct sock *)T)->__sk_common.skc_num :
>  	    arg4 != NULL ?
>  	    ntohs(arg7 == NET_PROBE_INBOUND ?
> -	    ((struct tcphdr *)arg4)->dest : ((struct tcphdr *)arg4)->source) :
> +		  ((struct tcphdr *)arg4)->dest :
> +		  ((struct tcphdr *)arg4)->source) :
>  	    0;
>  	tcps_rport = T && ((struct sock *)T)->__sk_common.skc_dport != 0 ?
>  	    ntohs(((struct sock *)T)->__sk_common.skc_dport) :
>  	    arg4 != NULL ?
>  	    ntohs(arg7 == NET_PROBE_INBOUND ?
> -            ((struct tcphdr *)arg4)->source : ((struct tcphdr *)arg4)->dest) :
> +		  ((struct tcphdr *)arg4)->source :
> +		  ((struct tcphdr *)arg4)->dest) :
>  	    0;
>  	tcps_laddr =
>  	    T && ((struct sock *)T)->__sk_common.skc_family == AF_INET ?
>  	    inet_ntoa(&((struct sock *)T)->__sk_common.skc_rcv_saddr) :
>  	    T && ((struct sock *)T)->__sk_common.skc_family == AF_INET6 ?
>  	    inet_ntoa6(&((struct sock *)T)->__sk_common.skc_v6_rcv_saddr) :
> -	    arg2 != NULL && (*(uint8_t *)arg2) >> 4 == 4 ?
> -	    inet_ntoa(arg7 == NET_PROBE_INBOUND ?
> -	    &((struct iphdr *)arg2)->daddr : &((struct iphdr *)arg2)->saddr) :
> -	    arg2 != NULL && *((uint8_t *)arg2) >> 4 == 6 ?
> -	    inet_ntoa6(arg7 == NET_PROBE_INBOUND ?
> -	    &((struct ipv6hdr *)arg2)->daddr :
> -	    &((struct ipv6hdr *)arg2)->saddr) :
> +	    arg2 != NULL && (*(uint8_t *)arg2 >> 4) == 4 ?
> +	    inet_ntoa(&((struct iphdr *)arg2)->daddr) :
> +	    arg2 != NULL && (*(uint8_t *)arg2 >> 4) == 6 ?
> +	    inet_ntoa6(&((struct ipv6hdr *)arg2)->daddr) :
>  	    "<unknown>";
>  	tcps_raddr =
>  	    T && ((struct sock *)T)->__sk_common.skc_family == AF_INET ?
>  	    inet_ntoa(&((struct sock *)T)->__sk_common.skc_daddr) :
>  	    T && ((struct sock *)T)->__sk_common.skc_family == AF_INET6 ?
>  	    inet_ntoa6(&((struct sock *)T)->__sk_common.skc_v6_daddr) :
> -	    arg2 != NULL && (*(uint8_t *)arg2) >> 4 == 4 ?
> -	    inet_ntoa(arg7 == NET_PROBE_INBOUND ?
> -	    &((struct iphdr *)arg2)->saddr : &((struct iphdr *)arg2)->daddr) :
> -	    arg2 != NULL && *((uint8_t *)arg2) >> 4 == 6 ?
> -	    inet_ntoa6(arg7 == NET_PROBE_INBOUND ?
> -	    &((struct ipv6hdr *)arg2)->saddr :
> -	    &((struct ipv6hdr *)arg2)->daddr) :
> +	    arg2 != NULL && (*(uint8_t *)arg2 >> 4) == 4 ?
> +	    inet_ntoa(&((struct iphdr *)arg2)->saddr) :
> +	    arg2 != NULL && (*(uint8_t *)arg2 >> 4) == 6 ?
> +	    inet_ntoa6(&((struct ipv6hdr *)arg2)->saddr) :
>  	    "<unknown>";
> -	tcps_state = arg6;
> +	/* For state-change we probe right before state has changed, but
> +	 * provider definition wants new state in tcps_state; for
> +	 * state-change probes the trampoline stores it in arg5.
> +	 */
> +	tcps_state = arg6 == NET_PROBE_STATE ? arg5 :
> +	    T ? ((struct sock *)T)->__sk_common.skc_state : 0;
>  	tcps_iss = T ?
>  	    T->snd_una - (uint32_t)T->bytes_acked : 0;
>  	tcps_suna = T ? T->snd_una : 0;
> @@ -225,7 +235,10 @@ translator tcpsinfo_t < struct tcp_sock *T > {
>  	    T->rcv_nxt - (uint32_t)T->bytes_received : 0;
>  };
>  
> +/* state-change trampoline stores new state in arg5; at time of firing,
> + * state has not been updated, so last state is in tcp_sock state.
> + */
>  #pragma D binding "1.6.3" translator
>  translator tcplsinfo_t < int I > {
> -	tcps_state = I;
> +	tcps_state = arg3 ? ((struct sock *)arg3)->__sk_common.skc_state : 0;
>  };
> diff --git a/dlibs/x86_64/5.6/ip.d b/dlibs/x86_64/5.6/ip.d
> index f8b77f12..493b75a0 100644
> --- a/dlibs/x86_64/5.6/ip.d
> +++ b/dlibs/x86_64/5.6/ip.d
> @@ -1,6 +1,6 @@
>  /*
>   * Oracle Linux DTrace.
> - * Copyright (c) 2007, 2023, Oracle and/or its affiliates. All rights reserved.
> + * Copyright (c) 2007, 2025, Oracle and/or its affiliates. All rights reserved.
>   * Licensed under the Universal Permissive License v 1.0 as shown at
>   * http://oss.oracle.com/licenses/upl.
>   */
> @@ -46,31 +46,6 @@ inline int IPPROTO_MH		=	135;
>  
>  inline int TCP_MIN_HEADER_LENGTH =	20;
>  
> -/*
> - * For compatibility with Solaris.  Here the netstackid will be the pointer
> - * to the net namespace (nd_net in struct net_device).
> - */
> -typedef uint64_t	netstackid_t;
> -typedef __be32		ipaddr_t;
> -typedef struct in6_addr	in6_addr_t;
> -
> -/*
> - * pktinfo is where packet ID info can be made available for deeper
> - * analysis if packet IDs become supported by the kernel in the future.
> - * The pkt_addr member is currently always NULL.
> - */
> -typedef struct pktinfo {
> -	uintptr_t pkt_addr;
> -} pktinfo_t;
> -
> -/*
> - * csinfo is where connection state info is made available.
> - */
> -typedef struct csinfo {
> -	uintptr_t cs_addr;
> -	uint64_t cs_cid;
> -} csinfo_t;
> -
>  /*
>   * ipinfo contains common IP info for both IPv4 and IPv6.
>   */
> diff --git a/dlibs/x86_64/5.6/net.d b/dlibs/x86_64/5.6/net.d
> index 6ac34287..f1291696 100644
> --- a/dlibs/x86_64/5.6/net.d
> +++ b/dlibs/x86_64/5.6/net.d
> @@ -1,6 +1,6 @@
>  /*
>   * Oracle Linux DTrace.
> - * Copyright (c) 2007, 2017, Oracle and/or its affiliates. All rights reserved.
> + * Copyright (c) 2007, 2025, Oracle and/or its affiliates. All rights reserved.
>   * Licensed under the Universal Permissive License v 1.0 as shown at
>   * http://oss.oracle.com/licenses/upl.
>   */
> @@ -25,9 +25,36 @@ typedef struct conninfo {
>  	 string ci_protocol;	/* protocol (ipv4, ipv6, etc) */
>  } conninfo_t;
>  
> +/*
> + * For compatibility with Solaris.  Here the netstackid will be the pointer
> + * to the net namespace (nd_net in struct net_device).
> + */
> +typedef uint64_t	netstackid_t;
> +typedef __be32		ipaddr_t;
> +typedef struct in6_addr	in6_addr_t;
> +
> +/*
> + * pktinfo is where packet ID info can be made available for deeper
> + * analysis if packet IDs become supported by the kernel in the future.
> + * The pkt_addr member is currently always NULL.
> + */
> +typedef struct pktinfo {
> +	uintptr_t pkt_addr;
> +} pktinfo_t;
> +
> +/*
> + * csinfo is where connection state info is made available.
> + */
> +typedef struct csinfo {
> +	uintptr_t cs_addr;
> +	uint64_t cs_cid;
> +} csinfo_t;
> +
>  /*
>   * We use these values to determine if a probe point is associated
> - * with sending (outbound) or receiving (inbound).
> + * with sending (outbound) or receiving (inbound) or a state-related
> + * probe (i.e. neither inbound our outbound).
>   */
>  inline int NET_PROBE_OUTBOUND =		0x00;
>  inline int NET_PROBE_INBOUND =		0x01;
> +inline int NET_PROBE_STATE =		0x02;
> diff --git a/dlibs/x86_64/5.6/tcp.d b/dlibs/x86_64/5.6/tcp.d
> index 54e310cb..48d9adb4 100644
> --- a/dlibs/x86_64/5.6/tcp.d
> +++ b/dlibs/x86_64/5.6/tcp.d
> @@ -1,13 +1,13 @@
>  /*
>   * Oracle Linux DTrace.
> - * Copyright (c) 2010, 2017, Oracle and/or its affiliates. All rights reserved.
> + * Copyright (c) 2010, 2025, Oracle and/or its affiliates. All rights reserved.
>   * Licensed under the Universal Permissive License v 1.0 as shown at
>   * http://oss.oracle.com/licenses/upl.
>   */
>  
>  #pragma D depends_on module vmlinux
>  #pragma D depends_on library net.d
> -#pragma D depends_on provider ip
> +#pragma D depends_on library ip.d
>  #pragma D depends_on provider tcp
>  
>  inline int TH_FIN =	0x01;
> @@ -111,30 +111,38 @@ translator tcpinfo_t < struct tcphdr *T > {
>  	tcp_seq = T ? ntohl(T->seq) : 0;
>  	tcp_ack = T ? ntohl(T->ack_seq) : 0;
>  	tcp_offset = T ? (*(uint8_t *)(T + 12) & 0xf0) >> 2 : 0;
> -	tcp_flags = T ? *(uint8_t *)(T + 13) : 0;
> +	tcp_flags = T ? *((uint8_t *)T + 13) : 0;
>  	tcp_window = T ? ntohs(T->window) : 0;
>  	tcp_checksum = T ? ntohs(T->check) : 0;
>  	tcp_urgent = T ? ntohs(T->urg_ptr) : 0;
>  	tcp_hdr = (uintptr_t)T;
>  };
>  
> +/* timewait sockets and inet connection sockets do not populate all fields
> + * and are not classified as full sockets; this inline helps translators
> + * spot them and act appropriately.
> + */
> +inline int tcp_fullsock[struct tcp_sock *sk] =
> +	(((struct sock_common *)sk)->skc_state != TCP_STATE_SYN_RECEIVED &&
> +	 ((struct sock_common *)sk)->skc_state != TCP_STATE_TIME_WAIT);
>  /*
>   * In the main we simply translate from the "struct [tcp_]sock *" to
>   * a tcpsinfo_t *.  However there are a few exceptions:
>   *
> - * - tcps_state is always derived from arg6.  The reason is that in some
> + * - tcps_state for state-change is arg5.  The reason is that in some
>   * state transitions sock->sk_state does not reflect the actual TCP
>   * connection state.  For example the TIME_WAIT state is handled in
>   * Linux by creating a separate timewait socket and the state of the
>   * original socket is CLOSED.  In some other cases we also need to
> - * instrument state transition prior to the update of sk_state.  To do
> - * all of this we rely on arg6.
> + * instrument state transition _prior_ to the update of sk_state.  To do
> + * all of this we rely on arg5 to hold the new state. arg6 is set to
> + * NET_PROBE_STATE to quickly identify state-change probes.
>   * - we sometimes need to retrieve local/remote port/address settings from
>   * TCP and IP headers directly, for example prior to the address/port
>   * being committed to the socket.  To do this effectively we need to know
>   * if the packet data is inbound (in which case the local IP/port are the
>   * destination) or outbound (in which case the local IP/port are the source).
> - * arg7 is set to 0 for outbound traffic and 1 for inbound so we use these
> + * arg6 is set to 0 for outbound traffic and 1 for inbound so we use these
>   * to reconstruct the address/port info where necessary.  arg2 used for IP
>   * information while arg4 contains the TCP header, so it is used for port data.
>   * NET_PROBE_INBOUND is defined as 1, NET_PROBE_OUTBOUND as 0 in net.d.
> @@ -158,47 +166,49 @@ translator tcpsinfo_t < struct tcp_sock *T > {
>              ((uint32_t *)&((struct sock *)T)->__sk_common.skc_v6_daddr)[2] &&
>  	    ((uint32_t *)&((struct sock *)T)->__sk_common.skc_v6_rcv_saddr)[3])
>  	    : 0;
> -	tcps_lport = (T && ((struct inet_sock *)T)->inet_sport != 0) ?
> +	tcps_lport = T && ((struct inet_sock *)T)->inet_sport != 0 &&
> +	    tcp_fullsock[T] ?
>  	    ntohs(((struct inet_sock *)T)->inet_sport) :
>  	    (T && ((struct inet_sock *)T)->inet_sport == 0) ?
> -	    ntohs(((struct sock *)T)->__sk_common.skc_num) :
> +	    ((struct sock *)T)->__sk_common.skc_num :
>  	    arg4 != NULL ?
>  	    ntohs(arg7 == NET_PROBE_INBOUND ?
> -	    ((struct tcphdr *)arg4)->dest : ((struct tcphdr *)arg4)->source) :
> +		  ((struct tcphdr *)arg4)->dest :
> +		  ((struct tcphdr *)arg4)->source) :
>  	    0;
>  	tcps_rport = T && ((struct sock *)T)->__sk_common.skc_dport != 0 ?
>  	    ntohs(((struct sock *)T)->__sk_common.skc_dport) :
>  	    arg4 != NULL ?
>  	    ntohs(arg7 == NET_PROBE_INBOUND ?
> -            ((struct tcphdr *)arg4)->source : ((struct tcphdr *)arg4)->dest) :
> +		  ((struct tcphdr *)arg4)->source :
> +		  ((struct tcphdr *)arg4)->dest) :
>  	    0;
>  	tcps_laddr =
>  	    T && ((struct sock *)T)->__sk_common.skc_family == AF_INET ?
>  	    inet_ntoa(&((struct sock *)T)->__sk_common.skc_rcv_saddr) :
>  	    T && ((struct sock *)T)->__sk_common.skc_family == AF_INET6 ?
>  	    inet_ntoa6(&((struct sock *)T)->__sk_common.skc_v6_rcv_saddr) :
> -	    arg2 != NULL && (*(uint8_t *)arg2) >> 4 == 4 ?
> -	    inet_ntoa(arg7 == NET_PROBE_INBOUND ?
> -	    &((struct iphdr *)arg2)->daddr : &((struct iphdr *)arg2)->saddr) :
> -	    arg2 != NULL && *((uint8_t *)arg2) >> 4 == 6 ?
> -	    inet_ntoa6(arg7 == NET_PROBE_INBOUND ?
> -	    &((struct ipv6hdr *)arg2)->daddr :
> -	    &((struct ipv6hdr *)arg2)->saddr) :
> +	    arg2 != NULL && (*(uint8_t *)arg2 >> 4) == 4 ?
> +	    inet_ntoa(&((struct iphdr *)arg2)->daddr) :
> +	    arg2 != NULL && (*(uint8_t *)arg2 >> 4) == 6 ?
> +	    inet_ntoa6(&((struct ipv6hdr *)arg2)->daddr) :
>  	    "<unknown>";
>  	tcps_raddr =
>  	    T && ((struct sock *)T)->__sk_common.skc_family == AF_INET ?
>  	    inet_ntoa(&((struct sock *)T)->__sk_common.skc_daddr) :
>  	    T && ((struct sock *)T)->__sk_common.skc_family == AF_INET6 ?
>  	    inet_ntoa6(&((struct sock *)T)->__sk_common.skc_v6_daddr) :
> -	    arg2 != NULL && (*(uint8_t *)arg2) >> 4 == 4 ?
> -	    inet_ntoa(arg7 == NET_PROBE_INBOUND ?
> -	    &((struct iphdr *)arg2)->saddr : &((struct iphdr *)arg2)->daddr) :
> -	    arg2 != NULL && *((uint8_t *)arg2) >> 4 == 6 ?
> -	    inet_ntoa6(arg7 == NET_PROBE_INBOUND ?
> -	    &((struct ipv6hdr *)arg2)->saddr :
> -	    &((struct ipv6hdr *)arg2)->daddr) :
> +	    arg2 != NULL && (*(uint8_t *)arg2 >> 4) == 4 ?
> +	    inet_ntoa(&((struct iphdr *)arg2)->saddr) :
> +	    arg2 != NULL && (*(uint8_t *)arg2 >> 4) == 6 ?
> +	    inet_ntoa6(&((struct ipv6hdr *)arg2)->saddr) :
>  	    "<unknown>";
> -	tcps_state = arg6;
> +	/* For state-change we probe right before state has changed, but
> +	 * provider definition wants new state in tcps_state; for
> +	 * state-change probes the trampoline stores it in arg5.
> +	 */
> +	tcps_state = arg6 == NET_PROBE_STATE ? arg5 :
> +	    T ? ((struct sock *)T)->__sk_common.skc_state : 0;
>  	tcps_iss = T ?
>  	    T->snd_una - (uint32_t)T->bytes_acked : 0;
>  	tcps_suna = T ? T->snd_una : 0;
> @@ -225,7 +235,10 @@ translator tcpsinfo_t < struct tcp_sock *T > {
>  	    T->rcv_nxt - (uint32_t)T->bytes_received : 0;
>  };
>  
> +/* state-change trampoline stores new state in arg5; at time of firing,
> + * state has not been updated, so last state is in tcp_sock state.
> + */
>  #pragma D binding "1.6.3" translator
>  translator tcplsinfo_t < int I > {
> -	tcps_state = I;
> +	tcps_state = arg3 ? ((struct sock *)arg3)->__sk_common.skc_state : 0;
>  };
> diff --git a/dlibs/x86_64/6.1/ip.d b/dlibs/x86_64/6.1/ip.d
> index f8b77f12..493b75a0 100644
> --- a/dlibs/x86_64/6.1/ip.d
> +++ b/dlibs/x86_64/6.1/ip.d
> @@ -1,6 +1,6 @@
>  /*
>   * Oracle Linux DTrace.
> - * Copyright (c) 2007, 2023, Oracle and/or its affiliates. All rights reserved.
> + * Copyright (c) 2007, 2025, Oracle and/or its affiliates. All rights reserved.
>   * Licensed under the Universal Permissive License v 1.0 as shown at
>   * http://oss.oracle.com/licenses/upl.
>   */
> @@ -46,31 +46,6 @@ inline int IPPROTO_MH		=	135;
>  
>  inline int TCP_MIN_HEADER_LENGTH =	20;
>  
> -/*
> - * For compatibility with Solaris.  Here the netstackid will be the pointer
> - * to the net namespace (nd_net in struct net_device).
> - */
> -typedef uint64_t	netstackid_t;
> -typedef __be32		ipaddr_t;
> -typedef struct in6_addr	in6_addr_t;
> -
> -/*
> - * pktinfo is where packet ID info can be made available for deeper
> - * analysis if packet IDs become supported by the kernel in the future.
> - * The pkt_addr member is currently always NULL.
> - */
> -typedef struct pktinfo {
> -	uintptr_t pkt_addr;
> -} pktinfo_t;
> -
> -/*
> - * csinfo is where connection state info is made available.
> - */
> -typedef struct csinfo {
> -	uintptr_t cs_addr;
> -	uint64_t cs_cid;
> -} csinfo_t;
> -
>  /*
>   * ipinfo contains common IP info for both IPv4 and IPv6.
>   */
> diff --git a/dlibs/x86_64/6.1/net.d b/dlibs/x86_64/6.1/net.d
> index 6ac34287..f1291696 100644
> --- a/dlibs/x86_64/6.1/net.d
> +++ b/dlibs/x86_64/6.1/net.d
> @@ -1,6 +1,6 @@
>  /*
>   * Oracle Linux DTrace.
> - * Copyright (c) 2007, 2017, Oracle and/or its affiliates. All rights reserved.
> + * Copyright (c) 2007, 2025, Oracle and/or its affiliates. All rights reserved.
>   * Licensed under the Universal Permissive License v 1.0 as shown at
>   * http://oss.oracle.com/licenses/upl.
>   */
> @@ -25,9 +25,36 @@ typedef struct conninfo {
>  	 string ci_protocol;	/* protocol (ipv4, ipv6, etc) */
>  } conninfo_t;
>  
> +/*
> + * For compatibility with Solaris.  Here the netstackid will be the pointer
> + * to the net namespace (nd_net in struct net_device).
> + */
> +typedef uint64_t	netstackid_t;
> +typedef __be32		ipaddr_t;
> +typedef struct in6_addr	in6_addr_t;
> +
> +/*
> + * pktinfo is where packet ID info can be made available for deeper
> + * analysis if packet IDs become supported by the kernel in the future.
> + * The pkt_addr member is currently always NULL.
> + */
> +typedef struct pktinfo {
> +	uintptr_t pkt_addr;
> +} pktinfo_t;
> +
> +/*
> + * csinfo is where connection state info is made available.
> + */
> +typedef struct csinfo {
> +	uintptr_t cs_addr;
> +	uint64_t cs_cid;
> +} csinfo_t;
> +
>  /*
>   * We use these values to determine if a probe point is associated
> - * with sending (outbound) or receiving (inbound).
> + * with sending (outbound) or receiving (inbound) or a state-related
> + * probe (i.e. neither inbound our outbound).
>   */
>  inline int NET_PROBE_OUTBOUND =		0x00;
>  inline int NET_PROBE_INBOUND =		0x01;
> +inline int NET_PROBE_STATE =		0x02;
> diff --git a/dlibs/x86_64/6.1/tcp.d b/dlibs/x86_64/6.1/tcp.d
> index 54e310cb..48d9adb4 100644
> --- a/dlibs/x86_64/6.1/tcp.d
> +++ b/dlibs/x86_64/6.1/tcp.d
> @@ -1,13 +1,13 @@
>  /*
>   * Oracle Linux DTrace.
> - * Copyright (c) 2010, 2017, Oracle and/or its affiliates. All rights reserved.
> + * Copyright (c) 2010, 2025, Oracle and/or its affiliates. All rights reserved.
>   * Licensed under the Universal Permissive License v 1.0 as shown at
>   * http://oss.oracle.com/licenses/upl.
>   */
>  
>  #pragma D depends_on module vmlinux
>  #pragma D depends_on library net.d
> -#pragma D depends_on provider ip
> +#pragma D depends_on library ip.d
>  #pragma D depends_on provider tcp
>  
>  inline int TH_FIN =	0x01;
> @@ -111,30 +111,38 @@ translator tcpinfo_t < struct tcphdr *T > {
>  	tcp_seq = T ? ntohl(T->seq) : 0;
>  	tcp_ack = T ? ntohl(T->ack_seq) : 0;
>  	tcp_offset = T ? (*(uint8_t *)(T + 12) & 0xf0) >> 2 : 0;
> -	tcp_flags = T ? *(uint8_t *)(T + 13) : 0;
> +	tcp_flags = T ? *((uint8_t *)T + 13) : 0;
>  	tcp_window = T ? ntohs(T->window) : 0;
>  	tcp_checksum = T ? ntohs(T->check) : 0;
>  	tcp_urgent = T ? ntohs(T->urg_ptr) : 0;
>  	tcp_hdr = (uintptr_t)T;
>  };
>  
> +/* timewait sockets and inet connection sockets do not populate all fields
> + * and are not classified as full sockets; this inline helps translators
> + * spot them and act appropriately.
> + */
> +inline int tcp_fullsock[struct tcp_sock *sk] =
> +	(((struct sock_common *)sk)->skc_state != TCP_STATE_SYN_RECEIVED &&
> +	 ((struct sock_common *)sk)->skc_state != TCP_STATE_TIME_WAIT);
>  /*
>   * In the main we simply translate from the "struct [tcp_]sock *" to
>   * a tcpsinfo_t *.  However there are a few exceptions:
>   *
> - * - tcps_state is always derived from arg6.  The reason is that in some
> + * - tcps_state for state-change is arg5.  The reason is that in some
>   * state transitions sock->sk_state does not reflect the actual TCP
>   * connection state.  For example the TIME_WAIT state is handled in
>   * Linux by creating a separate timewait socket and the state of the
>   * original socket is CLOSED.  In some other cases we also need to
> - * instrument state transition prior to the update of sk_state.  To do
> - * all of this we rely on arg6.
> + * instrument state transition _prior_ to the update of sk_state.  To do
> + * all of this we rely on arg5 to hold the new state. arg6 is set to
> + * NET_PROBE_STATE to quickly identify state-change probes.
>   * - we sometimes need to retrieve local/remote port/address settings from
>   * TCP and IP headers directly, for example prior to the address/port
>   * being committed to the socket.  To do this effectively we need to know
>   * if the packet data is inbound (in which case the local IP/port are the
>   * destination) or outbound (in which case the local IP/port are the source).
> - * arg7 is set to 0 for outbound traffic and 1 for inbound so we use these
> + * arg6 is set to 0 for outbound traffic and 1 for inbound so we use these
>   * to reconstruct the address/port info where necessary.  arg2 used for IP
>   * information while arg4 contains the TCP header, so it is used for port data.
>   * NET_PROBE_INBOUND is defined as 1, NET_PROBE_OUTBOUND as 0 in net.d.
> @@ -158,47 +166,49 @@ translator tcpsinfo_t < struct tcp_sock *T > {
>              ((uint32_t *)&((struct sock *)T)->__sk_common.skc_v6_daddr)[2] &&
>  	    ((uint32_t *)&((struct sock *)T)->__sk_common.skc_v6_rcv_saddr)[3])
>  	    : 0;
> -	tcps_lport = (T && ((struct inet_sock *)T)->inet_sport != 0) ?
> +	tcps_lport = T && ((struct inet_sock *)T)->inet_sport != 0 &&
> +	    tcp_fullsock[T] ?
>  	    ntohs(((struct inet_sock *)T)->inet_sport) :
>  	    (T && ((struct inet_sock *)T)->inet_sport == 0) ?
> -	    ntohs(((struct sock *)T)->__sk_common.skc_num) :
> +	    ((struct sock *)T)->__sk_common.skc_num :
>  	    arg4 != NULL ?
>  	    ntohs(arg7 == NET_PROBE_INBOUND ?
> -	    ((struct tcphdr *)arg4)->dest : ((struct tcphdr *)arg4)->source) :
> +		  ((struct tcphdr *)arg4)->dest :
> +		  ((struct tcphdr *)arg4)->source) :
>  	    0;
>  	tcps_rport = T && ((struct sock *)T)->__sk_common.skc_dport != 0 ?
>  	    ntohs(((struct sock *)T)->__sk_common.skc_dport) :
>  	    arg4 != NULL ?
>  	    ntohs(arg7 == NET_PROBE_INBOUND ?
> -            ((struct tcphdr *)arg4)->source : ((struct tcphdr *)arg4)->dest) :
> +		  ((struct tcphdr *)arg4)->source :
> +		  ((struct tcphdr *)arg4)->dest) :
>  	    0;
>  	tcps_laddr =
>  	    T && ((struct sock *)T)->__sk_common.skc_family == AF_INET ?
>  	    inet_ntoa(&((struct sock *)T)->__sk_common.skc_rcv_saddr) :
>  	    T && ((struct sock *)T)->__sk_common.skc_family == AF_INET6 ?
>  	    inet_ntoa6(&((struct sock *)T)->__sk_common.skc_v6_rcv_saddr) :
> -	    arg2 != NULL && (*(uint8_t *)arg2) >> 4 == 4 ?
> -	    inet_ntoa(arg7 == NET_PROBE_INBOUND ?
> -	    &((struct iphdr *)arg2)->daddr : &((struct iphdr *)arg2)->saddr) :
> -	    arg2 != NULL && *((uint8_t *)arg2) >> 4 == 6 ?
> -	    inet_ntoa6(arg7 == NET_PROBE_INBOUND ?
> -	    &((struct ipv6hdr *)arg2)->daddr :
> -	    &((struct ipv6hdr *)arg2)->saddr) :
> +	    arg2 != NULL && (*(uint8_t *)arg2 >> 4) == 4 ?
> +	    inet_ntoa(&((struct iphdr *)arg2)->daddr) :
> +	    arg2 != NULL && (*(uint8_t *)arg2 >> 4) == 6 ?
> +	    inet_ntoa6(&((struct ipv6hdr *)arg2)->daddr) :
>  	    "<unknown>";
>  	tcps_raddr =
>  	    T && ((struct sock *)T)->__sk_common.skc_family == AF_INET ?
>  	    inet_ntoa(&((struct sock *)T)->__sk_common.skc_daddr) :
>  	    T && ((struct sock *)T)->__sk_common.skc_family == AF_INET6 ?
>  	    inet_ntoa6(&((struct sock *)T)->__sk_common.skc_v6_daddr) :
> -	    arg2 != NULL && (*(uint8_t *)arg2) >> 4 == 4 ?
> -	    inet_ntoa(arg7 == NET_PROBE_INBOUND ?
> -	    &((struct iphdr *)arg2)->saddr : &((struct iphdr *)arg2)->daddr) :
> -	    arg2 != NULL && *((uint8_t *)arg2) >> 4 == 6 ?
> -	    inet_ntoa6(arg7 == NET_PROBE_INBOUND ?
> -	    &((struct ipv6hdr *)arg2)->saddr :
> -	    &((struct ipv6hdr *)arg2)->daddr) :
> +	    arg2 != NULL && (*(uint8_t *)arg2 >> 4) == 4 ?
> +	    inet_ntoa(&((struct iphdr *)arg2)->saddr) :
> +	    arg2 != NULL && (*(uint8_t *)arg2 >> 4) == 6 ?
> +	    inet_ntoa6(&((struct ipv6hdr *)arg2)->saddr) :
>  	    "<unknown>";
> -	tcps_state = arg6;
> +	/* For state-change we probe right before state has changed, but
> +	 * provider definition wants new state in tcps_state; for
> +	 * state-change probes the trampoline stores it in arg5.
> +	 */
> +	tcps_state = arg6 == NET_PROBE_STATE ? arg5 :
> +	    T ? ((struct sock *)T)->__sk_common.skc_state : 0;
>  	tcps_iss = T ?
>  	    T->snd_una - (uint32_t)T->bytes_acked : 0;
>  	tcps_suna = T ? T->snd_una : 0;
> @@ -225,7 +235,10 @@ translator tcpsinfo_t < struct tcp_sock *T > {
>  	    T->rcv_nxt - (uint32_t)T->bytes_received : 0;
>  };
>  
> +/* state-change trampoline stores new state in arg5; at time of firing,
> + * state has not been updated, so last state is in tcp_sock state.
> + */
>  #pragma D binding "1.6.3" translator
>  translator tcplsinfo_t < int I > {
> -	tcps_state = I;
> +	tcps_state = arg3 ? ((struct sock *)arg3)->__sk_common.skc_state : 0;
>  };
> diff --git a/dlibs/x86_64/6.10/ip.d b/dlibs/x86_64/6.10/ip.d
> index f8b77f12..493b75a0 100644
> --- a/dlibs/x86_64/6.10/ip.d
> +++ b/dlibs/x86_64/6.10/ip.d
> @@ -1,6 +1,6 @@
>  /*
>   * Oracle Linux DTrace.
> - * Copyright (c) 2007, 2023, Oracle and/or its affiliates. All rights reserved.
> + * Copyright (c) 2007, 2025, Oracle and/or its affiliates. All rights reserved.
>   * Licensed under the Universal Permissive License v 1.0 as shown at
>   * http://oss.oracle.com/licenses/upl.
>   */
> @@ -46,31 +46,6 @@ inline int IPPROTO_MH		=	135;
>  
>  inline int TCP_MIN_HEADER_LENGTH =	20;
>  
> -/*
> - * For compatibility with Solaris.  Here the netstackid will be the pointer
> - * to the net namespace (nd_net in struct net_device).
> - */
> -typedef uint64_t	netstackid_t;
> -typedef __be32		ipaddr_t;
> -typedef struct in6_addr	in6_addr_t;
> -
> -/*
> - * pktinfo is where packet ID info can be made available for deeper
> - * analysis if packet IDs become supported by the kernel in the future.
> - * The pkt_addr member is currently always NULL.
> - */
> -typedef struct pktinfo {
> -	uintptr_t pkt_addr;
> -} pktinfo_t;
> -
> -/*
> - * csinfo is where connection state info is made available.
> - */
> -typedef struct csinfo {
> -	uintptr_t cs_addr;
> -	uint64_t cs_cid;
> -} csinfo_t;
> -
>  /*
>   * ipinfo contains common IP info for both IPv4 and IPv6.
>   */
> diff --git a/dlibs/x86_64/6.10/net.d b/dlibs/x86_64/6.10/net.d
> index 6ac34287..f1291696 100644
> --- a/dlibs/x86_64/6.10/net.d
> +++ b/dlibs/x86_64/6.10/net.d
> @@ -1,6 +1,6 @@
>  /*
>   * Oracle Linux DTrace.
> - * Copyright (c) 2007, 2017, Oracle and/or its affiliates. All rights reserved.
> + * Copyright (c) 2007, 2025, Oracle and/or its affiliates. All rights reserved.
>   * Licensed under the Universal Permissive License v 1.0 as shown at
>   * http://oss.oracle.com/licenses/upl.
>   */
> @@ -25,9 +25,36 @@ typedef struct conninfo {
>  	 string ci_protocol;	/* protocol (ipv4, ipv6, etc) */
>  } conninfo_t;
>  
> +/*
> + * For compatibility with Solaris.  Here the netstackid will be the pointer
> + * to the net namespace (nd_net in struct net_device).
> + */
> +typedef uint64_t	netstackid_t;
> +typedef __be32		ipaddr_t;
> +typedef struct in6_addr	in6_addr_t;
> +
> +/*
> + * pktinfo is where packet ID info can be made available for deeper
> + * analysis if packet IDs become supported by the kernel in the future.
> + * The pkt_addr member is currently always NULL.
> + */
> +typedef struct pktinfo {
> +	uintptr_t pkt_addr;
> +} pktinfo_t;
> +
> +/*
> + * csinfo is where connection state info is made available.
> + */
> +typedef struct csinfo {
> +	uintptr_t cs_addr;
> +	uint64_t cs_cid;
> +} csinfo_t;
> +
>  /*
>   * We use these values to determine if a probe point is associated
> - * with sending (outbound) or receiving (inbound).
> + * with sending (outbound) or receiving (inbound) or a state-related
> + * probe (i.e. neither inbound our outbound).
>   */
>  inline int NET_PROBE_OUTBOUND =		0x00;
>  inline int NET_PROBE_INBOUND =		0x01;
> +inline int NET_PROBE_STATE =		0x02;
> diff --git a/dlibs/x86_64/6.10/tcp.d b/dlibs/x86_64/6.10/tcp.d
> index 54e310cb..48d9adb4 100644
> --- a/dlibs/x86_64/6.10/tcp.d
> +++ b/dlibs/x86_64/6.10/tcp.d
> @@ -1,13 +1,13 @@
>  /*
>   * Oracle Linux DTrace.
> - * Copyright (c) 2010, 2017, Oracle and/or its affiliates. All rights reserved.
> + * Copyright (c) 2010, 2025, Oracle and/or its affiliates. All rights reserved.
>   * Licensed under the Universal Permissive License v 1.0 as shown at
>   * http://oss.oracle.com/licenses/upl.
>   */
>  
>  #pragma D depends_on module vmlinux
>  #pragma D depends_on library net.d
> -#pragma D depends_on provider ip
> +#pragma D depends_on library ip.d
>  #pragma D depends_on provider tcp
>  
>  inline int TH_FIN =	0x01;
> @@ -111,30 +111,38 @@ translator tcpinfo_t < struct tcphdr *T > {
>  	tcp_seq = T ? ntohl(T->seq) : 0;
>  	tcp_ack = T ? ntohl(T->ack_seq) : 0;
>  	tcp_offset = T ? (*(uint8_t *)(T + 12) & 0xf0) >> 2 : 0;
> -	tcp_flags = T ? *(uint8_t *)(T + 13) : 0;
> +	tcp_flags = T ? *((uint8_t *)T + 13) : 0;
>  	tcp_window = T ? ntohs(T->window) : 0;
>  	tcp_checksum = T ? ntohs(T->check) : 0;
>  	tcp_urgent = T ? ntohs(T->urg_ptr) : 0;
>  	tcp_hdr = (uintptr_t)T;
>  };
>  
> +/* timewait sockets and inet connection sockets do not populate all fields
> + * and are not classified as full sockets; this inline helps translators
> + * spot them and act appropriately.
> + */
> +inline int tcp_fullsock[struct tcp_sock *sk] =
> +	(((struct sock_common *)sk)->skc_state != TCP_STATE_SYN_RECEIVED &&
> +	 ((struct sock_common *)sk)->skc_state != TCP_STATE_TIME_WAIT);
>  /*
>   * In the main we simply translate from the "struct [tcp_]sock *" to
>   * a tcpsinfo_t *.  However there are a few exceptions:
>   *
> - * - tcps_state is always derived from arg6.  The reason is that in some
> + * - tcps_state for state-change is arg5.  The reason is that in some
>   * state transitions sock->sk_state does not reflect the actual TCP
>   * connection state.  For example the TIME_WAIT state is handled in
>   * Linux by creating a separate timewait socket and the state of the
>   * original socket is CLOSED.  In some other cases we also need to
> - * instrument state transition prior to the update of sk_state.  To do
> - * all of this we rely on arg6.
> + * instrument state transition _prior_ to the update of sk_state.  To do
> + * all of this we rely on arg5 to hold the new state. arg6 is set to
> + * NET_PROBE_STATE to quickly identify state-change probes.
>   * - we sometimes need to retrieve local/remote port/address settings from
>   * TCP and IP headers directly, for example prior to the address/port
>   * being committed to the socket.  To do this effectively we need to know
>   * if the packet data is inbound (in which case the local IP/port are the
>   * destination) or outbound (in which case the local IP/port are the source).
> - * arg7 is set to 0 for outbound traffic and 1 for inbound so we use these
> + * arg6 is set to 0 for outbound traffic and 1 for inbound so we use these
>   * to reconstruct the address/port info where necessary.  arg2 used for IP
>   * information while arg4 contains the TCP header, so it is used for port data.
>   * NET_PROBE_INBOUND is defined as 1, NET_PROBE_OUTBOUND as 0 in net.d.
> @@ -158,47 +166,49 @@ translator tcpsinfo_t < struct tcp_sock *T > {
>              ((uint32_t *)&((struct sock *)T)->__sk_common.skc_v6_daddr)[2] &&
>  	    ((uint32_t *)&((struct sock *)T)->__sk_common.skc_v6_rcv_saddr)[3])
>  	    : 0;
> -	tcps_lport = (T && ((struct inet_sock *)T)->inet_sport != 0) ?
> +	tcps_lport = T && ((struct inet_sock *)T)->inet_sport != 0 &&
> +	    tcp_fullsock[T] ?
>  	    ntohs(((struct inet_sock *)T)->inet_sport) :
>  	    (T && ((struct inet_sock *)T)->inet_sport == 0) ?
> -	    ntohs(((struct sock *)T)->__sk_common.skc_num) :
> +	    ((struct sock *)T)->__sk_common.skc_num :
>  	    arg4 != NULL ?
>  	    ntohs(arg7 == NET_PROBE_INBOUND ?
> -	    ((struct tcphdr *)arg4)->dest : ((struct tcphdr *)arg4)->source) :
> +		  ((struct tcphdr *)arg4)->dest :
> +		  ((struct tcphdr *)arg4)->source) :
>  	    0;
>  	tcps_rport = T && ((struct sock *)T)->__sk_common.skc_dport != 0 ?
>  	    ntohs(((struct sock *)T)->__sk_common.skc_dport) :
>  	    arg4 != NULL ?
>  	    ntohs(arg7 == NET_PROBE_INBOUND ?
> -            ((struct tcphdr *)arg4)->source : ((struct tcphdr *)arg4)->dest) :
> +		  ((struct tcphdr *)arg4)->source :
> +		  ((struct tcphdr *)arg4)->dest) :
>  	    0;
>  	tcps_laddr =
>  	    T && ((struct sock *)T)->__sk_common.skc_family == AF_INET ?
>  	    inet_ntoa(&((struct sock *)T)->__sk_common.skc_rcv_saddr) :
>  	    T && ((struct sock *)T)->__sk_common.skc_family == AF_INET6 ?
>  	    inet_ntoa6(&((struct sock *)T)->__sk_common.skc_v6_rcv_saddr) :
> -	    arg2 != NULL && (*(uint8_t *)arg2) >> 4 == 4 ?
> -	    inet_ntoa(arg7 == NET_PROBE_INBOUND ?
> -	    &((struct iphdr *)arg2)->daddr : &((struct iphdr *)arg2)->saddr) :
> -	    arg2 != NULL && *((uint8_t *)arg2) >> 4 == 6 ?
> -	    inet_ntoa6(arg7 == NET_PROBE_INBOUND ?
> -	    &((struct ipv6hdr *)arg2)->daddr :
> -	    &((struct ipv6hdr *)arg2)->saddr) :
> +	    arg2 != NULL && (*(uint8_t *)arg2 >> 4) == 4 ?
> +	    inet_ntoa(&((struct iphdr *)arg2)->daddr) :
> +	    arg2 != NULL && (*(uint8_t *)arg2 >> 4) == 6 ?
> +	    inet_ntoa6(&((struct ipv6hdr *)arg2)->daddr) :
>  	    "<unknown>";
>  	tcps_raddr =
>  	    T && ((struct sock *)T)->__sk_common.skc_family == AF_INET ?
>  	    inet_ntoa(&((struct sock *)T)->__sk_common.skc_daddr) :
>  	    T && ((struct sock *)T)->__sk_common.skc_family == AF_INET6 ?
>  	    inet_ntoa6(&((struct sock *)T)->__sk_common.skc_v6_daddr) :
> -	    arg2 != NULL && (*(uint8_t *)arg2) >> 4 == 4 ?
> -	    inet_ntoa(arg7 == NET_PROBE_INBOUND ?
> -	    &((struct iphdr *)arg2)->saddr : &((struct iphdr *)arg2)->daddr) :
> -	    arg2 != NULL && *((uint8_t *)arg2) >> 4 == 6 ?
> -	    inet_ntoa6(arg7 == NET_PROBE_INBOUND ?
> -	    &((struct ipv6hdr *)arg2)->saddr :
> -	    &((struct ipv6hdr *)arg2)->daddr) :
> +	    arg2 != NULL && (*(uint8_t *)arg2 >> 4) == 4 ?
> +	    inet_ntoa(&((struct iphdr *)arg2)->saddr) :
> +	    arg2 != NULL && (*(uint8_t *)arg2 >> 4) == 6 ?
> +	    inet_ntoa6(&((struct ipv6hdr *)arg2)->saddr) :
>  	    "<unknown>";
> -	tcps_state = arg6;
> +	/* For state-change we probe right before state has changed, but
> +	 * provider definition wants new state in tcps_state; for
> +	 * state-change probes the trampoline stores it in arg5.
> +	 */
> +	tcps_state = arg6 == NET_PROBE_STATE ? arg5 :
> +	    T ? ((struct sock *)T)->__sk_common.skc_state : 0;
>  	tcps_iss = T ?
>  	    T->snd_una - (uint32_t)T->bytes_acked : 0;
>  	tcps_suna = T ? T->snd_una : 0;
> @@ -225,7 +235,10 @@ translator tcpsinfo_t < struct tcp_sock *T > {
>  	    T->rcv_nxt - (uint32_t)T->bytes_received : 0;
>  };
>  
> +/* state-change trampoline stores new state in arg5; at time of firing,
> + * state has not been updated, so last state is in tcp_sock state.
> + */
>  #pragma D binding "1.6.3" translator
>  translator tcplsinfo_t < int I > {
> -	tcps_state = I;
> +	tcps_state = arg3 ? ((struct sock *)arg3)->__sk_common.skc_state : 0;
>  };
> -- 
> 2.39.3
> 
> 
> _______________________________________________
> DTrace-devel mailing list
> DTrace-devel@oss.oracle.com
> https://oss.oracle.com/mailman/listinfo/dtrace-devel
