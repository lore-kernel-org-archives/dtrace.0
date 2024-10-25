Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8152E22B64B
	for <dtrace@lists.linux.dev>; Fri, 25 Oct 2024 02:40:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729824032; cv=fail; b=krJ7fDRZtNHXw125b9sDIu+58qmGV7YzKJH1BwI4TmNfYROG+M7vXepXunsMVGbNp6g/wgFmeybjkMLG2lmWS36Bq2otOVXhIoacIWu+aSVSWLk69PrMLiSF2BLnfYkMSalkDctt4qEUJCNWhCxbZOMe9Z9Ih8nrfr3+HS/X62A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729824032; c=relaxed/simple;
	bh=Nq94eRdmryearFghl2kc2GCC2C+vCRYNP960kXUk4Hs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=cXa/nQB/Ip0lmzibfa341QAwVcqCzLHFceWILPBFlMkE+86d82kviR1tru+Ccp8tHj1EpqWrGbSAQMVW2bgKBn0r/5KFPkdPrPpWCUU5fVO2lRs4HW1dKqbEGnlBnVK79tKYSzKY4Yqaqk9gWNM3wBpUlpWPWubuC2lGT6XKCjM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=EAqARkIW; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=NFyheGr7; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="EAqARkIW";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="NFyheGr7"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49OLMY1w014708;
	Fri, 25 Oct 2024 02:40:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=g/LhJCq/gUpQD7zNuZ
	fLrYhqxuubJANGj/b9+5ngalg=; b=EAqARkIWuRbAW3lc9bno8VLXelIFZMzCcB
	9UbkrZUMkMdhtunFArjmB+b9xe3/iFQ2ihH85vHdbiQWz3dLHr1vHMjgtBUrZPch
	ZIuBuc0xYVJJFPMnBtahgnYarGlIuw7rE8UNwZ4c7Tt3YotLsvNlGPb6PKbuZA61
	YW0EzeFUlq7h2v3o89iQTg81SX9mW13CRXjNXio2QR4zdqLvqDgfq5orSYs6Vdu7
	syqZrOpFduKDn9owd/SmWOZu/7IcZBIvO93GYPLFQFI+48CBFYU4L9ORtXqQpQ8k
	YeVR0V+xFhbrZRpM2I0gb5qi/BQWzCFPS45PAK1vykrmfKjVKqCg==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 42c53uv0ss-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 25 Oct 2024 02:40:28 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 49P1tNiE027087;
	Fri, 25 Oct 2024 02:40:27 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2043.outbound.protection.outlook.com [104.47.66.43])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 42emh560m9-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 25 Oct 2024 02:40:27 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iexOXZvedGtOratDpKKEtvy5foB1bYGAraAeuL3WjYzBQc8cLDZPuEDb9viVJFFFWunxYlkyshxzPCnjMDeBbteLdGuyEnrIQej5BJyVNlVdP668LKuc+Rw+xjacWNVJxlg0mlL5wMoavLPmIH2Wbk9bFoZ9h7sPKu96Fgx/2qEEVz5RTjZCfUzKLXdfzpU7ueMdpXH+CzF0JJpwfQWxa9IDLs1VoitusmO095eMAN3sZ/WP/zaM22SVI7uTGdH8Z5RkXTpS0IudrNU+G17vPJ0fw89q8Kbwkd08WY5fnig2oxhCmv4jEiB8S1jKDzdfIRN5c8xdGqpQRG4TJET06A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g/LhJCq/gUpQD7zNuZfLrYhqxuubJANGj/b9+5ngalg=;
 b=O2YuRA608xaCT6UP7k6mlf0sLFv/Tzz8fyZlYT2OQuQ1Vub69wuZeEzhkCg45Rx44ALpdy48VmDKMtDy9TTjNRDhsTFyrtdUVXQKS1LjR+N8lQPxBuBUvk5UhR335NO1kp5YgGzR2XSdA3HlVLwPb5s+0UsqXIb5/4n8Frk6Z9/5TPJk/hluQeCRP2FM0q3Dz/oWbRvd1tz8jTMJBfIDkJF77hthHgiEmqz1uDIfk0t22oyzKXj0Hhr02v+Dh7B9gMon6o1rb0kmNHH/8sQe9E49l9GxYDXzTyqQYCL1JQwQ9dOvjV9kRYmlbSmuyB5dtWM8yfELzFNk/gSBECR61g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g/LhJCq/gUpQD7zNuZfLrYhqxuubJANGj/b9+5ngalg=;
 b=NFyheGr7I54zU7VsMcgF8T2hwcYS0wGfWUoQuJSbK4dS8rPHxoRTS4dl7FYG0G89Q1McM0t/NbGcuIt02mz+sGpPqXokS2NAg24JKSmwRx+L9TJug5Yh1v9NXpRz4TJm+JUv6c19U6A3/NL5pzdiYAXXiRYMOJTAWySw16nugQk=
Received: from CO1PR10MB4769.namprd10.prod.outlook.com (2603:10b6:303:98::16)
 by DS0PR10MB8176.namprd10.prod.outlook.com (2603:10b6:8:201::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.18; Fri, 25 Oct
 2024 02:40:24 +0000
Received: from CO1PR10MB4769.namprd10.prod.outlook.com
 ([fe80::6801:f7c:753b:5a82]) by CO1PR10MB4769.namprd10.prod.outlook.com
 ([fe80::6801:f7c:753b:5a82%6]) with mapi id 15.20.8093.018; Fri, 25 Oct 2024
 02:40:24 +0000
Date: Thu, 24 Oct 2024 22:40:22 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Nick Alcock <nick.alcock@oracle.com>
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com, sam@gentoo.org
Subject: Re: [PATCH 05/14] probe: get the size of the hash-lookup key right
Message-ID: <ZxsFFkZt2Gzgrspz@kvh-deb-bpf.us.oracle.com>
References: <20241024113758.182050-1-nick.alcock@oracle.com>
 <20241024113758.182050-6-nick.alcock@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241024113758.182050-6-nick.alcock@oracle.com>
X-ClientProxiedBy: SJ0PR03CA0148.namprd03.prod.outlook.com
 (2603:10b6:a03:33c::33) To CO1PR10MB4769.namprd10.prod.outlook.com
 (2603:10b6:303:98::16)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR10MB4769:EE_|DS0PR10MB8176:EE_
X-MS-Office365-Filtering-Correlation-Id: d0cb48bf-71c9-4f61-e679-08dcf49e6092
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?RGDWec0bFXXu53bxvYdaGf4XpoggmHTZutcnVUysYZ+3s9A/PlpuENT45Lwe?=
 =?us-ascii?Q?8ASOWS6/35O/QER/KztEezIbOReIljCGKzQJ2NfuIN2LI1vRe7alYNMcOnWl?=
 =?us-ascii?Q?5Tz7uwrz1suXcsHUdE4+/pL9tfTGMo06FTWqg+JA+y8bbpWh+tp8FI1naLI5?=
 =?us-ascii?Q?phVxJBX4/kBk9JlxL8Hp80d2gvMAkyU2JMG4BsuNJ/2qOiluv9BSP/cYljwP?=
 =?us-ascii?Q?QpgJ7yc8rfQyIzegtmye7C5ISUqoO+tZUEnUfh8wA+FjuIWz+HA5rJLz+DQz?=
 =?us-ascii?Q?1ohFhgKR8tyRN1t8qBaPqTDztWVLWqS9K1Dcndzy40mZgXhoHLLOxr4zmQcv?=
 =?us-ascii?Q?2NQXjomXY20CtJqYvwRyjtJAd5aFRzLfw/+3f232OLAW5oQKRUweV0THd6ba?=
 =?us-ascii?Q?w7hxYUbeTbOpghdUU7B+n3eq9wHxlsmLPG0wOsdUE0wlW6BAIO1p9Y8nDuIA?=
 =?us-ascii?Q?+ukC9WGi9byHeUI1WBo2YcR9AF4vNLcyeYbWdFMv3LIrIKze5Us/elUWKxpl?=
 =?us-ascii?Q?mvnYGlnt0MA3MXiK91iVyHNyA2aANs4ibQRsswmE34GUnKXFFg0f9ogoUNAu?=
 =?us-ascii?Q?n80mVZ8QAPs4UTFY6MChTJw3BFI/GtIe0LuRTPJrspIl+zHw27RFiGWmuVrZ?=
 =?us-ascii?Q?vaAyr/z2XmEEBertYEeLd/d1D/MplcRjG447KBwao2TKHzUKpow77VRrqz/o?=
 =?us-ascii?Q?cMrmxsN/xPDHyZ0kW7ooKd0XZw+kAa0rm7ssXIjypAQM/FmVt7jDzy5K/qdQ?=
 =?us-ascii?Q?sqqpXHSP4fE77iz4J5UWxuQg6d1RPdtxfKVZ/PBWaVCQvLlRyPBlFPD3EtUD?=
 =?us-ascii?Q?jEPmiWNKOQeUwYq6w5pJJWlV3z45NH+IlmJIVX34hGeYf8YqjyXn6kb4hznR?=
 =?us-ascii?Q?Tm4l335hFimucHqrgUggTPSXhjFPaL1X7BcJgPiX2ipyCDyjkL/oj1qyCnc4?=
 =?us-ascii?Q?d/Bxkol1PSmOCRUw5HzNyMTQeeQL9U7T2pAxljfTzpqM5ZqwR8GF6O173wbn?=
 =?us-ascii?Q?9n1zlejvTWIE6CLGS9Mh3wLdU5UsZKcOBS8Z+w1MIMUS+k32isH12tEUp3EU?=
 =?us-ascii?Q?g10uE6JtihpLFpOn8LCZZUVvy9dR99KXz+vMX2MAvFsnvw54gJRUBNPlWKdo?=
 =?us-ascii?Q?TK2mnQl64z7EKzv0ZDbPEsinYxObUOTXsZs1b+N5yN7w0YcnQE9XKDQJBLp2?=
 =?us-ascii?Q?IJKKZJhrj01GvwJuzCtyYBqf2W3h1ZEB/TxtgLS0biuQRcBtbeNb++vME25g?=
 =?us-ascii?Q?RI30SC9ufoFEayqYWkEi?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR10MB4769.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ipU4hbHYbTpJX6XLifEGlfINPHs/GaoudtHLJeIXODLfeSuOGHRcpRhKgWeT?=
 =?us-ascii?Q?+X6la3HYCRxD1WGruwTAJb5fTny26MyvlAQMl+ZM9crpumBc9fTNDvPqap7p?=
 =?us-ascii?Q?0kAUTxWGQH2bugkiOYwPWay5zhJcZtskOWkU4SgPQLiQn1dqBTmp3x+6YQIn?=
 =?us-ascii?Q?zlLhiFzLhVGF7RfZZuRG4Yv9Zj0hPg3pA97tMyzxPRlTexR8QA4vF5sYPT6M?=
 =?us-ascii?Q?uJmaHmKG1B2y97/ZGJyMuHHQg7sCppmlAx+TotDf3O/UiSlkt5urcS6IJFv6?=
 =?us-ascii?Q?nruGC1R+66PbH3VwOOgSHQzDaRmrLwfP1EOlobVKBZ4Hz0zdWQ6cDur688XF?=
 =?us-ascii?Q?hIeJTeAtPay3zG1MA1KuXKqbMz5VZoYmB9eAy9P9sbFURMCxklM/Feove39n?=
 =?us-ascii?Q?l5CCWqzu9SRLoJND9AlI36Gm0/OiuXZnC0g/aITh9ROLH2eRhxUG4SLXk0Ja?=
 =?us-ascii?Q?u3WK0LNI5SS+XtQ3n9DvkUFpu+vWvO7c8KAyzmR5Ux+uaGo7s83VsEMTzsBB?=
 =?us-ascii?Q?FcVv+2tQxt2y3gwmjbhJxTKnGouQdt6wLJzdBK6Ts0kW+9ldfAxtAfcZnQaN?=
 =?us-ascii?Q?MOnK4vKDWb/nKawXQCDpE+4uq8PVeON6GwU8SkeOd9SXkg0ejmYDZAbM7Uec?=
 =?us-ascii?Q?YEPvu3osQkius+E4URoWzEfyeaQAUN9jT9H5d0H06UZi1LTjB5JCiLN8A/Ej?=
 =?us-ascii?Q?CG0iUi78e7lzgzKAPNE6hNtCmUsaMF8v4ZzHi90YKCtaw1n14DB9ldXb0q9G?=
 =?us-ascii?Q?buwvRAU6+aL0atUhOebEYig27qWnOetWPOliCKUU9+SiKw0fvTQJglnpK+hF?=
 =?us-ascii?Q?7IGSP9jJCDXnk7jcH7eKRn2+bSjwMckpOhXdMVqFfq9jZlwlLen0TMJRZwgU?=
 =?us-ascii?Q?MNNROcTu2vHu3DNaV7N2S3JqZxKiiwxukk64sSycyjA62oMxrTwBm5ut65QM?=
 =?us-ascii?Q?SnkZEwDabAaEqbQP3X+bqhW5rYD1rQtXJO0EldQYXGAIcIlqjJAIDTCvX2QX?=
 =?us-ascii?Q?S2W+hLtzAQjmLA4wXSUAlg5n81k7L6QKce2pTY1/KC+wlC8zlkM3e25DagpP?=
 =?us-ascii?Q?KxMZdPRPXFALIlcPia+miIzFQVe45lxrTfOG3P7r3XwwnANGpuBl0K/w8TAB?=
 =?us-ascii?Q?4ihGhLbHaXq5jeQ1OWRnzpF4GJfc72oQlTDh41KK/0RgQSVYTK1TCWvdYJTf?=
 =?us-ascii?Q?JmR37KXlxzKbUR8Y+iJ1tGypXShp87OvzxtVSR7D7qT+kL9L//VRt+qNwWj1?=
 =?us-ascii?Q?jA9Rd4ns0vTyYEZinno2iEebDMhGD00PJC7E8ZLeRiLk9HVI4P9YGdCokPTV?=
 =?us-ascii?Q?4oBAPUiuTg209jkGRZ9BTvPV6+bHiGmXfxW8hc8tb0C/HE6QoegfIR1aRZqH?=
 =?us-ascii?Q?s8AJR+B5150C2OiajPAz/JAu0gE/xouz3+VApklL15CBTP59QJufsFJJpYIQ?=
 =?us-ascii?Q?CCK1C/jcyy/nA2NIvDRZMiDKPZ7y8b1nccCcpyMOBdOGxsrKArQ/IH/PthVD?=
 =?us-ascii?Q?25Gni4c4Obadn9+Kff/NHPtEmHclZBPegl4QI7XcWhDuacU4nhpnYH5UOXgI?=
 =?us-ascii?Q?6S4O0jwRPIqFz1hI87SgBpyygExd5NMxMh84MBCinL4mLMnTiXJsRafgl23X?=
 =?us-ascii?Q?5Q=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	BLIW9umOphWwkYNyyjVmQy1RX/WRVAL8d54Kz4VOC0/wGO3W/7tqJK/MqhSsK96rOxCOT5nUjSXj+Emdn0Sue1IiWqu8l01chHpWcoGTrRmMQZ4tfhPIv6/Vm+6hgdOhHk3V+vpANM6LtVXZFA9WJCi7A85+mGDjBiU4As6QVj3lCH4MRe7qwGSkrJPCw+m+D6V9CSRDYEzYQrZCPBbepm/bgaPiQ11ClMn/dkfcpejJtkJRRDiozdjQSPt/TMAEMuDQ5FWl4gKW0ypD7yyABqN9fOkvVhlIrwaLGpLtsF7xtvKZK23M6WTCaoyDIukl1zte3GojRsc69cimilD0/l9DnjmRMPy6n/tKeXcoeiUwH/AAsMWYLDeygcjeb2bzTK8xUtPFVarw057vWMSjIDT+e0ExJ98dagSBgM1NRsvQEiiZc4YerPNrT+YVi3+1urM/ZgvXwuqbLb77rRAr2y1tZYTtrlGeJ0YnPxlunzCk+JbEolG7f+ySsPCutaCktryh/+8A2jqPxInQgh0DeuOVwaLo1v17xjIS9rClsA4Xjpskt2BvUFboC9CkT/8jlKXtSzadhIH56g8O3doBCFeUngHa8NTEtautegYuwhM=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d0cb48bf-71c9-4f61-e679-08dcf49e6092
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4769.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Oct 2024 02:40:24.2976
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KIOcYq4X+BnCpD+8HgCyNW1RGfWdY/zHHheydFSdyvci8zwius/7+9DZp78/iq/ild84xHmzUUWogofrW9jgi4gDDADOtNPs4iMySusqzY4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB8176
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-25_02,2024-10-24_02,2024-09-30_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 phishscore=0
 malwarescore=0 adultscore=0 mlxscore=0 mlxlogscore=999 spamscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2409260000 definitions=main-2410250018
X-Proofpoint-GUID: ovgeojOlzkZ5LMsI4lg1bkJW2ggvB_dZ
X-Proofpoint-ORIG-GUID: ovgeojOlzkZ5LMsI4lg1bkJW2ggvB_dZ

On Thu, Oct 24, 2024 at 12:37:49PM +0100, Nick Alcock wrote:
> This was allocated with alloca() but then snprintf()ed with a size of
> INT_MAX.  This makes _FORTIFY_SOURCE rightly unhappy.
> 
> Passing in the size we actually allocated is trivial.

Except for the fact that dt_probe_keylen() and dt_probe_key() are only
ever used from dt_probe_lookup2().  So, getting rid of those two functions
and rewriting the call as shown below seems to be a much better fix.

> Signed-off-by: Nick Alcock <nick.alcock@oracle.com>
> Bug: https://github.com/oracle/dtrace-utils/issues/78
> ---
>  libdtrace/dt_probe.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/libdtrace/dt_probe.c b/libdtrace/dt_probe.c
> index 686e2a661253..bb1773ee60d4 100644
> --- a/libdtrace/dt_probe.c
> +++ b/libdtrace/dt_probe.c
> @@ -180,9 +180,9 @@ dt_probe_keylen(const dtrace_probedesc_t *pdp)
>  }
>  
>  static char *
> -dt_probe_key(const dtrace_probedesc_t *pdp, char *s)
> +dt_probe_key(const dtrace_probedesc_t *pdp, char *s, size_t len)
>  {
> -	snprintf(s, INT_MAX, "%s:%s:%s", pdp->mod, pdp->fun, pdp->prb);
> +	snprintf(s, len, "%s:%s:%s", pdp->mod, pdp->fun, pdp->prb);
>  	return s;
>  }
>  
> @@ -204,7 +204,7 @@ dt_probe_lookup2(dt_provider_t *pvp, const char *s)
>  		return NULL; /* dt_errno is set for us */
>  
>  	keylen = dt_probe_keylen(&pd);
> -	key = dt_probe_key(&pd, alloca(keylen));
> +	key = dt_probe_key(&pd, alloca(keylen), keylen);

Better would be:
	if (asprintf(&key, "%s:%s:%s", pdp->mod, pdp->fun, pdp->prb) == -1) {
		dt_set_errno(dtp, errno);
		return NULL;
	}

>  
>  	/*
>  	 * If the probe is already declared, then return the dt_probe_t from
> -- 
> 2.46.0.278.g36e3a12567
> 
