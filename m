Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD6AA1C2BD
	for <dtrace@lists.linux.dev>; Fri,  2 Aug 2024 05:28:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722576520; cv=fail; b=fNXh/f9vXibBx2dIsaHlZg366LbAhSpGwUEhRPGRBa1hK0ma5xiGz/+j7FbltZfxX7BHVaJYYedhwe9/NaAI9j6Q9uT4628ozi2neQLKc/RzAmwb7Bd4BpGYNuUQ3yJDVxWjHHHx+D2KM7Kvo8xAUifk8SYvfPD7CxPYKmMUbBY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722576520; c=relaxed/simple;
	bh=PI5xVp8tAx0oSRFClQSekv+HmfAKCwPBabMlBIf5kLg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=QtZ41g4tKyushTNvyaLEZRvRoHE5Hu+zqgYDiDx7lD2/1YGCcGcNGubMnhLv38xx7CKLKSazW/GOiJoFGXFICXebv2sNtQxUJ/3GXnOeyNVTWPhxDoEPgK/ibY3kfLusHucmmi2ypNGbdiKk6mOps94C9BIk9JB0Mv2ED1pJT30=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=MH9m0bAs; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=Kjc3QR13; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="MH9m0bAs";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="Kjc3QR13"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4723fVsj014011
	for <dtrace@lists.linux.dev>; Fri, 2 Aug 2024 05:28:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	date:from:to:cc:subject:message-id:references:content-type
	:in-reply-to:mime-version; s=corp-2023-11-20; bh=dUMpOmuVLZK/vwb
	y4NgrJNAow3jvQyPIkcWdK1KDH1E=; b=MH9m0bAsk7wNBkv/Ztj5dFim3x86omV
	6wCQsdSqwUaGA9PIsQo4Y6GDHmDZY1hm9aUMFem01QYe7Ig0BUb4AmMNB0GOpFld
	AxeABhXLvc5/RwTuXMOTYTqz86+md+ogh5jHUrxu5n42vvDmqqOZVpzfQyvIramq
	Rd499uA0bHvbPIyTZ9Jif+CzYmyMrxuG3d5y4LIV0dre3iqlOSusHqZXeI2T2yRk
	Zyxnzd7Je0VwG5YJk07kb72Pfv+yd9bo3H+KKut0lFq/4l+K4fPrQ3ILeWjHZv9Y
	XQ/oFUuZv64MXpvGmZZY5ik63xcp8oz38GLWaII6mjgqxj9YJ5nfokA==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 40rje8gdsb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 02 Aug 2024 05:28:37 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 4723tetK030739
	for <dtrace@lists.linux.dev>; Fri, 2 Aug 2024 05:28:36 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2168.outbound.protection.outlook.com [104.47.57.168])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 40qmptx701-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 02 Aug 2024 05:28:36 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pI4wfimVNH9PRAdsDSchP2SxafI79UVmJ0trxeEdFLDKg9T+rPPkxghx8GluCRBuhrZZtlzsfaDQ1b5fdrp3rfajWZ7E4+1GWi2Rb/Cgysd+oBXFbkeE3ZIy2KaSNTBa0eW/N1k6El64Ml4mqi+FCxDCusAhI2x40/5M94BXBHfSSTTYrOBEzPp0XidejvSZ5tNcbWvI5QicmEAqKH2GgXUSNJz/Pvre9i99tcyz5/oa4IEs6TV79PEAfVbbgVKabQgyvY7jYFMQw4Xx/OlY0vzjK25g6SXzqoZ2dyFOPmdfTKhAphF25088SL3hrt7hIbp42X2p7Lax68XsUhPIoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dUMpOmuVLZK/vwby4NgrJNAow3jvQyPIkcWdK1KDH1E=;
 b=prhLx8RY+8mNtlL/DSngIGb1nv1oxCzMtusBJTcGLO85hklO1Crm3ys0n+Jyjh+aPq1ZrgjnNsz8HTJVdHtRukq7vnblB/EnzUwCH/PKSY7l3rSp2+dDbsbWeHf+G0/U8OmPrfODxVugFPPNo8L0ivK6jb85Vbf6ahsc+1MT6DHrxO/FkT5KhrdsnPMyOca8lMSLKgY9HpoVVodaHzGTWtwZVfZPIz21ORFPZylGWJ4CKaf5xVum/p5U9ilAHyTZvTeM3UKRGJ0iOQSBiLcXDTjC2SvZTaMnqT+F+fbrfKZ7MMnY5r88mAxx74QlAHAdcSxTX04M8337R/MQtrdSxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dUMpOmuVLZK/vwby4NgrJNAow3jvQyPIkcWdK1KDH1E=;
 b=Kjc3QR13S5IAKg9ToU2fXZBvxkpbXDaZo2Tro1pt77/MK7FUwI/V0IPoIZI3hz4bI0M1/DbBI0LLfzNioVcw6YUMoQnkIOtL4bkU3gQK5fO9LDIUkyudg84f1/Xi/5BD10gP4lQFGcPxE0xHNtxGqO/VOdqtpTS+x6Xj3t0hfKk=
Received: from SN7PR10MB6287.namprd10.prod.outlook.com (2603:10b6:806:26d::14)
 by MN6PR10MB7421.namprd10.prod.outlook.com (2603:10b6:208:46e::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7807.28; Fri, 2 Aug
 2024 05:28:34 +0000
Received: from SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29]) by SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29%3]) with mapi id 15.20.7828.016; Fri, 2 Aug 2024
 05:28:34 +0000
Date: Fri, 2 Aug 2024 01:28:30 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Nick Alcock <nick.alcock@oracle.com>
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com,
        kris.van.hees@oracle.com
Subject: Re: [PATCH v2 3/9] build: track configured vars
Message-ID: <ZqxufoUKrt+Mn1lP@oracle.com>
References: <20240801132156.286780-1-nick.alcock@oracle.com>
 <20240801132156.286780-4-nick.alcock@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240801132156.286780-4-nick.alcock@oracle.com>
X-ClientProxiedBy: BYAPR07CA0028.namprd07.prod.outlook.com
 (2603:10b6:a02:bc::41) To SN7PR10MB6287.namprd10.prod.outlook.com
 (2603:10b6:806:26d::14)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR10MB6287:EE_|MN6PR10MB7421:EE_
X-MS-Office365-Filtering-Correlation-Id: 877477d1-20a2-4c0c-3900-08dcb2b3f403
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?+41xcyGZPQ7UCYpRq1Mv0jFakPezx8bvunPKwtwXEOqzF1adkENg65ca71qR?=
 =?us-ascii?Q?NdiKTKafPVIUCr3x+QAO60m7cRaq0RbxU/Q1ROO+q8+Z7lMQmH/1TYjUi7bS?=
 =?us-ascii?Q?OIwpivvKQF82zuZ0tNkbnr1HZsXpvJfeMgN+wpNXcwSc9JdAP8xu1I3v56mK?=
 =?us-ascii?Q?zmzdF0LExeWRIO6L745u+y1zYAAo2YYOfxZURRQx2H+IO6S8Zs5gMPYR2t6e?=
 =?us-ascii?Q?kNRM+/N2aEzlZUz2ltHv4Gp+qEwKW7dtzKiiwXhGCNzbJfRUV7bLA1sMH+RX?=
 =?us-ascii?Q?eacpH+VlRAWWfN2WEspyX2NKbOea7wmRPxbeCsG4c9lj5Dn3Hd6OjQfXg0KZ?=
 =?us-ascii?Q?OPrx/F9JgVa3Z4LQri5F3PxEYCSAc+EHX0HcCIEIg5xGnTPlxUfQ9MmSoq/x?=
 =?us-ascii?Q?p9uudMrH2IlBrxtWWGPET19x6V3SgGSYxQPvGEsFtbV2lWo+npWej+0Q3BTh?=
 =?us-ascii?Q?QGKDehpH5Ut5KMU/OrPL4bE+IiW3qUeMX27J1O83Ien8utHN7ufZSlnyQy2g?=
 =?us-ascii?Q?Oq9cb6b8hDPVXZdTtPqY6zqNjCCz74sows4s8+z80EltezCpvH/XwPkzQazY?=
 =?us-ascii?Q?bdi+7DgDBgIY+up4mdny5m870XB4TZ54DdG+j1g4+OFmyyafRYi8nZbOIO6R?=
 =?us-ascii?Q?9BsKR5SvwXKhG6R5zADUs2KUEpO/o+LpsXjKZ16sRteImJPdRY/I6U88CiQm?=
 =?us-ascii?Q?UbYGxHNJz5qMQLzrfmnqhalE6QlgWE2kpz/JiKwuILJyQEqz7QwQF5n8AbOp?=
 =?us-ascii?Q?bxGKRnapLy7hMPb+Pm+iyCUwoLfa5zIdw+yhBcK6xPuw5H7TIWABWLcg07YE?=
 =?us-ascii?Q?/U+C4O830vzhWL3V6r4nb93wEyxxWJRS8lu7J9cV1zKAMdptiLFOqLbYkhKB?=
 =?us-ascii?Q?IG/GfFYa3neHgCtgW25vGlZpovxRjbDTZCFeXLSxqqbMEgeTAZgWawE3Pjvb?=
 =?us-ascii?Q?TJis43EY2HIb+pHw1+l20gQ8E0xSwZh4OGYAwFdazuQmOURQbOax7UOpBEKQ?=
 =?us-ascii?Q?gYtBqQ/KoOCalV4cJkUpq9BFH0bzkWSEJmzr9NlXu5ohfdxS4Ajk44edF5LL?=
 =?us-ascii?Q?k0dOKiWNdNnAvyU/CrxlFbS35GXE6lGmeDrCUFz9xm6xNQiDiHJQHD3Xj3RO?=
 =?us-ascii?Q?IQwGaM4MXMLoWHZvmbxbX7sGfKs6uMMYAydP9w49KCBNQOdT7HfJh4maAZcq?=
 =?us-ascii?Q?ltkOjQEHjCtZ2SmbqZQS5eO//zed714thw61azxCs2JMYHzMB/QIjIZj0MQY?=
 =?us-ascii?Q?cEunTZaFLICvg25hJGk3ONH9LLK2TGV9WmAQxtq1Bp3npJXlsHH381nVU1wP?=
 =?us-ascii?Q?zvR4x2vYCDpDNXBBwhctW+LaB7U6n5apHWMtlOiImrUPLQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR10MB6287.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?p5BN64pmfU0wwK/nV7xdZg4L4O9ZCvt72uCQD0PrgVNSUJB67BN5aV3e2DTw?=
 =?us-ascii?Q?uUp5CIXCDaU+yEt6UO0NFc/WJINSXK6XVmcXQ4cPj7FodkDIr/IPoCy+vDzx?=
 =?us-ascii?Q?mXatKtdbhWzcD8EUjITIQhzb6biVKlLVC4IVf1pOkfsC1DSZP7urKObNjyPU?=
 =?us-ascii?Q?6nkQRIQR1ml7r0NuS4kya7bOpLppcubZ6/+UVSkDKW9tQB2qFnXuwPD2alUk?=
 =?us-ascii?Q?xjyqZ8HmUFzHCNhJW2ZybOk5jchsi0zi5kaQcUBnOVKyBlG6TUM61vp4wgRI?=
 =?us-ascii?Q?onOGzvcgvERG5I9i8INzDpA2MW7KOdz9i5S3Vw8ky8l9YOjQNsPlS/MwuzF2?=
 =?us-ascii?Q?BukO0yjuIXe0wkeAu9nRMrmGAoBgNRzShEDkE2H4FvvTw3ozric5aHBc7n9/?=
 =?us-ascii?Q?d6StQCNMuc8ZhFiDcxh0B7MqtU+zBDcpSALWqzgL4jbFYLqqkUePmb2osFQB?=
 =?us-ascii?Q?2Jwf8SXkUifjcFUjk25zE/VzW1rNjyJ4SH4/bu60bvwavcXcMVupQESxRC4U?=
 =?us-ascii?Q?p8OG4jOAQA0fTviFfZKTGcfaQrDXzyZcpbQX0/W/jU4Yd+IFoc6waSeA0/va?=
 =?us-ascii?Q?425pdQU8smFrCYpxmBsXw7LGwibWqZssPtO8wOrpAZn0j03Zom7Gi7Lon82K?=
 =?us-ascii?Q?3N5WI/g+pPgh/jrCVFLXYhn7vOEL12SKt5jYnauKsde2Lz7z44l9zPW2bvxd?=
 =?us-ascii?Q?oqH1q+dSJ3w2iHXFkyTPka2Wl2O3si4r68XMEOqESREocexY3vO03cLQUniC?=
 =?us-ascii?Q?/BYse9sTyeQgEUr4nWMpcK5H7ly2PdbL36YRd399AnO0RYH6Ui97NVJ9yFnW?=
 =?us-ascii?Q?67t3sPW4517YzJX79dOTkTxbFaAKl2Ovg1FuOHow3IoTFneWCUcUHrjxuoQS?=
 =?us-ascii?Q?A9blLEsmAaQ+cTXAUwPlhHhoFQMtPaKNiTUS44WaT7oVe51te6i2xIAvX/EI?=
 =?us-ascii?Q?iKs/sViVCeQjaXVvk1sxUtvj8het/esWUDTiCdtmGRDcsk7KI4osj9idaPBi?=
 =?us-ascii?Q?4LpbDH5I+jUEDHhLg5usS+E+Z+PeHsSZHX5mlDr9fLieRFwxDfnl/l4B89VM?=
 =?us-ascii?Q?ZPidkZzt9zja60FapBqV4cFsh1FdnU9Q3UwmdwDY9wKJY2yuf2F+UGvRgP0U?=
 =?us-ascii?Q?EGNRg7kAhwYNKxwHIEYkd/uu/ldqzmSD1W1a09gZU40NSkYCgEmVPyXs0DZ9?=
 =?us-ascii?Q?XL24EBgmPwETFe3zniDdGzm+yzE3QJtzDE+8Qpf4sN+31rTB5UfKEDLoGqgy?=
 =?us-ascii?Q?KLFqHTelc30dp+47o0juC9KjP48m4WU5mwf2ex/rCeQdc6sJ90BwIZ4R/iGU?=
 =?us-ascii?Q?Rkap2eh4fPKI3LLmcEAF2yH7lECcbfGuoCqzYgRXjGLHkvac+yZdlVE+79DY?=
 =?us-ascii?Q?DaU58aufeogq4YuRFkZj8ZlN23MCOEwKt8E/I1a+BRXpP6BmAnCg78PKTCve?=
 =?us-ascii?Q?5WWSeVd+4wpK23P0vJqqtxyKBCzqq7YZUHGO6cb0n+xi20MvMTwE3gl/opXx?=
 =?us-ascii?Q?Nc+rZn2JV8ImvCwMRyUHh+Y7640ZTUtLnGR+noHS8zH0XFI6Oe7jTUk4P970?=
 =?us-ascii?Q?uVSwci7a8hOesyr2Z78SqL8R4KnE3obzVCsG4eufycuCJ2Xsz3PLDLbmkdUz?=
 =?us-ascii?Q?ow=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	tKA9tdGLWcN7IS9ld/Co5a31u2if22xna4OjqKTGcoJpC1xBOam5G10O3LvrTvJtsl/rb2Qki8DvbrLsbWjOiYJOMSa70NAjCGCWvyk4KTCT2742HFThzrPyLq8YCbpUWTlm7h85vRFDHMHrLLPkopC+AzGTUKuGFoSjY/nP5pXM05AuR0p4cKdTcAlxT8wR4pinCBiEc/JLJmzM1qAHlDVIKRykCxnFeErmB8gt28qeE4DtZnoIUgPPPOObl42EYvdJAM/ucYeLnobm6z26eZqnm/uFjd5yxqk6XYxQ8WsZZDvaLYD+hKDjmc5G3EiPRLoB3N7p5ABupWlkoGHGBqLppkOktc9OR9VZT7oRmyVbarQ1jVMWjOWcz36BxaWHDbN5x6PPv9sOp7ONME7e7b7KC2YEYmw2UEX2qJL5C2o+TR83kjonXJdfF5hJyB+/qxB392MS+/sH+tQWC1Jrlm3aHJOqTThXXqToapddBBz5xK/qiG9NP7X/QqbDKhVxr56W7Gc4XbJ0fc3f3hWpsY2sXcTX1BJwCb6JztxoCOFmHrB8DRL0zxN/3OkktXrGVorIIJI554hhRynLdMymbTyruapLSdZuvXYe6iFSN6Y=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 877477d1-20a2-4c0c-3900-08dcb2b3f403
X-MS-Exchange-CrossTenant-AuthSource: SN7PR10MB6287.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Aug 2024 05:28:34.4474
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eOysINS+jsXyEsjCEvIth9Ou7ylFeFAYzzjrIQgczI19iZbXuTr2czTGX9DNbiMgdUSkC7aJD39R/by6dWbPzTX5lAH/z4JEm3hzwimPZcs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR10MB7421
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-02_02,2024-08-01_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 mlxlogscore=999 mlxscore=0
 malwarescore=0 suspectscore=0 phishscore=0 adultscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2407110000
 definitions=main-2408020036
X-Proofpoint-ORIG-GUID: 1osXQun60CdHBneZSSE9NWM90YIiqw1z
X-Proofpoint-GUID: 1osXQun60CdHBneZSSE9NWM90YIiqw1z

On Thu, Aug 01, 2024 at 02:21:50PM +0100, Nick Alcock wrote:
> This lets the build system determine whether a variable was
> explicitly set via ./configure (the assumption being that
> if you set something explicitly, you knew what you were doing,
> so e.g. if you set the --systemd-unit-dir to /foo/bar, you
> have also arranged for systemd to look there for unit files,
> so the build system can install the systemd unit files there
> on the assumption that they will work).
> 
> Signed-off-by: Nick Alcock <nick.alcock@oracle.com>

Reviewed-by: Kris Van Hees <kris.van.hees@oracle.com>

> ---
>  configure | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)
> 
> diff --git a/configure b/configure
> index 462548bcc69c..fb9a45cda1b7 100755
> --- a/configure
> +++ b/configure
> @@ -17,13 +17,12 @@ write_make_var()
>  {
>      local val="$(printf "%s" "$2" | sed 's,^.*=,,')"
>  
> -    [[ ! -d build ]] && mkdir -p build
> -
>      if [[ ! -f build/.config-vars.mk.new ]]; then
>          echo '# This file is automatically generated.' > build/.config-vars.mk.new
>      fi
>  
>      printf '%s=%s\n' $1 "$val" >> build/.config-vars.mk.new
> +    printf "override CONFIGURED_VARS+=%s\n" $1 >> build/.config-vars.mk.new
>  }
>  
>  # Write out build/.config/*.mk and build/.config/*.h, which are the same
> @@ -115,7 +114,9 @@ above stick for future make invocations until "make clean".
>  EOF
>  }
>  
> +[[ ! -d build ]] && mkdir -p build
>  rm -rf build/.config.new build/.config-vars.mk.new
> +echo 'override CONFIGURED_VARS=' > build/.config-vars.mk.new
>  trap 'rm -rf build/.config.new build/.config-vars.mk.new' ERR
>  
>  for option in "$@"; do
> @@ -173,8 +174,6 @@ done
>  
>  echo 'Writing build/config-vars.mk'
>  rm -f build/config-vars.mk
> -[[ ! -f build/.config-vars.mk.new ]] && \
> -  touch build/config-vars.mk
>  mv -f build/.config-vars.mk.new build/config-vars.mk
>  
>  rm -rf build/.config
> -- 
> 2.46.0.277.ge12b8151ed
