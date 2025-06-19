Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54F9B2517A6
	for <dtrace@lists.linux.dev>; Thu, 19 Jun 2025 11:58:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750334325; cv=fail; b=VcRfd/kU4Z3fNPQANbnpEVL5UCSnsHxG1BgfKaFCB7qpguY1L4uW80rNT05X9H9wUsYfjVqxpERf4UJDop1A3gg+xvgOGx1DsxghVojCWrh6PTdBUhTtk4xtgDZQV39iK2YYU1en9wlL4rjbxzV2RR96Z3uy9QzjFd4jY13jJSI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750334325; c=relaxed/simple;
	bh=OMkNlx4bn4CvM7PoCtDWNqpyufOyk9ZYMbN+eMYU9/g=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:Message-ID:
	 Content-Type:MIME-Version; b=mrHJZ7ZGW+RIOJC8rb1UkWRu1oCmra3UmuByNdmWB7n4NzLj9p2ynB0jTnyL2j/9NIpfreENEiYWu6t4rZnkXPqtFE/nufUMQsxR+ItOMFRb8g2o2pQb3NWLo8K7FByAiNMJ3wmj9xgEddxujwe+5hkDCIf/XPeeGDGHYwAOd8M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=SetUxm3L; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=yy0WqO/d; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="SetUxm3L";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="yy0WqO/d"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55J0g1rZ013970
	for <dtrace@lists.linux.dev>; Thu, 19 Jun 2025 11:58:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=khrxJnOxKbhlxTpneb
	DsWBio+qHcQFj9QNwQseMYCY8=; b=SetUxm3LhgR21z5MYzcBwEDzH7XCN9u1Sc
	ysR1AYGO7o9hn/ojlxNuD7sHycxMVa65hn23oMPh0WPhBRLkVYzxGJ6fzilSbYSj
	+0b86WrMEgbzkW+7kWPlmtuT0pZ45/matxH2xDpv3kWZ9i5+g22YJZmUV2B+hmZR
	OTzhb7vt5n3kgPQ6cZMIATClIrTGuCzApYPD42lRH6edy2irJQxDR2tVz4Fazma4
	VH3Je083qpD8hGLLmDCvLZ1wVmpg64FkA9tan0NZ4qpzPMJ78FQN1PPiQlf0PYGy
	ehe7HM98lCLS6MtFViY58e9r6qBXxN0EQrmbLf7AQzJucMspyZ6Q==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 479hvn96ee-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 19 Jun 2025 11:58:41 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 55JB1KTl018486
	for <dtrace@lists.linux.dev>; Thu, 19 Jun 2025 11:58:40 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11on2061.outbound.protection.outlook.com [40.107.223.61])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 478yhbtwk0-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 19 Jun 2025 11:58:40 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Vd57JsQJKM2YL1XzruRvHbXv47O3SooTFypgqaRhd199YoFnm455idIsBriJftp8eAjSZc2DOkf95K/AiX84zkhRs01/JQ5yPKh7cbuxNs7MExOj9bm7Cydsp81qQJLdijxqNAj6aBYtUFLhSqYipAdyLbWKX3WJKa98lvw+wZrn2LOs4JyPGyQazNs2Dtzyn79p39RvbK/MqTSUlihtKNOcoIJovMmD1VNewsXCOso7aQvcLV5xP7CgSwgMaWRJcMvkh2LnJwi7wxxvZy27Q5e2xaCDbXDgxqGN38eSr4uH/UtKX1dVEj2wpFF5CyJykDq+y4bPU5hC0LCZ7UUGfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=khrxJnOxKbhlxTpnebDsWBio+qHcQFj9QNwQseMYCY8=;
 b=frxDTfUa8l4moCRlLTwOHDIXmnR7/az32wp8YYEuBqLO1NTjy77M4B5FB7GjHKPSUCO6JJC9oJVXxaX75r0yxB1n5lYegtb0FzjBov9zW2o+/oFuV9VLu8yaq12k94Gwl0lBAuLy5Y5vJIWUNCjKlHbJk8kcZXI8lrw+ntYhOcYYgxcd/Z/xW0oxVvkwDwibxwxCZkxIuHWFkJiEoScX9tirECNIriDMfdt9/BYZJMcxtAy+GS2ofnZkvu6L3TKu4iUvTAAPVxahRAeKECMGsdOUX4jZWrMJWJl1dyNe1OMYxSfJ0Pq5P/z5aqzxQpT6d0MBXpjqvT9Biq3iymDN5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=khrxJnOxKbhlxTpnebDsWBio+qHcQFj9QNwQseMYCY8=;
 b=yy0WqO/dF2BxaVqHtbYsypB+ModCjm9rSmu25uVeY9i7SYPgLA7TUuC0rUOJg9o6A6SmcmkpMWrVuS/Rsycn/IXmKCdY7diyrPU1eqPzrWYW3ZXGsIMdjY1BE1yCOvc+VjaULrsfNVX2awFHXBinyUsbMGexE1O9gqD6Q9s76+E=
Received: from DS7PR10MB5037.namprd10.prod.outlook.com (2603:10b6:5:3a9::23)
 by IA1PR10MB6757.namprd10.prod.outlook.com (2603:10b6:208:42f::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.29; Thu, 19 Jun
 2025 11:58:38 +0000
Received: from DS7PR10MB5037.namprd10.prod.outlook.com
 ([fe80::824a:572e:d9d7:e9f1]) by DS7PR10MB5037.namprd10.prod.outlook.com
 ([fe80::824a:572e:d9d7:e9f1%6]) with mapi id 15.20.8835.027; Thu, 19 Jun 2025
 11:58:37 +0000
From: Nick Alcock <nick.alcock@oracle.com>
To: Kris Van Hees <kris.van.hees@oracle.com>
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [PATCH] usdt parser: fix memory leak in provider and probe htabs
References: <SJ0SPRMB0016F8F2EEDFFB5FFC6BB811C27DA@SJ0SPRMB0016.namprd10.prod.outlook.com>
Emacs: a Lisp interpreter masquerading as ... a Lisp interpreter!
Date: Thu, 19 Jun 2025 12:58:21 +0100
In-Reply-To: <SJ0SPRMB0016F8F2EEDFFB5FFC6BB811C27DA@SJ0SPRMB0016.namprd10.prod.outlook.com>
	(Kris Van Hees's message of "Wed, 18 Jun 2025 23:59:42 -0400")
Message-ID: <8734bw0wpu.fsf@esperi.org.uk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.3 (gnu/linux)
Content-Type: text/plain
X-ClientProxiedBy: LO4P265CA0224.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:315::8) To DS7PR10MB5037.namprd10.prod.outlook.com
 (2603:10b6:5:3a9::23)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR10MB5037:EE_|IA1PR10MB6757:EE_
X-MS-Office365-Filtering-Correlation-Id: 04821a40-0a7f-4107-cf11-08ddaf289a2b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|10070799003|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?BSdI6/5GGj3L1JJMjfFAaanf9cwj+owlJNea/CJ9S6XFOCruk/S/5JJBUTnh?=
 =?us-ascii?Q?wER7SbZB8P6rGZQ8oDjipffmS2y0+r/wAjhbhCW+vrcuYMoNblK/leB27ehC?=
 =?us-ascii?Q?z0GkNYgW7BG57kll8rbw21HNvafaNSa1dwe3/qaoShi4xekLFmADs7Rds8ZV?=
 =?us-ascii?Q?t8Rcwt/rBEs2WYoFvxr9XAYgFPiKP2v7boMRR6IojrI2F+nLjyX37fQT5Q9R?=
 =?us-ascii?Q?eh5TwXVT3CMqwVnT1shArP8dHOX/DIov6mHJDQ25OG2hMZKe4mK2xnFYoAIM?=
 =?us-ascii?Q?Jon3QeGFHnwGos2okShoAEhaV7aXDrVq05rZjJC0zQz3HaCjeGm+sRTttc5U?=
 =?us-ascii?Q?DyWmtIJvUD58AiL4VjnT17SOZp6FxEDPxcSYEtMbvpIgWD5wiTNaOmC5iXw6?=
 =?us-ascii?Q?JWI0R8WW7o//HZjg2H3wbLIrZfKBwNNoYHGJbZmKFgkHY5eduysSeRmY2tYH?=
 =?us-ascii?Q?XVk7OigBpkvC5APNbdA/cF5zL5kYFndi2Vb7dNKQNgc6ve8kjb5mQO/kYwao?=
 =?us-ascii?Q?5PK7KK9HKpCfFbN8TuYDMefMgn4A29gVLVSv5R4/lf0Y6cRM8HwqMAngyaYf?=
 =?us-ascii?Q?NRDBd5rtFJYe+RSCzhXpzpckwkqZTsGbzjHzDYPdDDs+ztibvRLHxwaXOcLf?=
 =?us-ascii?Q?DEAK8EvTItvJweyVjGoVGkLBXCZbxzxzzZJKUkvYxkODeCR9fafbzPwYf6Bd?=
 =?us-ascii?Q?8sgrn/kVRNoqdgP4cgB0sgR9iHWZIKxGKveH8xwsKVks18gB0XETDemGDadU?=
 =?us-ascii?Q?4YM42R99pG62O1a9lilxLhyeitwRNVOLExPyb0dO6u3QubZqnltQdWymrsgu?=
 =?us-ascii?Q?QchSGquF4Zi9pOmt/9RhKWpORkVf/8848wTI1gs/jQNA/YxAHmMTm2Nq1gNc?=
 =?us-ascii?Q?BjlA6Y0RTGZXAo0KdCoJN5SMZwg4xvHJ2pefXTeXPxg5RmgME2FYg39FAlyV?=
 =?us-ascii?Q?gUi0jphTmlub71Cx6xA8wBm1HmnyH7cCTDB+O3umtKaXXpBmSNLxuDZfAODi?=
 =?us-ascii?Q?tBGsCSC+u22TG4CzahhZaSEwPZIBCmWPmseooA7aztyiyLQqx8sKLn7cLhqC?=
 =?us-ascii?Q?W7q3F2DD3kLNDdBDWipZjDNm7s2g9tNwC7pMqRvkVm32vf5Hoy4VzECviGOD?=
 =?us-ascii?Q?4jDnYqJyY5UpFBAj0lkrFhVcMFdgIgwtThm31NX0UHExK1xh1SrvAzKHvsM4?=
 =?us-ascii?Q?7vxdI7eF7SG1Z4/+6RFkL7S1Bj4n06nlFjg7jILniTahKj5iqm6GmFvcDIdK?=
 =?us-ascii?Q?U3In5D7HOvkWIyGDJxhKuaBjpoWSt+1hj37CL8qoulurm1yAUxXnxYhMXZzO?=
 =?us-ascii?Q?FGEahZtOtuat9BF+hkZbiVgjKsdFmSdrakKHGtDwQ8XLKgxy8WUq9zsL5OYV?=
 =?us-ascii?Q?ZJNkfNQRNVdCJa2yyJJplXGso1M0LVEYHv1dotsISQPFBbrKVGqLb7cT6Xz7?=
 =?us-ascii?Q?7SWdnYX15/Q=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR10MB5037.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?vQ6EYHAvMh3+F/qr+oEo/ALMee0B/zrvs6kxHkiQu8iTecpWf/fNYRrGd/Rk?=
 =?us-ascii?Q?JwnmZwX9sqRfCTWcPkKBg4gH5oFIpAPxaa28Uzc8apIWEPGr4PND/HBKXnOS?=
 =?us-ascii?Q?DV8LZd9jesB/3LEvlmfkHjlUDFD8Ttp52kLj7/yFfbc4Fw1ijYRDWAH2wir9?=
 =?us-ascii?Q?zK8dyJC0VaqFMCd4p+ZTLSOkBa8jRDBc1qnfpGkTWn5DAciZhIxOgbLA7/ER?=
 =?us-ascii?Q?mz85ASxKKJOSWV536Gad6UZbiuD4Sm1oaOsNZgHA9bBw+dSGKmzYlPkQlrgC?=
 =?us-ascii?Q?K6bfvKpG1BEysiK+yHpLicNrm3noEqdBsAx1oG/KbmlkVXaNpq1/wkFJCuj7?=
 =?us-ascii?Q?CgxHTM+o9fQCzXDw5Nm9PfI3qq4vA5XWczxls8Mr191vNP7/Y/MogO5wPD4r?=
 =?us-ascii?Q?t0jVClAtOmFhJTvFMZA7EEqq33hHAnddL39NwgCfoockMYvQm89MyWR2+dFA?=
 =?us-ascii?Q?a5SqA5DKsJgJPz1roKFu/8pH0bU9Mm7Eks+zG1f9YnQR8adxdq2dHTLWmpmv?=
 =?us-ascii?Q?MzFMGPeLUar++GzFgdtmRgoq8UanrQUuDQiA66aMOOHHpcTHYi2XwHc+6b5o?=
 =?us-ascii?Q?eoQwtXpb0LT4CX8HOMEw03K3P6/g9R7IIBcG1vDr3+PMY/h+D06Ze6IKkyaS?=
 =?us-ascii?Q?bhMSRo5YuUjAuBOov9ZgfZCXTNFxy29pT0uNxYPWZ8+diMJYZ5cooICqNaZj?=
 =?us-ascii?Q?uignYv8wcP6BQ5HvUnGbtf5Zx62Q95p0Hmm1caFWhueMSUubfPQdGuP1qyqG?=
 =?us-ascii?Q?9NkpInxU5QO2rdSI8c1V4L06/JX5aQcWwgbKdUEAHWlM/0X6QfO7BEUopU/l?=
 =?us-ascii?Q?TpuSOfszCUF5W18VR1qS/YOPe6LkexTOamMgET01pOBBqFpgGjS0hPNRKV/0?=
 =?us-ascii?Q?0otgGGVpzjSWE697lavjLnJbKHmncj6OLDa3G7+jlFJv5GMgc9ArxkdZq3tZ?=
 =?us-ascii?Q?1LJABjW5azdok4ZYlM2bs3fprYlUA42cQl1U7RBJXub9MUh2F59DKJUHVATY?=
 =?us-ascii?Q?7PJhqUcpm9ZxfvxsM+sI1tEhkbyeBiL/OucPz5RIf9GrMMQ2vFimWhlS2VVG?=
 =?us-ascii?Q?eZY2BHqYW5fUyfJTI3oeZ4EybOG7NItI+BlW7lc9GAAKJJSYsjLnfNZes5dy?=
 =?us-ascii?Q?bnVN5MlkbW9oYMa6smc9mIl1ZX2vTjwEnDk71IuNkMVoorfvERuO7lpsJJHn?=
 =?us-ascii?Q?KSNTjXIr54CZLU6fm3mItdrcyPAZaK65BnzDkCDV8g9MeGT7A+PD7kfZOD4F?=
 =?us-ascii?Q?pb6b+U8J1yjQqhN3apFVS/OjXt66vh8ZT+KXKN1NQvFy9QRe9MMaPCXl73YK?=
 =?us-ascii?Q?l+by6RLnQEFSPzu7PEmKFYH3gl4t9HtO+qP+e6X1B4UzWTUphPZcOMdsg9tz?=
 =?us-ascii?Q?MxqLMFxcjWZNMsgFOq/Fml0XLA8yVUnF6AxPdCXh8Iebt5KGezJjBP7RFwcf?=
 =?us-ascii?Q?VhpR1VLgiwohqRuSfkAPL0IiEVFmBnI1N/h/Zaq1/On9NPGqM2YhRrHFYOCx?=
 =?us-ascii?Q?oL6O4pZ6z2HDoR1xjQ2vEXPvr5FPwjU+FRUwbr6di/SPA4tKyef/YvMsK3lC?=
 =?us-ascii?Q?BCtz6Xy4eOjU+R4m6CWUw6iceazD6meZwobS2sm0KAsLIlVVGuv7kYzBtum4?=
 =?us-ascii?Q?0A=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	mIRoFFF6JLIm41hlAaoyNcXfSYDO0i8Xt8xCjpwXlFZZEh8sdp+pCSNSzoibPqApS3/Vlea96btIl0yAC+1U4CLiFcg+P66mHJyuJMKX8/6rltLjHy2lUaY/quQnhE9bJe7Ra5FMhzzJFyDaTZD+0HWKlnCXMIoSDcokfIa+QwIt8wQi7ri30NEOPk9SXa+hu8+/FkS4X7tTWr3zBkroMfA+NKunKX/JHVOHOJ3A3Rb4nR0ulilQjVdkZhglyCpz21A8uixi/V+g8T32ZrHdSwtWsI1hDHsUTPmFU02AJurLW557poTFQbm323S3jSu48IIUcgLT79K5B9FjrjHmd+LEezrYhin+CT1Oa2YXtmdqKKGimaBCU7k65hEY/NquU/9T3Ti4evXNxn9paHR/Mmk9vtISkvDTondPPWZ+bTliW6Csuheat9RF4bp/mokmplkA1PQeI2wpcvGipfb/f10faDBWJzyKg1OiWYyihgP3E5yGSElugrHLIi6kmYjsoMZbUgWXtUhxlv0UCmjgH8gLoO/yI7hVjQRa0GisvlvzMgGF1jlt7waFYIG4Gx9B6/yJQOL4bdnKD0dl74VqNLDRW1kbB24OGSf2m4jkPKc=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 04821a40-0a7f-4107-cf11-08ddaf289a2b
X-MS-Exchange-CrossTenant-AuthSource: DS7PR10MB5037.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2025 11:58:37.6473
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Boa88nMOy/xM/XuIAfq2WcXZcDxmbITbXfOkitaiXmQGE0YCMk0kBskqpVjXuQaWZXj7hCRGYPT6C16YfFFa1A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR10MB6757
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-19_04,2025-06-18_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 mlxlogscore=999 mlxscore=0
 spamscore=0 malwarescore=0 adultscore=0 phishscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2506190100
X-Authority-Analysis: v=2.4 cv=XeSJzJ55 c=1 sm=1 tr=0 ts=6853fb71 b=1 cx=c_pps a=WeWmnZmh0fydH62SvGsd2A==:117 a=WeWmnZmh0fydH62SvGsd2A==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=55231kknK4dN60DZTOAA:9
X-Proofpoint-ORIG-GUID: JgjFzuq_rh48A3zVaHmoEYMt-dcmaRjP
X-Proofpoint-GUID: JgjFzuq_rh48A3zVaHmoEYMt-dcmaRjP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE5MDEwMCBTYWx0ZWRfX8O9A1Ij6OyyE 36WbcVTvZlCmisLgZDYG4XAS7WWIYeKs9DO6zLcRw4J2RR9D0Z1ocQqYJZhrkVejdPQwteMi/EP ULIzjIkE1SKJoQSEn7xmyYo4tP/m+ubkBCDQlvz8Apw6hTexJNpVw1JeHWvYR0zMQpd36JxSugG
 4qhUb8D8UvdgRo9GYvbyZv3ZaDt7kNTJGYchtt2QF6bl6U6CXnFa8nm87iNCcf40nte/H4cBeAL qS8du/b9ZEyye2PhhQTFs21mChKm+i0I8QcJog8ICt7nir5oZ/VeLn8aVWPAT841KCbAimgV0eZ AE8HNwwhR2MHv71fADgAl/QaLZgUUO7y6bEHd+7UEBYC71xr+M1dxTZvLRHPMcZnFdz8o5POREY
 NXZzju0BTt4glKgoBszpefmmSWY1FS9qWO5Mk9/9TsPsVP63d/AQQFHELGM3wqPX5kZ2LsRT

On 19 Jun 2025, Kris Van Hees spake thusly:

> The prvmap and prbmap hashtable implementation was lacking code to
> ensure that entries are freed when the hashtables are destroyed.  In
> addition, the pvp->pmap hashtables were also not cleaned up.

Much the same as what I wrote yesterday, but simpler and more obviously
correct, so I'd say pull it in, and I'll rebase my jailing series on top
of it.

> To provide cleaner data structures and to facilitate cleanup, tracepoint
> probes are now always removed from prbmap and either added to the
> pvp->pmap hashtable or added to the list of tracepoints for a particular
> probe.  Therefore, when the prbmap is destroyed it no longer contains
> any entries.

Very nice...

> So, only pvp->pmap hashtables can contain probes.  If they are function
> specific, they represent a tracepoint (and may have additional
> tracepoints linked to them).  If they are not function specific, they
> provide a probe definition and they will contain probe argument data
> that needs freeing.

... but perhaps these two paragraphs should be in a comment in the code?
The shape of the data structures does matter to maintenance, after all.

> Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>

Reviewed-by: Nick Alcock <nick.alcock@oracle.com>, particularly if you
make those two paras comments.

-- 
NULL && (void)
