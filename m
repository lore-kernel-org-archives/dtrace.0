Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBC3823BB
	for <dtrace@lists.linux.dev>; Mon, 22 Jul 2024 00:02:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721606540; cv=fail; b=NJBHis2TWWWFiZTIw7C1OtdRG9YsOIOqu5RnVYSg57+WU2I8zaqKybmjsKkk5hUKWJi82VOlWUIBsTg9xUozv9Zna631Hut+BM+nD5XBaNla0bGl8L8QTg/s9avwXAJeafaaxePxDidau966zwrugn6MdjsbnsOgIEBKm9e4kRE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721606540; c=relaxed/simple;
	bh=mv3nDinMkN6U/8+esG2CMydu8Hpm/VuoqYlBQyJx/CA=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=iZQjmIQUdGl2MhmSxIzrb8bdjYXgwKLDSSZxONhhMEqiyaTlnaXshSiuSbn3WHA0LpmRmxZHd6yDeGtvwWsaprvV+KZ+rQvgw8xmf0o+QuwqB3rLwIXgY5U3whVg1Es4Ma/4tbLZ1v2VFEpMznl8kyU+mVGNLgra2672sBltKVw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=STnP3tgi; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=w52+h/OC; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="STnP3tgi";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="w52+h/OC"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46M00lRQ031299
	for <dtrace@lists.linux.dev>; Mon, 22 Jul 2024 00:02:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	from:to:subject:date:message-id:in-reply-to:references
	:content-type:mime-version; s=corp-2023-11-20; bh=bCZyqlPX9RSapx
	Mrlz5iSkYwOymxKadVmkb6jpGmllg=; b=STnP3tgiRFPPJysQwtmtRjnPsuVok8
	t4lWRNc3Nto8Wf5hf7olHr0P+yXO80e35C2KlLEoYI4rzkjXmF4C2hDLgz/s8hNm
	J5ouVaXQkZoInHlCEgHq6bD8QIxDG9tkRJQ7ciDRo1xC1i+1WjCl4jpRHMoMawwc
	qfZHMyzM465ph0mdWA60xvn7YgwsF4fDgP7hJPMBs9hdqvRtxX7LwdbEOHRDU5SS
	1tMTh6fdIfWD0YUiuRv1CjwSySV8WYJmmyc3svVF1znkMRu81FT+e5RezfVYxcRZ
	Oabl4tQkfbG++SJI2nOnLMLAFZkrLhtXu1byV96Y+EO3Vh0R0CAbQzkg==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 40hcghg0nf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 22 Jul 2024 00:02:10 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 46LNDLJ9016642
	for <dtrace@lists.linux.dev>; Mon, 22 Jul 2024 00:02:10 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2100.outbound.protection.outlook.com [104.47.58.100])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 40h27j905h-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 22 Jul 2024 00:02:10 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lzv5qag03jY3THcVu9rKJ5lJ/+IIbvmyB9NMC86RA6k1ZsFZ4cVwb4TnMIFxXrOauvjSNie8ASPwSPNJpf4tpehhCOE2enC4elpKgFBO/EAc5TYh957D7eZHDmDNxBO3aW83/lT00ga0qe60qj+MvcwmhxL+3kcjWxgRC5jiIYikgB+77/p4lsNTny+PHMMhg0EaE7Rq85YbDAZS8zIHn265bt/LhwmzNjQY2wrAOqLY1rQkVJjQYltDbVM26cDASEBqZwut2/gQPCjOy1ok7OSMsdDu/u+yzwYKxEFW7QHBG8EUnvwVTVE1arhTkqg3Wp/8XcwFIQewL1p1JSrOsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bCZyqlPX9RSapxMrlz5iSkYwOymxKadVmkb6jpGmllg=;
 b=Q+vKqYcJCnCZ/87W0dWdkyhl9GWQUiHMzhPcLL0/VEkeeP9vFbJmmpLVClhgNginrWIXQ3bw8+JdYgXnLv0G7UeILm8FaLgreMBko4v22wfzvgjfPT2AxYGa71yzFdPzjJP09tCei/CNArNaHx9/RAkGW0NNCAQY1H0ecr012Zxh5RYGrl0LGIzWfmNOVi9uPR2OUB/s84lz7uoiHHEezJsU19I69OkZj4tCR4gfSqtdchF6Li3ndwY0P4fFV5APA7FrwlAPdWVIz6pgWVB+tjNulrnKPexGRZQrrBgwxnAqrS9OTcQteIJvCEaoePDNnfEDvZwN4NG2bJhQDris9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bCZyqlPX9RSapxMrlz5iSkYwOymxKadVmkb6jpGmllg=;
 b=w52+h/OC90iCeHb37IZoZKd0TnASGVCmccwseYKEtk91UdfZLlf0XzJGqW9yl8agtbB7EM/IF8c9BG14glcbko4OFFP0deTGzoog6bXWAuQi/Aw//wg8C+x163IMqvE2m03ZWP8RWbHNfCcVy5Pc3Jhd6c0t5okE6NNgBeY5E5k=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by IA1PR10MB7357.namprd10.prod.outlook.com (2603:10b6:208:3ff::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.20; Mon, 22 Jul
 2024 00:02:07 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%5]) with mapi id 15.20.7784.016; Mon, 22 Jul 2024
 00:02:07 +0000
From: eugene.loh@oracle.com
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH v2 25/38] test: Clean up tests still expecting obsolete "at DIF offset NN"
Date: Sun, 21 Jul 2024 20:01:59 -0400
Message-Id: <20240722000159.29840-2-eugene.loh@oracle.com>
X-Mailer: git-send-email 2.18.4
In-Reply-To: <20240722000159.29840-1-eugene.loh@oracle.com>
References: <20240722000159.29840-1-eugene.loh@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0185.namprd03.prod.outlook.com
 (2603:10b6:a03:2ef::10) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|IA1PR10MB7357:EE_
X-MS-Office365-Filtering-Correlation-Id: 7631fbbc-8e83-4fe9-21b2-08dca9e186c2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?e+G4LcRHRsWNLJsD/yJBodxd5lE+D9RncmIehI0DYYrr+al+5mSTj2F5CEvz?=
 =?us-ascii?Q?nb7aBQ7a4+QzyKJbZzzy4ZQmn0YKmr77ixfuMOkidKWlltrFwYs0VhurdFOb?=
 =?us-ascii?Q?pFGRSyYw51QMQ2i1y0AIo+C1K+yz1unk9i1hWfnt9uART9ETmjnj5CluTcgH?=
 =?us-ascii?Q?RZ6BBEoiN4B/HnSstqr+/CVSos7gYszoPWH/5ENwbXWghMTJyxtdByLPeRlD?=
 =?us-ascii?Q?d7F2cqtvZllyCnLanWXfW/PnyBMTthluLMSMB2xS9RwRRD8/Gf3WENtoUSFT?=
 =?us-ascii?Q?YakVVi0ezaQeteESFsKY1R9rhaidtqcm9GmW9wAQHQRx3rL/vit69cSw4vhL?=
 =?us-ascii?Q?XS0yrSuGFvCaJhwj4j69wlIDSY6MZcvH4JryTFiEXlDXfg85U+N/QRg4yOeI?=
 =?us-ascii?Q?zXvIsWEvRPfu+IUbyEFMP6a0lhoETBpRbDq/v1gBT68zgsPqTBBYh1yrnlaq?=
 =?us-ascii?Q?Fyx1NcDkZTrfiVqgHYopFh3K+5YxjB+GlqEi5mlYatlruZjpeDpX1kG+zHso?=
 =?us-ascii?Q?NXaVG0HT1p0znNGdYUZ3yq8ZyhqMTxLoD1YX3C55nVZDd+AwODNnPaqZRptS?=
 =?us-ascii?Q?EHWF+fnzcrDFNQUUMpnY9cT6gtb1xuMUV/MnKz3FLAvghN865lnF/PVmiyo5?=
 =?us-ascii?Q?2ZffxqZUMShBrbvzmfexjPUkemg2ZJ/T4TsOMsl4yxjNyps6JrgHd1CVVRl+?=
 =?us-ascii?Q?vb6AJeDG0ECtCtVc3+UbrUDyYyGlXIZSAJW9goUVDFjFDzVdLRLqoSuiKijN?=
 =?us-ascii?Q?LAEVuOqM9Uy23bxSRYYtZWqUzDRerO2eFgUzi7rtQ+m5iAhJmHh/ZCJuou4m?=
 =?us-ascii?Q?ejyY4j5AWe0berEDUjImsM98vIiiZbje9pKz3AupyAw4fMO2SDqwHX676UXZ?=
 =?us-ascii?Q?lFRGqKj+nHkSymgCnYbHMQIhZGHbMMttryr5Bt9bvnE92TOXfufS2cs46FND?=
 =?us-ascii?Q?1EGlpjAb1SDYl+1mVOkn8RSnU5jDIivr2lBE2zpFPsN3q8uNuq2pk7t6fW7i?=
 =?us-ascii?Q?idmJS45teACThSvkpVtkeAB+zAXY4cT45k9n8xY3/8WYmIlmbrY8HnECiCq5?=
 =?us-ascii?Q?xb02q4U0RleYDJ/sbYMDYFK7wR17WN8vLAlc3M/ZZs/9ig9fkEHA9MSxLfuR?=
 =?us-ascii?Q?9193/cPSI1EoSm363+Tw5DhgtopflqXrjKA6NHO2gGoUxnjzcVQW+9KvurTH?=
 =?us-ascii?Q?4JsHnCx2vZcJARY1CPCfQiXDHe7Fdt7MuR0jUxePpEIXPEhuETmQj6/h6gyH?=
 =?us-ascii?Q?C1WVlo8VkdjMvgacaEK4tEa3AOgJgd/yZ1+d8QrYeiLQvzs6k5aHLkwYTYVW?=
 =?us-ascii?Q?kwj0qKGAa5JTzhgb0ywGBetBFlpFQZNlUDLTAjG74tkdJtG+XC8lNrscipgv?=
 =?us-ascii?Q?pVnBgiM=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?onoQL8R/9+f/Am7BUmGjt6VIw7jTiO9vAOxPTU2qxvjIQhxnGW4DygkwVw4w?=
 =?us-ascii?Q?eDrMdhS9hV6NRcwQ47GazR2LJi+ilkYAjNiY9w+Zgxbw+qcuqyntljXPgGcI?=
 =?us-ascii?Q?XrI4cTuFWJI+k1l3TDIsf5V48Nu1p5UMXOiQsB9DgWa6aYwZa9sRaRcPhufE?=
 =?us-ascii?Q?86dCH+CRGw1ONiwuBtyS//TI/ul4E1uz6+djwOdOTXDd8uMT/1LAvyhm4pUb?=
 =?us-ascii?Q?8YY+zg0QuBt1emteK6v2FBtenGxagbY3Q8lgnhs4e5a6dyY1Y5DsrptbdnnL?=
 =?us-ascii?Q?C1vCPId2AjhdjkMS7ra8vGF6icmTEQ8KNjecDxNkIEGbJY3Z6NGU5tmgkGcM?=
 =?us-ascii?Q?MJgc52sYVUUIMpY9J/73NemOAJ1lSnfjlgHWKVqVNSPK9HUGay2r/+cvPiQl?=
 =?us-ascii?Q?3wqjPW1ih3NUnN9lO1qkp1bfFBdc//HIKyxW8ohr2CMI8Jd1M+The+V/eUuT?=
 =?us-ascii?Q?nj/gUJe9tIWSmij2EZic86y+B15iq/PU4hGk0HcHig3wrGX6pqlcZP/raz+N?=
 =?us-ascii?Q?qgE4W68x1Ng+BegNWPB/Vw8jmz643doDiBQ5XRUu/cWJAqsZvzoiRFZSs8Rz?=
 =?us-ascii?Q?fuhUlowySUvLyxeGe6db9UYfdlQ5venrrvJtE97GOvR7lQTbEGSH6HdW0bHf?=
 =?us-ascii?Q?lx9U3CMfQ4SJALuc4RyXtVaIVSITghN3EEoz16SKXjDta/p0XDSPwlsvLoiY?=
 =?us-ascii?Q?L/4kBQpur1Rphc84z0zYBkbasclCQLgUOT3j+2E7cqOOpf/Uo++k6pPK+85E?=
 =?us-ascii?Q?iKqSYyeK01zgTI4aOQ43IZOKDQz7ppYg+GQ8YCmAyZjl0f93AKvloz4xCYDy?=
 =?us-ascii?Q?NRjHoLrn7Mpq5IVo1M7BPSx6amkMC6nnjaAItaijVZnjvaLkqdaDIPlBCR2d?=
 =?us-ascii?Q?lNpkJFhABZnZTzfY1q77FSDFOcazSXRN/5hl7iKcaWxtHRt3PEV11OZozHCr?=
 =?us-ascii?Q?jKplCEecAtSXHRpFcp9ynmPUoOrakTTWvMvjon2ThhfqZZR9P2xecgaMTPKn?=
 =?us-ascii?Q?5++WnerQBsoNILbLXrC6P+vR93dlfT+aRpbM/rgJvtoIpF4bLFRQIZOkc2RS?=
 =?us-ascii?Q?Q+KFQBxM1qcShZfx3z2ib/1ekSxqZwgaGBa8sMmwzqldAv/1TqmA5hQ8Ks+n?=
 =?us-ascii?Q?qtl1t15Kx4aBZHbiXIBskjTe5VvEK2g9tDaiJrELldowk/CYSupAiSWGCsgc?=
 =?us-ascii?Q?B+bC8KCeTRlvexYhtv+4g+xHc6RW1OAeZz91F1VVahUim7tFQDhRr5+4+5/W?=
 =?us-ascii?Q?3OW6v+3yRntfo1XBRQxOw9SO1O9c02yzRORLN08VIBUHHtpsez9Aw0ZUDkXd?=
 =?us-ascii?Q?vvKtBdeHaFf3eToJ8f6nYtwlorZu5nIcyxehTCcPQDO1Px3h2d+EiDaTIht3?=
 =?us-ascii?Q?9YJzXys5NDBp09iydpRNxLlyxrDqqWBamrYRM46llYDpz16EFXwacuvw4oNw?=
 =?us-ascii?Q?pcRIzp3vKr/FCgo21sR9NWRCjDIQYI3f5/roPKezl8B+ynreX3dcYUs0V/+p?=
 =?us-ascii?Q?IQLzVrCerKz11+6O1jBf+yk+Tfg1F6JLEUcP46a9DqtGuDa1eVEibSOr9Xn3?=
 =?us-ascii?Q?UxxuDERwL7n7FtS7eDuPUAVJos4vvm35fSk60G/O?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	0c7xifZcNp1JYu3tpKXcSYGbgw3nDtDbQG6exu8rciEez18DUNmOKE3EcJ85jfNBDzbnlwO0jAFfQRfBIduSN2sgMSXK2+pZr2P2/ISDRuwOOxFcWhSUmDtUlTJU1B6JA5UtiwO55q5r11XhWsXEPYBWJI9/NqVItGpjT7HtBKjxcV1s9YN0ww3frqW21/O1Wri/MIzm+rwLI0IbKPO9rwZbyISbedwZbRisDgHoTcQRgvs81JPmHjs7tEqkAIZdHB6c+zIhbqfCV0a3veVNHK98SwE6/2XjkfCdy6C9Z9V7s+pPEniPMfqIo+WJzeXgbBS+Df6+D4SgL401WM02CRpG7kRrVNymXkd9Rhk4oU1QFotPX02ol5K/mx06DZGe/s06MkbsnSkIupAYKxU5a5twRh2xSTzrDzySCkDqMNWnmJxjSN5es3uMcU1EOpVZIzi8rXSPuLW86Eleid4+zQOLZSOYnSH7zB7/mYrfdeZ3WuatZ8XVWMXpKc9tcfl+2WSC4bKMSycZFXtERBQYioyf2FhbnKbAmVrc7ex8onAYanj4JYEVJzkhhiTJXa4OoFfDFWbSAosL8Xoo6EG3K28wCGApRcWlwv6psGKP5tc=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7631fbbc-8e83-4fe9-21b2-08dca9e186c2
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2024 00:02:07.4066
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZzV4NFxGdA4gkESG4Dol8gDV13iQkWdgALtvBmjNoePrbbJxNb/iyit0JEBHzZSZrhdZaqccwXTlqMRLIV/6zQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR10MB7357
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-21_20,2024-07-18_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 adultscore=0 phishscore=0
 suspectscore=0 mlxlogscore=999 malwarescore=0 bulkscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2407110000
 definitions=main-2407210189
X-Proofpoint-GUID: _QSej-8zdgRZdK9kOIA-5JKbGwBcwGyh
X-Proofpoint-ORIG-GUID: _QSej-8zdgRZdK9kOIA-5JKbGwBcwGyh

From: Eugene Loh <eugene.loh@oracle.com>

Also, the numbering of EPIDs has changed.

Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
Reviewed-by: Kris Van Hees <kris.van.hees@oracle.com>
---
 test/demo/dtrace/error.d                                | 1 -
 test/demo/dtrace/error.r                                | 2 +-
 test/unittest/assocs/tst.invalidref.r                   | 4 ++--
 test/unittest/drops/drp.DTRACEDROP_DBLERROR.r           | 2 +-
 test/unittest/error/tst.DTRACEFLT_UNKNOWN.d             | 1 -
 test/unittest/error/tst.DTRACEFLT_UNKNOWN.r             | 4 ++--
 test/unittest/error/tst.DTRACEFLT_UNKNOWN.sparc64.r     | 5 -----
 test/unittest/pointers/err.BadAlign.d                   | 1 -
 test/unittest/pointers/err.BadAlign.r                   | 2 +-
 test/unittest/pointers/err.InvalidAddress2.d            | 1 -
 test/unittest/pointers/err.InvalidAddress2.r            | 2 +-
 test/unittest/pointers/err.InvalidAddress3.r            | 2 +-
 test/unittest/pointers/err.InvalidAddress4.d            | 1 -
 test/unittest/pointers/err.InvalidAddress4.r            | 2 +-
 test/unittest/regression/tst.DTRACEFLT_BADADDR.d_path.r | 4 ++--
 15 files changed, 12 insertions(+), 22 deletions(-)
 delete mode 100644 test/unittest/error/tst.DTRACEFLT_UNKNOWN.sparc64.r

diff --git a/test/demo/dtrace/error.d b/test/demo/dtrace/error.d
index 5700dd33..d55fb090 100644
--- a/test/demo/dtrace/error.d
+++ b/test/demo/dtrace/error.d
@@ -5,7 +5,6 @@
  * http://oss.oracle.com/licenses/upl.
  */
 
-/* @@xfail: dtv2 */
 /* @@trigger: none */
 
 BEGIN
diff --git a/test/demo/dtrace/error.r b/test/demo/dtrace/error.r
index d894776b..d3904f47 100644
--- a/test/demo/dtrace/error.r
+++ b/test/demo/dtrace/error.r
@@ -3,4 +3,4 @@
 
 -- @@stderr --
 dtrace: script 'test/demo/dtrace/error.d' matched 2 probes
-dtrace: error on enabled probe ID 1 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at DIF offset 16 at BPF pc NNN
+dtrace: error on enabled probe ID 3 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
diff --git a/test/unittest/assocs/tst.invalidref.r b/test/unittest/assocs/tst.invalidref.r
index b050e436..20f131b4 100644
--- a/test/unittest/assocs/tst.invalidref.r
+++ b/test/unittest/assocs/tst.invalidref.r
@@ -1,4 +1,4 @@
 
 -- @@stderr --
-dtrace: error on enabled probe ID (ID: profile:::tick-1s): invalid address ({ptr}) in action #2 at DIF offset 64 at BPF pc NNN
-dtrace: error on enabled probe ID (ID: profile:::tick-1s): invalid address ({ptr}) in action #2 at DIF offset 64 at BPF pc NNN
+dtrace: error on enabled probe ID (ID: profile:::tick-1s): invalid address ({ptr}) in action #2 at BPF pc NNN
+dtrace: error on enabled probe ID (ID: profile:::tick-1s): invalid address ({ptr}) in action #2 at BPF pc NNN
diff --git a/test/unittest/drops/drp.DTRACEDROP_DBLERROR.r b/test/unittest/drops/drp.DTRACEDROP_DBLERROR.r
index 14654676..9fa54dd9 100644
--- a/test/unittest/drops/drp.DTRACEDROP_DBLERROR.r
+++ b/test/unittest/drops/drp.DTRACEDROP_DBLERROR.r
@@ -4,4 +4,4 @@
 -- @@stderr --
 dtrace: script 'test/unittest/drops/drp.DTRACEDROP_DBLERROR.d' matched 3 probes
 dtrace: [DTRACEDROP_DBLERROR] 1 error in ERROR probe enabling
-dtrace: error on enabled probe ID 1 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at DIF offset 16 at BPF pc NNN
+dtrace: error on enabled probe ID 3 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
diff --git a/test/unittest/error/tst.DTRACEFLT_UNKNOWN.d b/test/unittest/error/tst.DTRACEFLT_UNKNOWN.d
index bfc77bf5..c74762ae 100644
--- a/test/unittest/error/tst.DTRACEFLT_UNKNOWN.d
+++ b/test/unittest/error/tst.DTRACEFLT_UNKNOWN.d
@@ -4,7 +4,6 @@
  * Licensed under the Universal Permissive License v 1.0 as shown at
  * http://oss.oracle.com/licenses/upl.
  */
-/* @@xfail: dtv2 */
 
 /*
  * ASSERTION:
diff --git a/test/unittest/error/tst.DTRACEFLT_UNKNOWN.r b/test/unittest/error/tst.DTRACEFLT_UNKNOWN.r
index 3e7caac4..1e4fdd64 100644
--- a/test/unittest/error/tst.DTRACEFLT_UNKNOWN.r
+++ b/test/unittest/error/tst.DTRACEFLT_UNKNOWN.r
@@ -1,5 +1,5 @@
-The arguments are 2 2 PC 1 64
+The arguments are 3 1 PC 1 64
 The value of arg4 = 0
 
 -- @@stderr --
-dtrace: error on enabled probe ID 2 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #2 at DIF offset 4 at BPF pc NNN
+dtrace: error on enabled probe ID 3 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
diff --git a/test/unittest/error/tst.DTRACEFLT_UNKNOWN.sparc64.r b/test/unittest/error/tst.DTRACEFLT_UNKNOWN.sparc64.r
deleted file mode 100644
index 3944c138..00000000
--- a/test/unittest/error/tst.DTRACEFLT_UNKNOWN.sparc64.r
+++ /dev/null
@@ -1,5 +0,0 @@
-The arguments are 2 2 4 1 0
-The value of arg4 = 0
-
--- @@stderr --
-dtrace: error on enabled probe ID 2 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #2 at DIF offset 4
diff --git a/test/unittest/pointers/err.BadAlign.d b/test/unittest/pointers/err.BadAlign.d
index cd4138ae..e859dd75 100644
--- a/test/unittest/pointers/err.BadAlign.d
+++ b/test/unittest/pointers/err.BadAlign.d
@@ -4,7 +4,6 @@
  * Licensed under the Universal Permissive License v 1.0 as shown at
  * http://oss.oracle.com/licenses/upl.
  */
-/* @@xfail: dtv2 */
 
 /*
  * ASSERTION: This test reproduces the alignment error.
diff --git a/test/unittest/pointers/err.BadAlign.r b/test/unittest/pointers/err.BadAlign.r
index 4328aac4..187543b6 100644
--- a/test/unittest/pointers/err.BadAlign.r
+++ b/test/unittest/pointers/err.BadAlign.r
@@ -1,3 +1,3 @@
 
 -- @@stderr --
-dtrace: error on enabled probe ID 1 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #2 at DIF offset 4
+dtrace: error on enabled probe ID 3 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
diff --git a/test/unittest/pointers/err.InvalidAddress2.d b/test/unittest/pointers/err.InvalidAddress2.d
index 682ad650..b22f08fb 100644
--- a/test/unittest/pointers/err.InvalidAddress2.d
+++ b/test/unittest/pointers/err.InvalidAddress2.d
@@ -4,7 +4,6 @@
  * Licensed under the Universal Permissive License v 1.0 as shown at
  * http://oss.oracle.com/licenses/upl.
  */
-/* @@xfail: dtv2 */
 
 /*
  * ASSERTION: D pointers do not allow invalid pointer accesses.
diff --git a/test/unittest/pointers/err.InvalidAddress2.r b/test/unittest/pointers/err.InvalidAddress2.r
index d866eae1..187543b6 100644
--- a/test/unittest/pointers/err.InvalidAddress2.r
+++ b/test/unittest/pointers/err.InvalidAddress2.r
@@ -1,3 +1,3 @@
 
 -- @@stderr --
-dtrace: error on enabled probe ID 1 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #4 at DIF offset 8
+dtrace: error on enabled probe ID 3 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
diff --git a/test/unittest/pointers/err.InvalidAddress3.r b/test/unittest/pointers/err.InvalidAddress3.r
index 069ee1de..187543b6 100644
--- a/test/unittest/pointers/err.InvalidAddress3.r
+++ b/test/unittest/pointers/err.InvalidAddress3.r
@@ -1,3 +1,3 @@
 
 -- @@stderr --
-dtrace: error on enabled probe ID 1 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #2 at DIF offset 8
+dtrace: error on enabled probe ID 3 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
diff --git a/test/unittest/pointers/err.InvalidAddress4.d b/test/unittest/pointers/err.InvalidAddress4.d
index 1e2b4f62..586cddf9 100644
--- a/test/unittest/pointers/err.InvalidAddress4.d
+++ b/test/unittest/pointers/err.InvalidAddress4.d
@@ -4,7 +4,6 @@
  * Licensed under the Universal Permissive License v 1.0 as shown at
  * http://oss.oracle.com/licenses/upl.
  */
-/* @@xfail: dtv2 */
 
 /*
  * ASSERTION: Demonstrating valid memory access.
diff --git a/test/unittest/pointers/err.InvalidAddress4.r b/test/unittest/pointers/err.InvalidAddress4.r
index d866eae1..187543b6 100644
--- a/test/unittest/pointers/err.InvalidAddress4.r
+++ b/test/unittest/pointers/err.InvalidAddress4.r
@@ -1,3 +1,3 @@
 
 -- @@stderr --
-dtrace: error on enabled probe ID 1 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #4 at DIF offset 8
+dtrace: error on enabled probe ID 3 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
diff --git a/test/unittest/regression/tst.DTRACEFLT_BADADDR.d_path.r b/test/unittest/regression/tst.DTRACEFLT_BADADDR.d_path.r
index be1f6d5b..b5435eef 100644
--- a/test/unittest/regression/tst.DTRACEFLT_BADADDR.d_path.r
+++ b/test/unittest/regression/tst.DTRACEFLT_BADADDR.d_path.r
@@ -1,6 +1,6 @@
-The arguments are 2 1 PC 1 24
+The arguments are 3 1 PC 1 24
 The value of arg4 should be 1
 The value of arg5 should be 24
 
 -- @@stderr --
-dtrace: error on enabled probe ID 2 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at DIF offset 28 at BPF pc NNN
+dtrace: error on enabled probe ID 3 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
-- 
2.43.5

