Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 858D2221DB1
	for <dtrace@lists.linux.dev>; Wed,  9 Jul 2025 16:48:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752079699; cv=fail; b=YYFODTiDkcN/aHTYetqCq0ElcbexxeXUSsEa9TaHux6st3WKeg4W/VqYLEHkiw7ISjMuaxLUS8O9p2V6R2v7EQlfyCCvInLFbiuF+wix3V6Fd8JsoUTT517Adwu4QDfRdwqBfmP6z8gu99Yi0NPxICcFOXxe6+11PWsMtVr9nkQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752079699; c=relaxed/simple;
	bh=xKXJ1BNdOVHbmcHq8y0YMeEtxKGU1CFM5fwdqtpjsoU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=seRUz4YRrPfPeQY7izsYI6p/zztEr2DddIDNAG6VwF98JF7t5LyLyjhZWxJ+EKaUDo93W8w73B5XT+OCMulaJRPs12R6+g2JH8EZa4wJ2SX/8B2uJwwFt11R4sxATkil4gopKwzzVi2ZHDZJy4K2kb3x7kY/WMW097oGaiNlq4g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=ouwGFh2+; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=hD6965wk; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="ouwGFh2+";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="hD6965wk"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 569GgixQ003180
	for <dtrace@lists.linux.dev>; Wed, 9 Jul 2025 16:48:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=tEbaOnlQD0qys/X9os
	o4n2NewCUutA4G6mI6xhQF7pA=; b=ouwGFh2+zYbzgu7ZSSWclMMmC5OqJFwB4h
	VR91w6cp6eBKWjZcDnG5HRTqjEJ+/CO7mUf12BMdpicP8ZVUH2V9ESE0hzMhDecb
	L4K12Q/zWE23NPaAL6MwjdY/D0aws2I0Cg6bx5NWi+WDJI4/dCrkjm3KzQlBarbq
	8MYxXMft2k6VqUAmypsKN0XAEZClXZpdwtJtaIOxPDzAzE8/ubB0Wjjiho19RjY2
	UzLVj/QpG8Dl4Bk/PO5HsCvmNjud/g5hM6uFF9PUepXUR0Tdjrn6cpLB9EAW3XM/
	25ZpoIky4LY3ZGEGFBvxYwGOCncIo1PwP6LqHXRwSxakgh9Ray3Q==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 47sv5wg0f1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 09 Jul 2025 16:48:15 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 569GOkRJ014599
	for <dtrace@lists.linux.dev>; Wed, 9 Jul 2025 16:48:14 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10on2079.outbound.protection.outlook.com [40.107.92.79])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 47ptgbyrfa-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 09 Jul 2025 16:48:14 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uNI24H4uzb7K8LcM9GinQogu/9YOD7rQZ6dtvKsKng+dBZPW3gwGlpLHpoo4OW6V9cTdclY65Q3/rTIiblNT65KNu5d0S8VOIMjA5JARp5ER3bZlCm3An5L7CditxYlL/T3IjJuCyW21RNdzEktNBVhErmvYGqAcrM2QQLFunMTqX+JoYd+jK+YB/kvu5XIiQMLPG/uQpBsi3HLhzOXc+K50yxnsfkhSvqTwvN/H4RLjqBrrkkZVwWvrTF1ZB/u7ZykdJDAMzv5FfpBOuwM6Z5EOGg2KSZOIh9DhIvqHU3/RwJZVWT5MnUQGo/XIOICqWU71R0rFextw/fHExgtkeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tEbaOnlQD0qys/X9oso4n2NewCUutA4G6mI6xhQF7pA=;
 b=yZ1IW0Fk/yTrN5ST0Yn7yqwuMMbxsHHOGxN1qIMPH4CFt95eK07BgO5mCWSOCd1/dvYI1otYy+t0cgDn77ZDh9JxUmzikz3GwCUTp7fAcb4Dsj8dQMnzUQSlTd89YfpO37T4HCcGIdA+C3bI11X8ggLDVClYHz+UCj3bRfYche1B9heJ0/9gM9u6q1A/gZD9jqVy+YadyrKp8mN14QMvqha1/iPWKNdypMRsibh10zt9kRPtjZydVExHI9Az9yDecDnbviHXpB2OZYjcbbEWDK/bNVt6AnuGlEYlIyfjiowf0APfJ5P9IiDevZWyUvzN51TMeQcd6YZOqVrIn8djZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tEbaOnlQD0qys/X9oso4n2NewCUutA4G6mI6xhQF7pA=;
 b=hD6965wk6i39zILL0Fgme4/O0GhGT1XQ0zgGYKja1sEZCfXLtESkoWfimTKJADHctlRxXiohxO+jB4+EwwEZx7RsQjY2H68iPFMAYEr9rrsOLeaXgD5E0ZeHYks6UK+TuwtZ4Iz9shWBySr9f6L+wy32BlBuMp4VXSjE4hpEckM=
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com (2603:10b6:a03:3ef::21)
 by DS0PR10MB6197.namprd10.prod.outlook.com (2603:10b6:8:c3::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8901.25; Wed, 9 Jul 2025 16:48:01 +0000
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b]) by SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b%6]) with mapi id 15.20.8857.026; Wed, 9 Jul 2025
 16:48:01 +0000
Date: Wed, 9 Jul 2025 12:47:58 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Kris Van Hees <kris.van.hees@oracle.com>
Cc: Alan Maguire <alan.maguire@oracle.com>, dtrace@lists.linux.dev,
        dtrace-devel@oss.oracle.com
Subject: Re: [DTrace-devel] [PATCH v4 1/7] cg: move get_member() to dt_cg.c
Message-ID: <aG6dPiH9HFhmFrc1@oracle.com>
References: <20250709144700.20591-1-alan.maguire@oracle.com>
 <20250709144700.20591-2-alan.maguire@oracle.com>
 <aG6Yn53shYZn9gVI@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aG6Yn53shYZn9gVI@oracle.com>
X-ClientProxiedBy: BLAPR05CA0020.namprd05.prod.outlook.com
 (2603:10b6:208:36e::23) To SJ0PR10MB5672.namprd10.prod.outlook.com
 (2603:10b6:a03:3ef::21)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR10MB5672:EE_|DS0PR10MB6197:EE_
X-MS-Office365-Filtering-Correlation-Id: 84d02719-76fe-42cb-395b-08ddbf085e1f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?JGiA1YFF/JaDdgHrhJcJ50i+AVNN2SSWKJnD9deddjlsKP81nm/QSgk9zszm?=
 =?us-ascii?Q?TIxLDi3313oD7PnQNRFMFYl+gHblhgONuvgm9wWiaFYTEswM/OrmuB/JuSG3?=
 =?us-ascii?Q?C+hJulvcSzPI5UB7J06EY+wpGwJuKMH4ZmWnEX59VtYg2dRU/zB1h0UWcvZ9?=
 =?us-ascii?Q?axie9QxqwSSOrXr0PbpHy0ogpptnoaPMKjoKVg6gDM1A2XUQuCPjo/co8DRL?=
 =?us-ascii?Q?Di3XH/lnrtOXfWEJC2plwlLlit2MMwfxflYRW6hUPckn5o9t+BPB3/qzhUd1?=
 =?us-ascii?Q?H/qVY+MVJ3dbKxWOiRRq+4eZldKd84owo2y32vGdiIme/ladoq4gt/4Gz4n/?=
 =?us-ascii?Q?yVTwIyXAd61druRzrjeRf0tze5DUaUaDETJXn0hAFT9h4QQat3bbH7RqNUDI?=
 =?us-ascii?Q?4YXFyvIzDaWayrQbUJrBbiuF+cZaeeGc+07H1oUYB/ojy9wf7bqgJJmH7HGS?=
 =?us-ascii?Q?Y/ZI3/IaPmoTCCdz1fKf1Ubio2SALO8Z7uBZZponywuf3iUV8+YrMNDDJ8Sc?=
 =?us-ascii?Q?4y+HMY1j0zVyb7ign4IkZaFM6wWYJ0SN0lhkvOEy+o58XriO18dNYR2GGHBt?=
 =?us-ascii?Q?k/NHaFOS8W2oclD25U0O2CxwkFKlvD9AEV5xFojJQ6sCKnheBB1YD2xysOyr?=
 =?us-ascii?Q?4yM7GtGjmHnhMamZV/8+7HCirEF6lp4fZCAZRcIv34Zr05OUD0MbfOQVq4cR?=
 =?us-ascii?Q?FG9Qx+HqkjsRxHtZWYJROzCtoK7EgXkpnPdnEh6JhecUOVeP0md9BJsoNdKy?=
 =?us-ascii?Q?Rn/sTSI3Ax8ptC5LIQJUcgKjUO1SZnyefCNtyglrslw/6+AWli6jaAEFYvZC?=
 =?us-ascii?Q?k6JA03ieBe6UWj1c35BZJ8PQx+KL34R6TsKlKZ6J7QriSsSSt7wMrlIyN9jK?=
 =?us-ascii?Q?8DNVTeV3p9sQlp9Ivmaa7lU6HfhoA+FAMBf8ZoczTosfIOUA8Q+IXOaPfNNb?=
 =?us-ascii?Q?gtJXq2pUnRYqkbS/cEH6tmKRLx+Vdwbhi5+cEsCufuUTzGdhTT3llm0xUHsv?=
 =?us-ascii?Q?GFIfFmDABVkDTXMvRYBlBocfgFu9kLuL5z2/3K21csWU6H8b73EP3wU7hxcR?=
 =?us-ascii?Q?hc5KffWc4f+FG7groBJkZKNi1QSQSGRc4l8nnj4f8jTjkMszFZiPmVGYmeIe?=
 =?us-ascii?Q?P0eAxBS5TKpMnERURQVtYzYsz7t7gJcPW1Tvc64fDpLMODBhHZxVFLkg73kX?=
 =?us-ascii?Q?T9Iy4oJXMQ8tWeOaAMBk2Cah5Ao8LjJC7/fzqJ+60IZ40bGxmCSoa86WVMqC?=
 =?us-ascii?Q?wFxNVe3bs4if1OBPtt3xHqMvLT3k3yv2fQ9hKV4lHCtMg13Ga5+lNPa1/J4M?=
 =?us-ascii?Q?4oZNW9Ufw73W4Q3aU+1n7aMQcqWKkJD/CNuW0UyWeZQECT+OKgMXDWCNslFO?=
 =?us-ascii?Q?azrbddySfey7VnMpj+YEy/RSIJyHCKnTYpjqzv2QNhpVoa7evPE2CvRh2Lmo?=
 =?us-ascii?Q?scR+5jXnnzM=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR10MB5672.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?OZ6k8VRd2pCOIrM83nV2T3ci8lUzrwgcOc7fBsZjaknyFHnL7b/fS5mU39IM?=
 =?us-ascii?Q?Ez5darqyCI0OdkF0bEGkGO2hwSMxvoorZgsngrExMb9OGWn/Mb8hPc89P69/?=
 =?us-ascii?Q?gz/HkPHrRDCyBnANyWVGzT5LOZi6ofUaaQsWdQ6WVBRTEGDTUZeFMKASg6wK?=
 =?us-ascii?Q?0LVRFj+s2KfL7VrdZ8dtPhaZ6kRbPmGFuO+ZEzyaqUERmjS351rYvhzBva5m?=
 =?us-ascii?Q?2C3GYA0gYQY1B8MQiOJwwTF+BTGG707jdxJie2rJ+5lxuFlSvCUJLiSOQpLY?=
 =?us-ascii?Q?Mi6/WsBZI7cJ9Z5uL0d26AzihL/eFaX1yjzOgkZcBc+Qe9VEz1B96pw8ptua?=
 =?us-ascii?Q?pJBQYu8rbk10BOXml55tnuL2OPGzP/1RT7iDXO39cbO47F97qJI3zDiwUhma?=
 =?us-ascii?Q?xRgQG5Kn0gpXR26h0Q4udGtdXdqGQDt3Up34J4TgETftwUGjsBzdwKcCdh8f?=
 =?us-ascii?Q?zkwGKARIHYa6SlQlvvVcl/8tO827JDU5V65GTg2bBDNw0ZrR2/9N9LRepmiK?=
 =?us-ascii?Q?bf6gE9gtZWroGXgtoU/PIbwExwg3Tndx7CMbBMbm3trdRiTKm6c/gKoZN7EH?=
 =?us-ascii?Q?51UoAgRdL0d/fQc7GY8BdrH3bxtB2bUw1gRGJsHcbMLCLrtnx1f9xIIpyrwg?=
 =?us-ascii?Q?MFW4/nP1Qw14TbDwGELdPqc7ABs+GZfgi3kxBVOW5QkziYYWeCtQdyQGTSe3?=
 =?us-ascii?Q?2tUB7CQy1MIwPzuQEJBQuxCGD1yLWqbcvXlZMvi1yEekrzPyg8szaT4dZfYb?=
 =?us-ascii?Q?VQT0TElYdmNjYogB+JR9qXEJ7ViuqDvtglyswEnoDjYXgh4JSGs5N13CabMP?=
 =?us-ascii?Q?+tg34g61pLWLWG2T+Qy6WUuri8EW4LP5QZTPxqRC8CKOY9GoYGmTZ4Wk0rU/?=
 =?us-ascii?Q?UkCoGtMAGM607jV4md4TznAAtAkzXSDbeOv0Uo4njklQyKUJALfN1Olzg58r?=
 =?us-ascii?Q?4Ymd6unxEbEGb3Et8Qe8WnwUhkuvjA7FMsaGDMWNMIbtaAgkFy4vVFaCuxZJ?=
 =?us-ascii?Q?qMvgem1wpWt2y7/HdpoBfrwoNkqhM1EC9Mkmn3CrW1Jo00pU/FyG7/ahkh7q?=
 =?us-ascii?Q?rsKx2LaBeH7SAoz2F6PTcRygRxVMYzzM8MEAvxBZmFwvv/BKm/A2EnexP/ga?=
 =?us-ascii?Q?uvUKL2D/1zb4TuGOLvT2fOka2tIR3v/pmEu4fEFgsmkcLHFv+ILb5ye7K861?=
 =?us-ascii?Q?BpzoTcVB2EMgRM9Il/RS5MLbGuhqcJe0/z3JIBLDFKt2okYgFR5ihS4ZnvS1?=
 =?us-ascii?Q?eHWrAagWAFJsSHtyaCPGA9O3L3ECjhPCe8Lqv53EWPY0nwMEAZNL6TciNlt8?=
 =?us-ascii?Q?Mg51a82L6bAC2kHl15BfrUr00wkxPmEOKkXNj+Unag8CzQzVvwbNntXqZe3P?=
 =?us-ascii?Q?oMhccQCUixd68DXfDsDDQcr/8MY7BetnE1wM11Z77QzJwd8wduqZC91aCpKu?=
 =?us-ascii?Q?vExGIAz7iIz9X7igq5aJeAGEnXREMkyOZs9wN3cGzfKliGFjOsDlDCJ5tP/c?=
 =?us-ascii?Q?fGiJpVgkW64QkGwJcoT9pWcwdw5mnGJMvM2wBpLTAoqXSp90jz/YnTLoniLO?=
 =?us-ascii?Q?4JRN27X0FtIIRYcPnyWf6Ca1ryXJGU+IVdEkjZM3A6VrfftIopoqKC4hF0Jc?=
 =?us-ascii?Q?Dw=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	tJoKXqRWZh0wuJ0oR4ZmEUvT1kYajixMQSo49mL9MJh6/K45+qJJGw0fMar8XR0AdzOPpH6Vi0bQnjF63r0e214RhXIHBOzZT1A9w8CPvEg31iAeL2qnZoBmyKrG9rYn2bq3C7HzorH1TKkk0O+czW2AqkUdkEq/qPtDoLD9h0Sa5pbv9Cg143CHszY9oiBb0Dn7srYNKxmpzEnmL8ET3od8wjbXTQp+hse3xsRW78sMz4pPYvdisuBTdRodwXSZiOzdZ5Ah4B78fG6HwBq57NrY56hA4nqwrMnkZS4fWk+SsUM/8mjlAsgsk39NjBVK2qx6dYLvSXsYKEClHh3Di2SxVAbIH1428JVGh5oaTqG8qOX46qYT0J8TQBloIssLhLnm3xoNEY58js3SyG8Ulkl++HvwX/D/tyL53MUjkY0HEKLeIPKea9RucFCORdzhnc10D7VN3gvsSPIOKLOWgb/1VbajMR8Q3iabClfzzs36DCFAPQ4ZNNPrQgCxIVYpno/Oiht8+AvuV9OxhtAcGxUqyvQDvIztZjN21svO/ClsZhy1ulF+qV6rXTgXVOHnDZTXVI2lCAdPJcJJX2wZHWzyCLYdBaPqXzjE/+g9flE=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 84d02719-76fe-42cb-395b-08ddbf085e1f
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR10MB5672.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2025 16:48:01.7049
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hl+8Bpn255Ngr+8IVWmt8k/RKOmk//zEovLJ0U29s4mFrr+LSQ58SdCTfbynnx1xjsk2Gz4HBDOOPodIULQdaPt17ZU8/zfSE+elQ6WNNE8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB6197
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-09_04,2025-07-08_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 malwarescore=0 mlxscore=0
 phishscore=0 bulkscore=0 mlxlogscore=999 spamscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2507090152
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA5MDE1MiBTYWx0ZWRfX0v7NL8DTUrbh /00ojHISIThqRR5bgDrEYgXs7VfRCVFGgBBeRQCFgys2ADid2wIs5B3d2CI7cXCh+vods8uDTr/ auR+q6bZMVv7Rbar0UtK7cjggzuogErCLHph3qetKyxxHSI0hN5OiCyIxJcr+PhLRUdalPrzv+S
 LiNCTclYxTDBk2civ+zPgBhwylIvAJWorli1GY1LbUvp8RFdIX9gTvVdQxsRc+4tuhuAGEMJ/c+ /nQ5q/rPNyDdFAozBHojPntK9I7VydNUVs9D06AhjZdoSO6ThMIrDMqerj/gF+FY7Mmwjx/iGsL tCEjcSF0WnEQhAOSrCujDTgLTwlj/TsTtO2XWrDqPNBHJV1tqEDaG4z3zbRQ816oKypNVMgOhlo
 lDtdKoGGxBH9QMPACwEoda9lCqbCIFFbo1xjpFFTGn4wI6yYMcFvIUGYWarXWs6eQIwUL1mA
X-Proofpoint-GUID: IhgnBphwoZDgg6_Vgu5XMLMBZR0tR6cT
X-Proofpoint-ORIG-GUID: IhgnBphwoZDgg6_Vgu5XMLMBZR0tR6cT
X-Authority-Analysis: v=2.4 cv=ebo9f6EH c=1 sm=1 tr=0 ts=686e9d4f b=1 cx=c_pps a=e1sVV491RgrpLwSTMOnk8w==:117 a=e1sVV491RgrpLwSTMOnk8w==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=Wb1JkmetP80A:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=fYTK-zj-QH8inAFsP6gA:9 a=CjuIK1q_8ugA:10 cc=ntf awl=host:13565

Woops, one more.

On Wed, Jul 09, 2025 at 12:28:15PM -0400, Kris Van Hees wrote:
> Some comments below...  Sorry - I got distracted by the other patches and
> failed to give this one attention.
> 
> On Wed, Jul 09, 2025 at 03:46:54PM +0100, Alan Maguire via DTrace-devel wrote:
> > It will be used by both dt_prov_ip.c and dt_prov_tcp.c.
> > 
> > Signed-off-by: Alan Maguire <alan.maguire@oracle.com>
> > Reviewed-by: Eugene Loh <eugene.loh@oracle.com>
> > ---
> >  libdtrace/dt_cg.c      | 39 ++++++++++++++++++++++++++++++++++++
> >  libdtrace/dt_cg.h      |  2 ++
> >  libdtrace/dt_prov_ip.c | 45 ++++--------------------------------------
> >  3 files changed, 45 insertions(+), 41 deletions(-)
> > 
> > diff --git a/libdtrace/dt_cg.c b/libdtrace/dt_cg.c
> > index bd0763d6..d6fc8259 100644
> > --- a/libdtrace/dt_cg.c
> > +++ b/libdtrace/dt_cg.c
> > @@ -1901,6 +1901,45 @@ dt_cg_ctf_offsetof(const char *structname, const char *membername,
> >  	return (ctm.ctm_offset / NBBY);
> >  }
> >  
> > +/*
> > + * Retrieve the value of a member in a given struct.
> > + *
> > + * Entry:
> > + *	reg = TYPE *ptr
> > + *
> > + * Return:
> > + *	%r0 = ptr->member
> > + * Clobbers:
> > + *	%r1 .. %r5
> > + */
> > +int
> > +dt_cg_get_member(dt_pcb_t *pcb, const char *name, int reg,
> > +		 const char *member)

Why is dt_cg_get_member() returning int?  Nothing looks at it anyway.  ANd
with the change to use dt_cg_ctf_offset(), compilation error will be repotred
from there.

> Given that this is meant to be used from trampoline code (where we currently
> do not do register tracking - i.e. we expect the code writer to make sure that
> no collisions of register use occur), it probably should be named dt_cg_tramp_*
> rather than dt_cg_*.  That also signals people looking at this that register
> allocation is done manually, and with care, so we can expect things like %r0
> getting assigned a value here, and that we expect that the passed in reg is NOT
> %r0.
> 
> > +{
> > +	dtrace_hdl_t		*dtp = pcb->pcb_hdl;
> > +	dt_irlist_t		*dlp = &pcb->pcb_ir;
> > +	dtrace_typeinfo_t	tt;
> > +	ctf_membinfo_t		ctm;
> > +	size_t			size;
> > +	uint_t			ldop;
> > +
> > +	if (dtrace_lookup_by_type(dtp, DTRACE_OBJ_KMODS, name, &tt) == -1 ||
> > +	    ctf_member_info(tt.dtt_ctfp, tt.dtt_type, member, &ctm) == CTF_ERR)
> > +		return -1;
> 
> The dt_cg_tramp_get_member name would have me assume that this can get me the
> member of any struct, not just those defined in kernel modules (or the kernel
> proper - which in DTrace terms is a module).  So, if the intent is that it can
> only use structs defined at the kernel level, then the function name should
> probably reflect that.  If not (and that is what I would prefer), then this
> should do a lookup for DTRACE_OBJ_EVERY, like e.g. dt_cg_ctf_offsetof does.
> 
> On that note, perhaps it would be easier to extend dt_cg_ctf_offsetof() to
> take another (optional) arg to put the ldop in, populate that one if a ptr
> is passed to store it in, and then use that here?  Because you are essentially
> doing the same lookup, you need the offset, and the size, and so the only
> extra think needed (that dt_cg_ctf_offsetof() could provide easily) is the
> ldop.
> 
> So, I think dt_cg_ctf_offsetof() could become:
> 
> dt_cg_ctf_offsetof(const char *structname, const char *membername,
>                    size_t *sizep, uint_t *ldopp, int relaxed)
> 
> and instead of:
> 
>         if (sizep)
>                 *sizep = ctf_type_size(ctfp, ctm.ctm_type);
> 
> it could use:
> 
> 	if (sizep || ldopp) {
> 		uint_t	ldop;
> 
> 		ldop = dt_cg_ldsize(NULL, tt.dtt_ctfp, ctm.ctm_type, sizep);
> 		if (ldopp)
> 			*ldopp = ldop;
> 	}
> 
> and then the dt_cg_tramp_get_member can just use:
> 
> 	offset = dt_cg_ctf_offsetof(name, member, &size, &ldop, 0);
> 
> instead of the lookup above, and the dt_cg_ldsize() call below.
> 
> > +
> > +	ldop = dt_cg_ldsize(NULL, tt.dtt_ctfp, ctm.ctm_type, &size);
> > +
> > +	emit(dlp, BPF_MOV_REG(BPF_REG_3, reg));
> > +	emit(dlp, BPF_ALU64_IMM(BPF_ADD, BPF_REG_3, ctm.ctm_offset / NBBY));
> 
> This would use offset.
> 
> > +	emit(dlp, BPF_MOV_IMM(BPF_REG_2, size));
> > +	emit(dlp, BPF_MOV_REG(BPF_REG_1, BPF_REG_FP));
> > +	emit(dlp, BPF_ALU64_IMM(BPF_ADD, BPF_REG_1, DT_TRAMP_SP_BASE));
> > +	emit(dlp, BPF_CALL_HELPER(dtp->dt_bpfhelper[BPF_FUNC_probe_read_kernel]));
> > +	emit(dlp, BPF_LOAD(ldop, BPF_REG_0, BPF_REG_FP, DT_TRAMP_SP_BASE));
> > +
> > +	return 0;
> > +}
> > +
> >  static void
> >  dt_cg_act_breakpoint(dt_pcb_t *pcb, dt_node_t *dnp, dtrace_actkind_t kind)
> >  {
> > diff --git a/libdtrace/dt_cg.h b/libdtrace/dt_cg.h
> > index 81b79399..36f587d3 100644
> > --- a/libdtrace/dt_cg.h
> > +++ b/libdtrace/dt_cg.h
> > @@ -44,6 +44,8 @@ extern void dt_cg_tramp_epilogue_advance(dt_pcb_t *pcb, dt_activity_t act);
> >  extern void dt_cg_tramp_error(dt_pcb_t *pcb);
> >  extern int dt_cg_ctf_offsetof(const char *structname, const char *membername,
> >  			      size_t *sizep, int relaxed);
> > +extern int dt_cg_get_member(dt_pcb_t *pcb, const char *name, int reg,
> > +			    const char *member);
> >  extern uint_t dt_cg_ldsize(dt_node_t *dnp, ctf_file_t *ctfp, ctf_id_t type,
> >  			 ssize_t *ret_size);
> >  extern uint_t bpf_ldst_size(ssize_t size, int store);
> > diff --git a/libdtrace/dt_prov_ip.c b/libdtrace/dt_prov_ip.c
> > index c4a3a6e2..37f91e3d 100644
> > --- a/libdtrace/dt_prov_ip.c
> > +++ b/libdtrace/dt_prov_ip.c
> > @@ -62,43 +62,6 @@ static int populate(dtrace_hdl_t *dtp)
> >  			       probe_args, probes);
> >  }
> >  
> > -/*
> > - * Retrieve the value of a member in a given struct.
> > - *
> > - * Entry:
> > - *	reg = TYPE *ptr
> > - *
> > - * Return:
> > - *	%r0 = ptr->member
> > - * Clobbers:
> > - *	%r1 .. %r5
> > - */
> > -static int get_member(dt_pcb_t *pcb, const char *name, int reg,
> > -		      const char *member) {
> > -	dtrace_hdl_t		*dtp = pcb->pcb_hdl;
> > -	dt_irlist_t		*dlp = &pcb->pcb_ir;
> > -	dtrace_typeinfo_t	tt;
> > -	ctf_membinfo_t		ctm;
> > -	size_t			size;
> > -	uint_t			ldop;
> > -
> > -	if (dtrace_lookup_by_type(dtp, DTRACE_OBJ_KMODS, name, &tt) == -1 ||
> > -	    ctf_member_info(tt.dtt_ctfp, tt.dtt_type, member, &ctm) == CTF_ERR)
> > -		return -1;
> > -
> > -	ldop = dt_cg_ldsize(NULL, tt.dtt_ctfp, ctm.ctm_type, &size);
> > -
> > -	emit(dlp, BPF_MOV_REG(BPF_REG_3, reg));
> > -	emit(dlp, BPF_ALU64_IMM(BPF_ADD, BPF_REG_3, ctm.ctm_offset / NBBY));
> > -	emit(dlp, BPF_MOV_IMM(BPF_REG_2, size));
> > -	emit(dlp, BPF_MOV_REG(BPF_REG_1, BPF_REG_FP));
> > -	emit(dlp, BPF_ALU64_IMM(BPF_ADD, BPF_REG_1, DT_TRAMP_SP_BASE));
> > -	emit(dlp, BPF_CALL_HELPER(dtp->dt_bpfhelper[BPF_FUNC_probe_read_kernel]));
> > -	emit(dlp, BPF_LOAD(ldop, BPF_REG_0, BPF_REG_FP, DT_TRAMP_SP_BASE));
> > -
> > -	return 0;
> > -}
> > -
> >  /*
> >   * Generate a BPF trampoline for a SDT probe.
> >   *
> > @@ -142,7 +105,7 @@ static int trampoline(dt_pcb_t *pcb, uint_t exitlbl)
> >  
> >  	emit(dlp, BPF_STORE(BPF_DW, BPF_REG_7, DMST_ARG(0), BPF_REG_6));
> >  
> > -	get_member(pcb, "struct sk_buff", BPF_REG_6, "sk");
> > +	dt_cg_get_member(pcb, "struct sk_buff", BPF_REG_6, "sk");
> >  	emit(dlp, BPF_STORE(BPF_DW, BPF_REG_7, DMST_ARG(1), BPF_REG_0));
> >  
> >  	/*
> > @@ -150,11 +113,11 @@ static int trampoline(dt_pcb_t *pcb, uint_t exitlbl)
> >  	 *	skb_network_header(skb)	=	(include/linux/ip.h)
> >  	 *	skb->head + skb->network_header	(include/linux/skbuff.h)
> >  	 */
> > -	get_member(pcb, "struct sk_buff", BPF_REG_6, "head");
> > +	dt_cg_get_member(pcb, "struct sk_buff", BPF_REG_6, "head");
> >  	emit(dlp, BPF_STORE(BPF_DW, BPF_REG_7, DMST_ARG(2), BPF_REG_0));
> >  	emit(dlp, BPF_STORE(BPF_DW, BPF_REG_7, DMST_ARG(4), BPF_REG_0));
> >  	emit(dlp, BPF_STORE(BPF_DW, BPF_REG_7, DMST_ARG(5), BPF_REG_0));
> > -	get_member(pcb, "struct sk_buff", BPF_REG_6, "network_header");
> > +	dt_cg_get_member(pcb, "struct sk_buff", BPF_REG_6, "network_header");
> >  	emit(dlp, BPF_XADD_REG(BPF_DW, BPF_REG_7, DMST_ARG(2), BPF_REG_0));
> >  	emit(dlp, BPF_XADD_REG(BPF_DW, BPF_REG_7, DMST_ARG(4), BPF_REG_0));
> >  	emit(dlp, BPF_XADD_REG(BPF_DW, BPF_REG_7, DMST_ARG(5), BPF_REG_0));
> > @@ -168,7 +131,7 @@ static int trampoline(dt_pcb_t *pcb, uint_t exitlbl)
> >  	else
> >  		emit(dlp, BPF_STORE_IMM(BPF_DW, BPF_REG_7, DMST_ARG(5), 0));
> >  
> > -	get_member(pcb, "struct sk_buff", BPF_REG_6, "dev");
> > +	dt_cg_get_member(pcb, "struct sk_buff", BPF_REG_6, "dev");
> >  	emit(dlp, BPF_STORE(BPF_DW, BPF_REG_7, DMST_ARG(3), BPF_REG_0));
> >  
> >  	return 0;
> > -- 
> > 2.39.3
> > 
> > 
> > _______________________________________________
> > DTrace-devel mailing list
> > DTrace-devel@oss.oracle.com
> > https://oss.oracle.com/mailman/listinfo/dtrace-devel
