Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31F1D19938D
	for <dtrace@lists.linux.dev>; Fri, 13 Jun 2025 14:56:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749826607; cv=fail; b=k0YRFKbQNx5JiGWh3U3W2OBkNTm8GNPP9OaoeWbnQFg7h/eMrUR66g/vXbs3CyhNgGD6oBXrkp3SA2jYHaTqTDFd8Vvy66iZ3mtS50esihia/9mTNcIJfPz9xmFBrYumWu3DpCWC7mYoFz8V79t1FUByuLk1JnhfWwZQZoqsqwA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749826607; c=relaxed/simple;
	bh=Ak/C6G4UPiv4gWJonEDTlxXaVBPZ6P4XYg1wpyJUr3o=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:Message-ID:
	 Content-Type:MIME-Version; b=WpcsQicrAk/EkuQgWtUJ5qTlNWeRQ25msfeTACTKWXog/GvFVtYyL8/tIIbXjXNhbLUVR2NE+7Nvf5Fc3G/u9dgd81Z+DflDGQ6RR36kMREZD7ImIJpr5OlGDiGVs4EjF87eK0OXyI6cA9fX7C54oxUwHmdLrVzqoZeNJZw3H10=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=qAwg5iCK; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=mr3lEHWx; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="qAwg5iCK";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="mr3lEHWx"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55DCtZlO009394
	for <dtrace@lists.linux.dev>; Fri, 13 Jun 2025 14:56:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=w2hOIf1C43MYltzNIT
	HtkXvcLZu3fBbR6q4Xgl9mMQU=; b=qAwg5iCK0x3JPXpLoWLA4HRTV155jmhtEq
	HcvfctJ3WIeZ/WVrgKeHgr8KZz1jKSzkXpp6CNphrQoweQdWWRmE0WHDab6WKgXL
	/YuqJe4DiMIVHae77f34GAS/sLiow703Mz1Gm44urBdMepzJHUBusYBH+vzx/d2m
	X+6/ycUwv8j2KlCm1W4RzLu7kDVxwOuPzDcH5wTm5BEj2c5hl9wuUG0JMcl+1TkT
	Ks40bqGhJBsb+ipxCZhh9XZWi22hn8g/zSXoRJ6NNtQ6qd3vSVZUWRS12ppQj2Ms
	7fwbrQn+2pDPdxX+FkhAwFk7PbCd7H/FYzLn0toQBtfIFV98M6kQ==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4752xk36nv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 13 Jun 2025 14:56:44 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 55DEWvJ7009270
	for <dtrace@lists.linux.dev>; Fri, 13 Jun 2025 14:56:44 GMT
Received: from nam04-mw2-obe.outbound.protection.outlook.com (mail-mw2nam04on2088.outbound.protection.outlook.com [40.107.101.88])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 474bvdqn6y-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 13 Jun 2025 14:56:44 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=otxnKuQlyfLiTHS9neMs5fuayo1Tui/pMWevxmTXOiXQ7dEfwHfjv1urU1ohGB++LJEC9WiAMznUAsZKcVWs0BYX+pi14Z1uJv3rm5AYHo89d+qbJy9I4FfGgsnVtaRddC7AVfIE9Q2eOm+Bcew48iIU/rPvAbilYVM/ePmKcMzooGZ3AaGisuJ/ApRzTZH8vxCvwrRCYD5oINegGnGSvXJ8UGWlauIw7EMOkmboLCe4KblHaXwxUBPimwGzmDw3gdiEKo30myEcgW2bQVsoKjrfeczNF3qTOkNG0sWCWiFsJTaWI7l31CspgW3AmQ+azhcnpsIZ7XshY+Feiz7YVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w2hOIf1C43MYltzNITHtkXvcLZu3fBbR6q4Xgl9mMQU=;
 b=YRRdY+RNAhd+MnSA8ks+PIFwMHUG9ad8tP00JOLgzkq/kOCWLR+lgKeyDr2rozwQbemGt8TEUqC2sWwswTz/fPBmv6gtPZRAGdVgzUCNC4HnGC7MOFckKzz3mnblj3Gx0hoQKas2c1ZRyUli8cyv9mYXVDM5XDvzR/cwkG0HVkrUh+Bz4LYsgQaJiVffw9Q1QBAiaUund6wu8a7RUx1BVD8ip3SglGXpAYeHsfa/kVVRMYPfE09y63mYq88fyyW2KQnyY0SPK85u+FKVfF7ZqzHYGp58PEbNBZU74llRxN5GdIs1opcVJtWPXz0KkwxiRvUtFd2cS4NLI05Y6Olhyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w2hOIf1C43MYltzNITHtkXvcLZu3fBbR6q4Xgl9mMQU=;
 b=mr3lEHWxU+weVRhFduVfY+3svYhVJ45NinR2hqSF0nT+bf+ORv/J1M0KCiC7Co5vbb1Qrk7Mz2LmjdOsRObVv/NeSOHQUiDEC/O+RiJaha13E4W4LrCfrfNBE0i1899i5QhcdoFZx/P5YzX/rCVbvh8rZhRgrOJFwFsMC4lZk9k=
Received: from DS7PR10MB5037.namprd10.prod.outlook.com (2603:10b6:5:3a9::23)
 by IA0PR10MB6700.namprd10.prod.outlook.com (2603:10b6:208:440::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.25; Fri, 13 Jun
 2025 14:56:39 +0000
Received: from DS7PR10MB5037.namprd10.prod.outlook.com
 ([fe80::824a:572e:d9d7:e9f1]) by DS7PR10MB5037.namprd10.prod.outlook.com
 ([fe80::824a:572e:d9d7:e9f1%6]) with mapi id 15.20.8835.018; Fri, 13 Jun 2025
 14:56:39 +0000
From: Nick Alcock <nick.alcock@oracle.com>
To: "eugene.loh--- via DTrace-devel" <dtrace-devel@oss.oracle.com>
Cc: dtrace@lists.linux.dev, eugene.loh@oracle.com
Subject: Re: [DTrace-devel] [PATCH 13/14] Test: caller and stackdepth tests
 for io provider
References: <20250522180118.27343-1-eugene.loh@oracle.com>
	<20250522180118.27343-13-eugene.loh@oracle.com>
Emacs: anything free is worth what you paid for it.
Date: Fri, 13 Jun 2025 15:56:36 +0100
In-Reply-To: <20250522180118.27343-13-eugene.loh@oracle.com> (eugene loh's
	message of "Thu, 22 May 2025 14:01:17 -0400")
Message-ID: <87a56bbsgr.fsf@esperi.org.uk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.3 (gnu/linux)
Content-Type: text/plain
X-ClientProxiedBy: LO4P302CA0009.GBRP302.PROD.OUTLOOK.COM
 (2603:10a6:600:2c2::17) To DS7PR10MB5037.namprd10.prod.outlook.com
 (2603:10b6:5:3a9::23)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR10MB5037:EE_|IA0PR10MB6700:EE_
X-MS-Office365-Filtering-Correlation-Id: 70e69a55-dbf8-4a95-c7ac-08ddaa8a8030
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|10070799003|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?hGRxCq+5O1K6PiDhh+e213YmkbALfPRN2Ib08JH3k5bB9qvXwmFd5rg8QS0q?=
 =?us-ascii?Q?KUUnf1KWA0mrB24lZP2R1FEmAtMnjBDOTK5xm3baFGTXn53qWEE9mUUFP5b5?=
 =?us-ascii?Q?xCFQ5g098eYcmdCBRquEeL95MO78lD5eaUSDZn0o1Ivc9NnWSEPEx+9AgW0R?=
 =?us-ascii?Q?s7RwQ/tnzr6gmvNsRKMPuO4ki6tBTzjV0tX82oT4rJA5x+O5PLtoMNhxEU0d?=
 =?us-ascii?Q?O7TkbKzoI2GnmBmAt82hLfFLe1v9+QGTgGZRpVHu8LvdvDONGEUqB0YezSOe?=
 =?us-ascii?Q?3M4L9VoQmfJ4PVSUOjTMnyooTy0hfiAg6hY6L08SBzWpNawlaZvfD2Fechxh?=
 =?us-ascii?Q?EF2gIOS0wXqA0FjqvpxyC63IW+RBWZIREXaaJsQ3Sh98QIhhn8mLqbXslyln?=
 =?us-ascii?Q?3PfS6NCiwefaFMeWXOpThXmif73mSlagswJmR/YTtlwz8Uz5xvfQAntngvlj?=
 =?us-ascii?Q?o1S21319YfOehURWYEmIflUX6Gsx6iikHE/1iY6tzBRopg6TAZyfRA+z4ZI3?=
 =?us-ascii?Q?k3COfgdfLqriDI4WDZB8JYQ4jiwWfucfWgHsX9dtgc01YRHdb7CrrkwSO0Fl?=
 =?us-ascii?Q?pQae23n2iO9yZre28QzGQIF6S6EQbefcwtpxvsVd9BMPgn7ow8VRXaS1ExB8?=
 =?us-ascii?Q?iKJ+8tB80TxrXpWYcu7RzA+LVLFFePIrxDsFfUcf3KprMyAaUSPdblmrRXSr?=
 =?us-ascii?Q?fPS2l70oxL4IL4aV/nhTiL2GJZuDakijbKq1qriA2Z6PhSrK9hNBxujyC8VS?=
 =?us-ascii?Q?4Mp3271mpj6lJznvtR2W40mygpaNurSQFzoiM2VH42zQf+MANQDpTRfcyNvH?=
 =?us-ascii?Q?2MIFKnoch0LsGe4Jckpw22UHd/XOe15700NzM5qLVx+Cxr1ZvXYAsxLE7PrW?=
 =?us-ascii?Q?ay1BO9IEfuACF10TcD6WyaY2TaPw/y0Y6mFwrKmWh9pdiI5hcag3uaGMT75J?=
 =?us-ascii?Q?RL1Dmasdw5j+zALHIi3v4hPs22yZ1U61lZBK7vXzVFYb0jASs0mkkI877PTu?=
 =?us-ascii?Q?lD4/Cg5h6BGLcQTscwgrs/9rzxoCGGz1MhVtY34bjkl4SK+ZYLMrOBd7Ct5t?=
 =?us-ascii?Q?qY0sukVEdGcEwCd/odLoqG+L8a8ieiVcL6vQsJyAN0p/pTRaRzvHRhGSGx7X?=
 =?us-ascii?Q?7yZQt7VVKSsWtr71lI+1iTYL7r+MtS5AAl0oHMTpKLB4wyuYVGR/fxn1b5ru?=
 =?us-ascii?Q?ZySgQTy7U2n3Guej9GrEgcSsdaM27oZSwk5Rjo3tX5VCnHhIx5hUs35SB0NS?=
 =?us-ascii?Q?/amgV3e/KNYdv82AMSWGkGIWGRgPxhdHZCfDH2T5WxvhWgyVBF2wKSJ09ci4?=
 =?us-ascii?Q?/6QAwN+pl3u6xiIt39xwCpxT1RsW9G2//t797MERNgqGaTS0hIvraobkteUm?=
 =?us-ascii?Q?O6G8m7ReVX+N6wTgBkfCps3lPa52zGm3tenQBYy6lkyJLz+BMXq/mMdFd7iE?=
 =?us-ascii?Q?+AC6OuvfqF4=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR10MB5037.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?PCfz36Ei8Y4yaRFR/5iykQJjNtHK7m0rc6Ol1BVD/BYQ3hSZOiIGmDznxSxt?=
 =?us-ascii?Q?BbJdu3EcZaZHnX9V7OuLWDowpDRgPzaT0xlF1Rr3YvU7XnQZeNEGJblM7LDT?=
 =?us-ascii?Q?LED8eagDEcXHl9JEEeo5QgQNjq9WIc+wBiPEvSyxfqQYPgx/cx0RM/iApRQq?=
 =?us-ascii?Q?Y6Zk5AJKhdj79gB4CjW8UPo19oPXsd9O61ng02lCJRS0QUSLQaHE9uVbzKdc?=
 =?us-ascii?Q?7rI/tJzKhFsQf+7C7Q6OTKeDIEKci1P+OPdOVUTBffynF20SMhSO5Jqoa28m?=
 =?us-ascii?Q?W6Eh+jIS81IZXhSV3ssOcByoFMvMQ8yGe5DkNG/E+jPDbn1I/Pl9FETtnYgO?=
 =?us-ascii?Q?BmDnOBGgQkncQwIFBTbIcsl+0XzEV7fuq96kORxrtxM5+cUsoip+FDXoMQIi?=
 =?us-ascii?Q?O0A/gr8FeuM+iUwkCqerg+T6YBjFh0VP/IKNP2TlfVtD3OHDvx89FI2hqvjW?=
 =?us-ascii?Q?Uchn8A5Yn/dgb0LW2huZvgNFRmLF3HWyIrT7uy5XFr2gH1dCTLdQkroD8+nz?=
 =?us-ascii?Q?W4yTvoG/2GquLMttodb+Y+2jfpXLwrmO5T5D/DoeVsljESsq8UWNL1oDrBiH?=
 =?us-ascii?Q?s+4ySTkTC2qN1Yu5W6j7ZIcwAkRMwWchpnXCZhCh2AgdDjxBm1HSakIfjRKD?=
 =?us-ascii?Q?vkIrRKQU+YggHDopVV/F9NPTXYaZBuA4ucOM3l0L2z7XQZqFof/RBWY6QMNq?=
 =?us-ascii?Q?NzaEDRs4VnJobztk9MDHzWhmbJA1RzDpH8mm6RScvU5kRzJhxolDcDAHsX8D?=
 =?us-ascii?Q?g0ti1X1mIPO039YRzSsI1fHoeuCXImhN4qO/Oy4qFLTqH/V08+OQIVLDqH2H?=
 =?us-ascii?Q?gXwFG4ycuOVLkFHeLG5n1dDxfJ0YaWEU7Jp6QeTTcWnGp1GGVcFdvlkNC4Wq?=
 =?us-ascii?Q?sWrUqPzMtNg2fQcxucZ5SDT0VUiJ+fNWb+o17ylSA2nVNrUkQKU/rZMPYIyt?=
 =?us-ascii?Q?2KE+KlKZlUdjBXqcONH6PLP3uKdreceqWlN7ttLGjwrmSOiC9IV9nq/UpsqS?=
 =?us-ascii?Q?I4Os+sqQsWz2kYQ8lz/cMHX5smeFkSc4rV3Wmbr69n+UXEFbEci1WVrnraDJ?=
 =?us-ascii?Q?kdZCWxA80S3tQWUxqutEVNtsezH8v7m87wCqSuSVCRbmI1OW4KjibHbVqx4g?=
 =?us-ascii?Q?GIOouz2nz2QAJjo8eK75PU8ubIKyiOUc/thig+XdsZpB0PAhe7jEKadug0sq?=
 =?us-ascii?Q?8bYX6agwhkWGwya+Wb1TX5QVygkAs0bJ5oaVgnw6mxbXgC2vfXD+XLNdH3mp?=
 =?us-ascii?Q?Ky8A5+1RjJd/PUlDpfOOz6+VdIOlUw5AFwwZo7k/M37UKi1TdrAgz5ig+0ur?=
 =?us-ascii?Q?bTggyJEKZcai2Ac8nqf+Sd+4G/olUhbl3oozgG99UrfuFiyqfh1b5m4B1akg?=
 =?us-ascii?Q?7PKX+HKAs9Zbevh1UTFUMjVRa9fHxYfUVD0YhjmW50UnAlp/LaRJJTcacrYA?=
 =?us-ascii?Q?28i+KmwerpXRNmw3sltc2oXVdInjjHbq8gQUSN5ADBAUxbooXhqPVEXe3dLT?=
 =?us-ascii?Q?IguTF7BgYysWaCVnr+2VXBXAKDVMwO8zBBAGn5mY8roojAzULQNggvQ0WtTZ?=
 =?us-ascii?Q?AVvckp/ZGHSkrEuU6h1nRXUVEsn7MaA84mZ7Wz9FWIXdaevVgB5drRCBXfdT?=
 =?us-ascii?Q?bQ=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	uat8FhYi1wjaaZOT3VSoaEyGt25qUvsjhWHZTx85DpA4Y/w/dID9nuuIBcYg25jzfTpuYJkRXcolUbxqVGBhruyh8LhPymqRlVHxWubNEfTjoV5OL3ccDR8WiS6hwXhSB7BUcmg/9ySUk4BHoqOYxq6vaiJ8mFaKb9I5y+V+PLhdakgrXl53eSOoEr0KFcnRBdyfmEIutqXBirEb2jPDtkxpHVQir1L1CQz3MqvriSCAQFHD17Z/Wte0CDSgFK/Ij0bT45hjZhIvSZ1TjV/uYsLzSp1Ys1W2qdUloF/w3nwumclft5cwZjuQWKJ8Xj0iCKjeVkN4QeUUY4Z/iJNILEoH6x+YANicvBIH0sgTRYsPZPgWOYkLZ1zWyKAPjq43PqiUYl+uBy79iGCVQRAq3Yk47X8a5DzgCPrp8sbv/1u4XZGrAT0f4LE4yyI3BUt0PRlrxBBsi4CXaeiPFtOp2h7tBDpcRGJxnogd3iaT/HqxEr68jc+ChRLZC3iVEB9gMGAzWZEftnYKXC9RDkt/x0tyDG6cTVGNpjv8i09w/K38HLYR7isP4Ozln9XV5RnY+WYvhBAbIhoYwmJK/mD8R/w9a9YC2zoZavPlJuurISI=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 70e69a55-dbf8-4a95-c7ac-08ddaa8a8030
X-MS-Exchange-CrossTenant-AuthSource: DS7PR10MB5037.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2025 14:56:39.2609
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: P+y6d497tMVROhIBPMzd2Tt8g6JyHLcxeV1JywylQ/F3owzcQLurYq0Emz+juFwN+sOM0SRB4i29wusUTsvblw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR10MB6700
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-13_01,2025-06-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 mlxlogscore=999 bulkscore=0
 malwarescore=0 suspectscore=0 spamscore=0 phishscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2506130108
X-Authority-Analysis: v=2.4 cv=K4AiHzWI c=1 sm=1 tr=0 ts=684c3c2c b=1 cx=c_pps a=zPCbziy225d3KhSqZt3L1A==:117 a=zPCbziy225d3KhSqZt3L1A==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=V69myQ13fmlvfFGD_xYA:9 cc=ntf awl=host:13206
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjEzMDEwOCBTYWx0ZWRfX6V9Viksi7nQT vNPmZlCItWylEvPOK86BIsuVm8GcsCxWJpzSRaDR/r8H/ibmExv444L5SGjVkkVmIAJj/CtEUQB eqFqBcKABZvAuuNXAdANcMK0L/pYEOzfF5YRB0JGwVIR4FuFmh0+6BT4xfnonpvtbOPnlZRfwOr
 mgvwyGKhhbR0otjd9WKUdLjmqaoLMCaqy3DmsscRQGq93EyLkkkpPVWPU7BOtOLus0vIWn6+jPv vnwZDUF8f9zvDCykIJn+awkqzFi6Y+w590o6Q+l7GHLnz0yeH/8fXgrFVCFTm8ivRSHPxRWgYqW qfRWOdluaYa7AwIsX6ysxfshE98zMuPM5IqayGVOrCVfELUP+81d2QRkHDkyV2LDKp5ofqBju3T
 zLhxpi+0E6xWupHRauYw3IoMyhnIF/vu+lZBU3HK0Z+93toXH7D6kvcFgR3Nbd8AeXN0HDdv
X-Proofpoint-ORIG-GUID: kTiDPO1QDCu2UysUp7lJoQL3iwgVQrxV
X-Proofpoint-GUID: kTiDPO1QDCu2UysUp7lJoQL3iwgVQrxV

On 22 May 2025, eugene loh spake thusly:

> From: Eugene Loh <eugene.loh@oracle.com>
>
> Signed-off-by: Eugene Loh <eugene.loh@oracle.com>

Reviewed-by: Nick Alcock <nick.alcock@oracle.com>

> --- /dev/null
> +++ b/test/unittest/variables/bvar/tst.caller-io.sh
> @@ -0,0 +1,37 @@
> +#!/bin/bash
> +#
> +# Oracle Linux DTrace.
> +# Copyright (c) 2025, Oracle and/or its affiliates. All rights reserved.
> +# Licensed under the Universal Permissive License v 1.0 as shown at
> +# http://oss.oracle.com/licenses/upl.
> +
> +dtrace=$1
> +nblocks=1024
> +filesize=$((1024*$nblocks))
> +fsoptions="defaults,atime,diratime,nosuid,nodev"
> +iodir=$tmpdir/tst-caller-io.$$
> +tempfile=`mktemp -u -p $iodir`
> +
> +trap "umount $iodir; rmdir $iodir; rm -f $iodir.img" QUIT EXIT
> +
> +# create loopback file system

We have quite a lot of these I/O-trigger filesystem things now (this is
our sixth and seventh). Maybe we should think about refactoring the
mount-and-mkfs-and-dd-and-umount bit out into shared code at some
point...

-- 
NULL && (void)
