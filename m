Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F39E52D780A
	for <dtrace@lists.linux.dev>; Fri, 16 Jan 2026 22:03:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768601026; cv=fail; b=YpCYVJydVNmYzSbVXUo5Ng1eXTuvBGqTYY4g2IEase4IUYZXWytqRIgF7uIDmYNw3BZz3s3w93CuubTOyaXjlnXUuiNSyGZ6Q6Tq3S5ulaeLAeJ/wVNbrxPqZEJvk1Oo4v/gqu4N5DwvCoEmD8Q1Eeyui98zu6F/ONEBKYBXnRA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768601026; c=relaxed/simple;
	bh=Sno3UWBjvX6Du9UoQvP4u7o9u0rTYYvJg5bpHz78oco=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=UbUGcUUIxK/xAm2SJ9BqfROfVU5mCgsg15PE30S66TBoTQbKnjNi0EukwaSjkZBMphbHw+Y6tVQ8VBtfiwpcEkCGVUpEAEx6q6o9bvn4TGbhv5s4Qzyyug+nIgYOQ/dqipN8tHonhxaZb05q+6y8RFMkogzJo/Wq2zmzx8nG6Sg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=neEWMqwW; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=DnmC07oa; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="neEWMqwW";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="DnmC07oa"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60GKYqlh3916229
	for <dtrace@lists.linux.dev>; Fri, 16 Jan 2026 22:03:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=Exo+Qx462TiSdql1x7BvGD6NHGUvzHWLPZ3ApDBakhg=; b=
	neEWMqwWKJagR6pCeD7ONXiUqsXAqxD8C+jtOZsOpMVFiK2bmxgnbVgSTQxb21fV
	MEMCp0ZbI6Mr9ifG9jWoHjC4e8qWP56FMKJTKtJ6TJ+9x0eDeZHpSUK85N8fkXgf
	ErBp+vNNtlfZgpHT9xH3T7znLl50ztjHSQYFv+KU0zZw4qUhsfb+pFKvoGwvty/w
	YEruC54m7Gqi+eJ5FZzxBofUY+DnGBP1uzcRKsIWSK2tbKnXe7IvRbI2+WujZ/EG
	K8WnL9YNWCO3Seh3dS5wJorrDEq4QMSVkd726ampKKrcqSUBAEUo0GZUX8tmna4b
	O+9adlW3ytkeNgtsFq8yhw==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4bqvg4r3mg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 16 Jan 2026 22:03:42 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 60GKumdX036358
	for <dtrace@lists.linux.dev>; Fri, 16 Jan 2026 22:03:42 GMT
Received: from cy3pr05cu001.outbound.protection.outlook.com (mail-westcentralusazon11013050.outbound.protection.outlook.com [40.93.201.50])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4bqvtj9x3w-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 16 Jan 2026 22:03:42 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qD96gewac3jQp/RzDbOCVtHG4yw4KGHcviV3LK9G0HOJPgvz7dL8/qIcJcZwsYnLvvZZSn4Wj5ubAoNPVJJtU/H6svJk5Ipy4TF+uGbaSDLZIbNciWi2p9F110jn7wvQHQnjglGj3vPSHxIDaOGbEeWaGGm9CZMw86+U2r9mPzfw9OmPvVQsKVbIYn2mGHKDlVv1wPjGjF2W1FLERnthJUDT6myUfTfGVc1SeYaynLvaRgVsiSVFqG4EI9iBEUhOmBjb0H3Ea/n1y6sK0uNTaYHROP3ceFQSxBEh1JUKIlSPNDLHSkgFSOc/8YZ0sxpmRknGRHwLexSEVIoIYuwcpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Exo+Qx462TiSdql1x7BvGD6NHGUvzHWLPZ3ApDBakhg=;
 b=gxjOPFJHXeUMEGN0JTnUNsiyThTuFZU58ZvBMvnfeRP8VZsbJJtD42vpnNrFi3HYw6MEVn2KATLshlX2Q7nX4hvlxCyhsR6AeY9diY/npx9PN5FFHK+yxHtDg9hM6VNlx8Ms4lc2vJqddrKO+7NjfJcQW5PuBhneB/r0VuMAj/Qatz4L5Ual92oP9iLyysHivNXZA1YAwof1nADJ/5VuqdNamrWRmXZefAEdC+oLoKDNPZJfyEs46XlAkU5xNGLyStcuzV02smKJwnKZBMAfaM6dFznjSL9UjRzJRz+9NIdVV/hAPgOUj1cQkCt0K2tzb9WWTyqNXwFsOXjxWGl6mw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Exo+Qx462TiSdql1x7BvGD6NHGUvzHWLPZ3ApDBakhg=;
 b=DnmC07oaI1ii+76xuv7pYtCD4KqTuWsn/gn59D2XmT352UA4wHGQOlDmsuiQk8KrkYXAvHYJSzvs87Q7tmXoeo4V8yDQx8Q/J98gIdIO20NWnbt0+vBNGeHPYktAyU3zpXe+WjFpBgZp1qyokfXRWfjIyy+f8wNoA2Tu9HV9cI4=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by DS0PR10MB7150.namprd10.prod.outlook.com (2603:10b6:8:df::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.4; Fri, 16 Jan
 2026 22:03:38 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::c47b:6cdc:87b1:aa6b]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::c47b:6cdc:87b1:aa6b%6]) with mapi id 15.20.9520.006; Fri, 16 Jan 2026
 22:03:38 +0000
Message-ID: <172933f0-10a0-6255-0255-abcac898b9f5@oracle.com>
Date: Fri, 16 Jan 2026 17:03:36 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [DTrace-devel] [PATCH v4] test: correct file permissions
Content-Language: en-US
To: Kris Van Hees <kris.van.hees@oracle.com>, dtrace@lists.linux.dev,
        dtrace-devel@oss.oracle.com
References: <DS0PR10MB7522826E8A633859ACE9C676C28DA@DS0PR10MB7522.namprd10.prod.outlook.com>
From: Eugene Loh <eugene.loh@oracle.com>
In-Reply-To: <DS0PR10MB7522826E8A633859ACE9C676C28DA@DS0PR10MB7522.namprd10.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR05CA0110.namprd05.prod.outlook.com
 (2603:10b6:a03:334::25) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|DS0PR10MB7150:EE_
X-MS-Office365-Filtering-Correlation-Id: 75ae0b73-f268-4f24-a9fe-08de554b19de
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NytMN2NuWHo4VnJRcjBxV2t1NE9Ic0lxMDJWM2pJaEZEQ2hZSVdsQnUwNDR2?=
 =?utf-8?B?RklqUkpQUjE3cks3UkVuM01CdTYvdWYxRkExWjc3OUwvNWlPcGJ2T1FqMkdS?=
 =?utf-8?B?ZG5LYWprcXhGNVlXbVhNK3VsNFRWaEF0N1dFaElXR1hyQW15c0I1dmxUb1dq?=
 =?utf-8?B?WVNHazNyUGhGbUJaVlY1U05Mb2VqUjcwU3lCN2swZzV1Uk9yZHcvN09Ia2Ey?=
 =?utf-8?B?RDRpTks3YWc4TVBlU3dFQ1IwL3pEUkZHMldEblhqMXV1T0VTQmtrZjdLUFQy?=
 =?utf-8?B?cy9lMXZpejQvV204ZFJUaXpzdG5MNnp4bjNxTnRMdXRCalBrejZ4enhGTnN2?=
 =?utf-8?B?V2dMRjRMRU5admlSbytLb2VML0orWVI3TXZSY0RDOElhVEU0Z3JDdGxtYkxp?=
 =?utf-8?B?MXZEdDJzbnhzWndoUWhib21oaE8xdlliZ1BiREVlYm1oUDJXeGNoNC85MDg5?=
 =?utf-8?B?USs4enBZSHROc0N1YTJkVEg0alJ2UkFNbVRKY252Y3cvdDdML1NFYmllM3lo?=
 =?utf-8?B?dzdrUG9LeE8vUEJLY2h2bUt4SDg3bk1jMjNZc011KzFyLzVmSFB5UDZjRWtL?=
 =?utf-8?B?YVdOWXdCdWtHbGIzcVF0VW5GT0lQZDJCSXlWOExUVzVxdi9ZQ3lsZ0x1Mm83?=
 =?utf-8?B?Q3lUaFVMTSt3N0dJNkdoeXdCdm9zWmdBdG01SDNUN0FpVjA0TXdPWU51NVBW?=
 =?utf-8?B?aGJLcmFRUW5GQWIrS2VxTGlPcExXRXk3REdPOCthSFhVa01DNVFuVXI0M0Qz?=
 =?utf-8?B?NVdhWDRSSFE1eUo5amhwTDlSTXJtUCtUeVdLTVc4amtQTUY1SU45N3daZ0sy?=
 =?utf-8?B?RmREZFJPWDgzaEJPUm9MKytJTGhMci92NlBpak0vWGlsNTdqQkN1YUxpTTJx?=
 =?utf-8?B?NFpDYWNDMGNRQ2c0UGpMRm83Z2FrcC9KeUtNV0szbkd2YmVNa3BJZlBSanVL?=
 =?utf-8?B?QzhEQkx5TUNTdlU4aFZhVjVGcDBVcDRYaTY5VWJUUGhOeXFXNUFaNGZCS3Rr?=
 =?utf-8?B?V2tLKys5c3RoUE5abDhUK0Njd0x0U3dDOStBTFV1TjRERjhlSEV5Ris5QVVE?=
 =?utf-8?B?RUNSRW1JcHlMUGFDWSs2S2pFb1NWaWZNUVFQeDJlL3FObWFGdkVVc1NXV1E2?=
 =?utf-8?B?Z1FPaGVqTFVzckcxeVdKL21NOGZkU1NVR0hZYnlMVUNXZEJaREo0RVlPL2tL?=
 =?utf-8?B?Mjg5N05JMmFJcFdlc0R0dWpQTEs4SXJNTFd4TkxpSFdGYVBTQ0FsTUEzWDNn?=
 =?utf-8?B?ZXRvNGhsUXZIMkRZZUFGZUNHeStObldGUFJsbEJrSDJPbUpEbWx1TmtCdWl5?=
 =?utf-8?B?ak1ualBEa2U4YVNadFIrQ005MXBoNDJUdW1Gajh4eHozMWQ4em9YQU1PYW5i?=
 =?utf-8?B?RXBJaW9ZeUNSRHlYZE5KY2VDRVRaKzlyL3FSY2ozbWV0SEJJdWl2UXI5UzlU?=
 =?utf-8?B?RXIxeFVGaHZ6a25pM1JUZlFEVkRjbC95VE1ISzB6Q2NVM0RzVTh0ZWJqSTdZ?=
 =?utf-8?B?Z1NWb21qWHJhNm55NUxKMzUzTWdCNnRkd0pVQzFPZGs1c3daRWdQZWFIZFpa?=
 =?utf-8?B?cEh6Rk5YaDg2RlIvMVpGdTAybFpRY1Y3a3BZTjEzZElMR2UyUVN1dENTZ1lJ?=
 =?utf-8?B?Vi9uODRmVFg3NzhTV0IwYXBPOXBuQVlUQWRldWlmM1dyeGhueHBZbEpaaEJD?=
 =?utf-8?B?N2c4ZHhvNStQY29PRzdybDBGR3RLL21wV1RZb0xPUnUwOFBRYmloSU50cyt2?=
 =?utf-8?B?ckx4UmFZVW5KeEw3bmRnSjBUNElva3lNejRtdVRzM203cTNqU01rMXN1STZv?=
 =?utf-8?B?UkN6T0h6N3FSYzROY0RBaUl1aTV5NFRidit4WjVuMEZwQU5YY3BqcElHRHhr?=
 =?utf-8?B?WW5tWTVLN2dlWXdpZ3I2OHJsUVNrS05sa0hpNWkzZUVMcVdNTmI0NnpZUEow?=
 =?utf-8?B?SXdacjM3eUliMHI1TFVudE9xREpORTNhMHB6WnNrZE9WSTlSUjRXaWZ1MFh0?=
 =?utf-8?B?T0FZVW1qUlM3UVdZUEErQm53dkU3a01PTjhEQjNVblZqU3BKWksrZUZURmRr?=
 =?utf-8?B?aCtLSlEwbW9HaFFPRkJRMEUvRnV2ODVrTUNJb2VmZFBPaVRkYklZaU1zUkEz?=
 =?utf-8?Q?Bme8pypOtg6mP5sPHjdalftlt?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MWt1RjlOME9Xd3VvMGkzajR2aE5iWW00VDk3cXFIakpwcDNuaXp5SGRuYldU?=
 =?utf-8?B?SWN3dmVOemJVUHJyKy9lczJUcGxGbHYxOWpiTHlvOUs2bjRhZWhlMlBvSVI3?=
 =?utf-8?B?UkJUbnQ3bWFBYVoyeWo2Y05Fb3ZZQndKNjJQQXVLcW56L2Vnbk9sMHZjeXB2?=
 =?utf-8?B?TTBpS0hFbnp4cjcrMGp2N1FJMnVJdGZFdDVnRjk2eTd5UjAvSzkxZzAzQnN2?=
 =?utf-8?B?VCtuQ0VjV1RqMmJJcStiWE0yY3FsNXMvMHBxYWRTY2d2Q3dvcndhcExiaWNH?=
 =?utf-8?B?aDVkd05SRXBJOE50am1SaS9oWGZzczdrWVRFdHpkOXlwK05zSTNCK1hwdVEx?=
 =?utf-8?B?SWltTURpYnNYQTVHRTMzRzNIaGFhdkJ2MExqTlRyekVoV0RiVzI3bVFWNk8y?=
 =?utf-8?B?TnJoR0lSREd2YUU4bDJqNDVwNUZpcGFiUHVOZS9HOEtwMnRpQTEySHRZVDB3?=
 =?utf-8?B?eisrNXVzZ0xaeFNjRWp1R2xWVFdNT2M3SDJvMzdrOWpFQXJjOGcza1g0U2pF?=
 =?utf-8?B?aEN5eGd3YklkaHYvOFc4U1FSMDYwUTRtV25hczEwVDU3cUJVOUVCYnNmUDhS?=
 =?utf-8?B?TmxDTGtjQ3JOQURQMWhvUjdneHp5Sk5zS0VwWFoxR1J0MGJNMm1ST0dJQU95?=
 =?utf-8?B?ekNLUlNVZHlmS2ZIbittSkdBTG1OdjZRaDlqc200NEZ0d2J3Z1J6S2J3bnly?=
 =?utf-8?B?OGowSXI1d0EycXZ4TVIvYlR3a1VqS3R5azV3b281QmE4QnkzZ01aeWtJWjlI?=
 =?utf-8?B?R2NHWXdYOU1XYnlBMlkrSDJlKzRwVEp0L3hQQmVpMkFPSlBWSE96OENDQ2NW?=
 =?utf-8?B?VkxGeGdSQSt4OGdnNTl0RFlGWC82dVlseHU2VkJQbGRNM2c0c0NydGNjMENq?=
 =?utf-8?B?UnBrZkJycFEvZDV3aEVtQmZ3UWE0eDZaNjBzS2duRVBaaHVYa2tlSzN6MUtz?=
 =?utf-8?B?WWlhL3lJUlJZQmx5RzFYZE9CdnhmNGM2K2s4SVAwOG80UUpMcFVnNjA3dVBM?=
 =?utf-8?B?YkR5djhrcnc4c2tETndJaklLUnVyY0ZZbm9XdEZVcldQeTlhSkl6ejlpbnN2?=
 =?utf-8?B?b3Bhb09LRXc1ck8wVVdVajdmYnBvTFRPRzJrczlQR2JFM3VPdHU2MFZqaExJ?=
 =?utf-8?B?OHI3RE1SdEsvaVdYTWpXRUxPWkpmbnVzdDV2OUQ3ck53aE8rb1FNWjNoaUNr?=
 =?utf-8?B?bVlpZmk1YlVZT3poTHVTN2dXRlRxT0t2ZHhjSEtrYkE2aTA2dndkOVZZT2c4?=
 =?utf-8?B?Tmc5aEtsb216LzRlTnFWNnNkd1FKRXovSnlKbEhuaHArSGlQNERlU2g2c2R2?=
 =?utf-8?B?TDU4SG9Za09TQjdyMC9rSzlTaTI3emlqbDcrVmtZcUpIS2ZKVlNyTkpUVlJ6?=
 =?utf-8?B?eDV6NW5ISzY1ZTI1RCtPUndTV0crWk12aWVQWXlmOXlZZTM1bk12dlhwTU5V?=
 =?utf-8?B?bG5lRTNWYU5yYituQUZOZHppSEhYV2lrRVBra2dHT2FXbk1XYVg2WTQ3Mlhh?=
 =?utf-8?B?L1NOOFZta2tVM0s1NFZaU2g1ZlYzc2tJUVIvRTgwUHR0TUZvd1VIdlhBc2dD?=
 =?utf-8?B?QXg1b3hOMmdSR3NsV0FqQnRxdldSNlRJQ0V1ZTN0aEpzaFJTTUJHMk9iUW5l?=
 =?utf-8?B?VG8yYnB0RTFybGFQeUwwTnRiR01kQ0pxODJuc1hucTRLZkFBWDRJNXpqOUdZ?=
 =?utf-8?B?dDFTY2l5MGJ6cUo5N3M1Q3BsL012VVJkK09na2VzY2grL2FHekVyT0pxZTh0?=
 =?utf-8?B?MkFLb3ZBYXExd1VvVjJOcWNkbHRrTzc3ajIrUTVscW5mTE1MT1I3ajVkMUZG?=
 =?utf-8?B?UENYemEzYUgrWEdzaEszMlBjSnpRRi9hQTBBRkVEYnBtVjhaWG1oSk1za0NI?=
 =?utf-8?B?bFRZOTZXWUhQUWdKd3ZndGZPd3Z1c3B0TWs1S2FYSXF5YmszSHRFd2hsSEty?=
 =?utf-8?B?QjlLS3RrZVBoelpFREFSSE5QQWlMWjlHZG1KTWlYSVA3WHNXZmNlZnBhWHhn?=
 =?utf-8?B?Q2ptVkhyRUJkREZMemZRc0loS05SZi9nejFOOWVlVlVkK3JWSVNaWGQrUG1T?=
 =?utf-8?B?UDNpby9YODlPN3FlWW1qUFljazA1MkNhTlJFYWhRMDkwQzFrdzRJVHJxNDY5?=
 =?utf-8?B?MzVkRnFuMktuMHVvcUxnUElxbXFtajRRMU9WYUZYNlArUHZTOWV3bUh6YnFh?=
 =?utf-8?B?Wi9jVVE1NWpuM2M3WFp1UExaYzh1dVdWZFpKTktrdVp3dDROWEt1NE9kL3Ay?=
 =?utf-8?B?T0VNS2hDSlN5YXozVjBaMjE4ZEdZMUl1OEVGRkQ5RldsWUkwWE15U3IwVEJ1?=
 =?utf-8?B?SEg4TTlDZllEb0dGMk1JYjBlTkd3VFNzVktlUDRTNVNCdDJoUTlNZz09?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	HXV2P0D2H55RMP6xabL3B/1mN6ZoRU6esWTWtc9fBVP2mP6dC8VpK6huNS9doytJ4FGbkU455oACwX2a3E/MUy8rlTIerbb9SVx1Vmcxip3JUHqV2Wdb+z9+Zg7CE7jPYS/qQFpboGIuHKKAA3KZYlFxIdTQjvvmf4GNbEisGFxRAIMlktZmxBa2ebQqqq/7BFJVC89akqjQ+olKAltZXhJleNjhx70HxfjmvdDci/f4tEClb3HEivPK0fkJ4SILKJrqtm7nDvJBby/fZ6VG9lS32NX+Xm98eJ4Q/GwW0Xprto9OydXLSZtvaw6yJuMmBUdAnfT1iNscAvxbFljdFjQOusCtT6XlCBMxoRO9zQAAvbBEJ23dpx17ftbdKT+HXfa2cMVt/pN86AhmD2KMpttvew/UcZFM6GcSVDwqXqmWtX2EVg207KG2fhT1PCAtVKkTYub65Lb+oO+u2lbHH6ULVJC5ROhr28agQiI6CJgVQjw1p5ArHzvJEB5KwPWUh8HLM0plcHUF+e/yB2MAPFbdUEoufjIR0pzpXPSgTfjLnlD8LqIapKHaxKR7NTMYfITG9k4mi29x3t4i3A31wV+RemF5YCu1MFoNgAgPfd8=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 75ae0b73-f268-4f24-a9fe-08de554b19de
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2026 22:03:37.9848
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: M8xvCBOmPdXm2GCQ+sFNVY1gCCXCmIw5eNai2zYKQs1isObJZJJgQIj6IMVWgLr56T8TRQMrUWjWbDH773Jfsg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB7150
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-16_08,2026-01-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 spamscore=0 adultscore=0
 malwarescore=0 phishscore=0 mlxlogscore=999 suspectscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2601150000
 definitions=main-2601160167
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE2MDE2NiBTYWx0ZWRfXzDT7To8i66RK
 Bb5pS0L8mExghScv96jOxF+C0KaIXHvJ5FSy9Xjx4v9CcnHr7kMpVISrWPrii1Rrf0DjJLWnyZv
 t/No+/jsbczEZDvdcU9I0iQzj1xWtxbfbJ4DD9IBn7HWsqfieSpYVczgbo2XfxWq+UKokV7+pqv
 RrgGfY1P0hkoF5lDtYXb/vz352KuYP3VtfDsEcosJs4ABriFkMIgbK+MFBx36hiS9Uc72/Tph7w
 hn4tzo7QdXSglPM6ppReWJm2VJPE9Fsgxv6IsS/W8pXbKiPYRW+F9WD/UsHpKux45NGrMfi+t7d
 2WfULFqpwtETRcayqqj02YRAq8T3z5MDZLL3tFxAAUwhMfd6mhRHxjDchXjoGV8LftBhyghu3g8
 dq8qq2ej7C6AkIcrw2v35GfAqTZupRvUf4lHEpywgtpaOgY5BWNykGgKS7xYk7fAQQDkbe1Cfwz
 sU9prbYqND1kM/rYuVMJwIPUpqfSM+pLcQwrgSbI=
X-Proofpoint-ORIG-GUID: lsScJPkngfJpHucfhYGmx13U_3vlVFk4
X-Proofpoint-GUID: lsScJPkngfJpHucfhYGmx13U_3vlVFk4
X-Authority-Analysis: v=2.4 cv=famgCkQF c=1 sm=1 tr=0 ts=696ab5be b=1 cx=c_pps
 a=e1sVV491RgrpLwSTMOnk8w==:117 a=e1sVV491RgrpLwSTMOnk8w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=yPCof4ZbAAAA:8 a=wDfaLWdfwyLcHxri8RIA:9 a=iv76wg4OxLMjXHVm:21
 a=QEXdDO2ut3YA:10 cc=ntf awl=host:13654

Reviewed-by: Eugene Loh <eugene.loh@oracle.com>

On 1/16/26 16:45, Kris Van Hees via DTrace-devel wrote:
> Various tests had a #!-invocation while still being expected to be used
> as scripts fed to dtrace.  Removed the #!-lines and marked the files
> non-executable.
>
> Various tests that were meant to be invoked as standaline scripts had an
> absoolute path to dtrace in the #!-invocation which was not recognized.
> runtest.sh expects standalone D scripts to use '#!dtrace' so that the
> correct path to the dtrace executable being tested can be inserted.
> Corrected the tests, and ensured they are executable.
>
> Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
> ---
>   test/demo/script/interp.d                                   | 4 ++--
>   test/demo/script/tracewrite.d                               | 6 +++---
>   test/demo/spec/specopen.d                                   | 6 +++---
>   test/stress/fbtsafety/tst.vahole.d                          | 4 ++--
>   test/unittest/lockstat/tst.lockstat-summary.d               | 0
>   test/unittest/scripting/err.D_MACRO_UNDEF.invalidargs.d     | 4 ++--
>   test/unittest/scripting/err.D_OP_LVAL.rdonly.d              | 4 ++--
>   test/unittest/scripting/err.D_OP_WRITE.usepidmacro.d        | 4 ++--
>   test/unittest/scripting/err.D_SYNTAX.concat.d               | 4 ++--
>   test/unittest/scripting/err.D_SYNTAX.desc.d                 | 4 ++--
>   test/unittest/scripting/err.D_SYNTAX.inval.d                | 4 ++--
>   test/unittest/scripting/err.D_SYNTAX.pid.d                  | 4 ++--
>   test/unittest/scripting/tst.arg0.d                          | 4 ++--
>   test/unittest/scripting/tst.assign.d                        | 4 ++--
>   test/unittest/scripting/tst.assign.r                        | 4 ----
>   test/unittest/scripting/tst.basic.d                         | 4 ++--
>   test/unittest/scripting/tst.pgid.d                          | 4 ++--
>   test/unittest/scripting/tst.pgid.r                          | 6 +-----
>   test/unittest/scripting/tst.pid.d                           | 4 ++--
>   test/unittest/scripting/tst.pid.r                           | 6 +-----
>   test/unittest/scripting/tst.quiet.d                         | 0
>   test/unittest/scripting/tst.sid.d                           | 4 ++--
>   test/unittest/scripting/tst.trace.d                         | 4 ++--
>   .../speculation/err.D_ACT_SPEC.SpeculateWithBreakPoint.d    | 5 ++---
>   .../speculation/err.D_ACT_SPEC.SpeculateWithBreakPoint.r    | 2 +-
>   .../speculation/err.D_ACT_SPEC.SpeculateWithChill.d         | 5 ++---
>   .../speculation/err.D_ACT_SPEC.SpeculateWithChill.r         | 2 +-
>   .../speculation/err.D_ACT_SPEC.SpeculateWithCopyOut.d       | 5 ++---
>   .../speculation/err.D_ACT_SPEC.SpeculateWithCopyOut.r       | 2 +-
>   .../speculation/err.D_ACT_SPEC.SpeculateWithCopyOutStr.d    | 5 ++---
>   .../speculation/err.D_ACT_SPEC.SpeculateWithCopyOutStr.r    | 2 +-
>   .../speculation/err.D_ACT_SPEC.SpeculateWithPanic.d         | 5 ++---
>   .../speculation/err.D_ACT_SPEC.SpeculateWithPanic.r         | 2 +-
>   .../speculation/err.D_ACT_SPEC.SpeculateWithRaise.d         | 5 ++---
>   .../speculation/err.D_ACT_SPEC.SpeculateWithRaise.r         | 2 +-
>   .../unittest/speculation/err.D_ACT_SPEC.SpeculateWithStop.d | 5 ++---
>   .../unittest/speculation/err.D_ACT_SPEC.SpeculateWithStop.r | 2 +-
>   37 files changed, 61 insertions(+), 80 deletions(-)
>   mode change 100644 => 100755 test/demo/script/interp.d
>   mode change 100644 => 100755 test/demo/script/tracewrite.d
>   mode change 100644 => 100755 test/stress/fbtsafety/tst.vahole.d
>   mode change 100755 => 100644 test/unittest/lockstat/tst.lockstat-summary.d
>   mode change 100644 => 100755 test/unittest/scripting/err.D_MACRO_UNDEF.invalidargs.d
>   mode change 100644 => 100755 test/unittest/scripting/err.D_OP_LVAL.rdonly.d
>   mode change 100644 => 100755 test/unittest/scripting/err.D_OP_WRITE.usepidmacro.d
>   mode change 100644 => 100755 test/unittest/scripting/err.D_SYNTAX.concat.d
>   mode change 100644 => 100755 test/unittest/scripting/err.D_SYNTAX.desc.d
>   mode change 100644 => 100755 test/unittest/scripting/err.D_SYNTAX.inval.d
>   mode change 100644 => 100755 test/unittest/scripting/err.D_SYNTAX.pid.d
>   mode change 100644 => 100755 test/unittest/scripting/tst.arg0.d
>   mode change 100644 => 100755 test/unittest/scripting/tst.assign.d
>   mode change 100644 => 100755 test/unittest/scripting/tst.basic.d
>   mode change 100644 => 100755 test/unittest/scripting/tst.pgid.d
>   mode change 100644 => 100755 test/unittest/scripting/tst.pid.d
>   mode change 100644 => 100755 test/unittest/scripting/tst.quiet.d
>   mode change 100644 => 100755 test/unittest/scripting/tst.sid.d
>   mode change 100644 => 100755 test/unittest/scripting/tst.trace.d
>
> diff --git a/test/demo/script/interp.d b/test/demo/script/interp.d
> old mode 100644
> new mode 100755
> index be690b56..fba39e41
> --- a/test/demo/script/interp.d
> +++ b/test/demo/script/interp.d
> @@ -1,8 +1,8 @@
> -#!/usr/sbin/dtrace -s
> +#!dtrace -s
>   
>   /*
>    * Oracle Linux DTrace.
> - * Copyright (c) 2005, 2021, Oracle and/or its affiliates. All rights reserved.
> + * Copyright (c) 2005, 2026, Oracle and/or its affiliates. All rights reserved.
>    * Licensed under the Universal Permissive License v 1.0 as shown at
>    * http://oss.oracle.com/licenses/upl.
>    */
> diff --git a/test/demo/script/tracewrite.d b/test/demo/script/tracewrite.d
> old mode 100644
> new mode 100755
> index 0c139ead..f888ecd8
> --- a/test/demo/script/tracewrite.d
> +++ b/test/demo/script/tracewrite.d
> @@ -1,13 +1,13 @@
> -#!/usr/sbin/dtrace -s
> +#!dtrace -s
>   
>   /*
>    * Oracle Linux DTrace.
> - * Copyright (c) 2005, 2020, Oracle and/or its affiliates. All rights reserved.
> + * Copyright (c) 2005, 2026, Oracle and/or its affiliates. All rights reserved.
>    * Licensed under the Universal Permissive License v 1.0 as shown at
>    * http://oss.oracle.com/licenses/upl.
>    */
>   
> -/* @@trigger: readwholedir */
> +/* @@runtest-opts: -c test/triggers/readwholedir */
>   
>   syscall::write:entry
>   /pid == $target/
> diff --git a/test/demo/spec/specopen.d b/test/demo/spec/specopen.d
> index e7dbc3b2..b3769789 100644
> --- a/test/demo/spec/specopen.d
> +++ b/test/demo/spec/specopen.d
> @@ -1,12 +1,12 @@
> -#!/usr/sbin/dtrace -Fs
> -
>   /*
>    * Oracle Linux DTrace.
> - * Copyright (c) 2005, 2024, Oracle and/or its affiliates. All rights reserved.
> + * Copyright (c) 2005, 2026, Oracle and/or its affiliates. All rights reserved.
>    * Licensed under the Universal Permissive License v 1.0 as shown at
>    * http://oss.oracle.com/licenses/upl.
>    */
>   
> +#pragma D option flowindent
> +
>   syscall::openat:entry
>   {
>   	/*
> diff --git a/test/stress/fbtsafety/tst.vahole.d b/test/stress/fbtsafety/tst.vahole.d
> old mode 100644
> new mode 100755
> index b918e663..732ae3ca
> --- a/test/stress/fbtsafety/tst.vahole.d
> +++ b/test/stress/fbtsafety/tst.vahole.d
> @@ -1,8 +1,8 @@
> -#!/usr/sbin/dtrace -Cs
> +#!dtrace -Cs
>   
>   /*
>    * Oracle Linux DTrace.
> - * Copyright (c) 2006, Oracle and/or its affiliates. All rights reserved.
> + * Copyright (c) 2006, 2026, Oracle and/or its affiliates. All rights reserved.
>    * Licensed under the Universal Permissive License v 1.0 as shown at
>    * http://oss.oracle.com/licenses/upl.
>    */
> diff --git a/test/unittest/lockstat/tst.lockstat-summary.d b/test/unittest/lockstat/tst.lockstat-summary.d
> old mode 100755
> new mode 100644
> diff --git a/test/unittest/scripting/err.D_MACRO_UNDEF.invalidargs.d b/test/unittest/scripting/err.D_MACRO_UNDEF.invalidargs.d
> old mode 100644
> new mode 100755
> index 45c37efe..6fcb4d54
> --- a/test/unittest/scripting/err.D_MACRO_UNDEF.invalidargs.d
> +++ b/test/unittest/scripting/err.D_MACRO_UNDEF.invalidargs.d
> @@ -1,8 +1,8 @@
> -#!/usr/sbin/dtrace -qs
> +#!dtrace -qs
>   
>   /*
>    * Oracle Linux DTrace.
> - * Copyright (c) 2006, Oracle and/or its affiliates. All rights reserved.
> + * Copyright (c) 2006, 2026, Oracle and/or its affiliates. All rights reserved.
>    * Licensed under the Universal Permissive License v 1.0 as shown at
>    * http://oss.oracle.com/licenses/upl.
>    */
> diff --git a/test/unittest/scripting/err.D_OP_LVAL.rdonly.d b/test/unittest/scripting/err.D_OP_LVAL.rdonly.d
> old mode 100644
> new mode 100755
> index b51e1160..866a7f32
> --- a/test/unittest/scripting/err.D_OP_LVAL.rdonly.d
> +++ b/test/unittest/scripting/err.D_OP_LVAL.rdonly.d
> @@ -1,8 +1,8 @@
> -#!/usr/sbin/dtrace -qs
> +#!dtrace -qs
>   
>   /*
>    * Oracle Linux DTrace.
> - * Copyright (c) 2006, Oracle and/or its affiliates. All rights reserved.
> + * Copyright (c) 2006, 2026, Oracle and/or its affiliates. All rights reserved.
>    * Licensed under the Universal Permissive License v 1.0 as shown at
>    * http://oss.oracle.com/licenses/upl.
>    */
> diff --git a/test/unittest/scripting/err.D_OP_WRITE.usepidmacro.d b/test/unittest/scripting/err.D_OP_WRITE.usepidmacro.d
> old mode 100644
> new mode 100755
> index a4880cca..9a9d1566
> --- a/test/unittest/scripting/err.D_OP_WRITE.usepidmacro.d
> +++ b/test/unittest/scripting/err.D_OP_WRITE.usepidmacro.d
> @@ -1,8 +1,8 @@
> -#!/usr/sbin/dtrace -qs
> +#!dtrace -qs
>   
>   /*
>    * Oracle Linux DTrace.
> - * Copyright (c) 2006, Oracle and/or its affiliates. All rights reserved.
> + * Copyright (c) 2006, 2026, Oracle and/or its affiliates. All rights reserved.
>    * Licensed under the Universal Permissive License v 1.0 as shown at
>    * http://oss.oracle.com/licenses/upl.
>    */
> diff --git a/test/unittest/scripting/err.D_SYNTAX.concat.d b/test/unittest/scripting/err.D_SYNTAX.concat.d
> old mode 100644
> new mode 100755
> index 8f7b210f..8d6e5f64
> --- a/test/unittest/scripting/err.D_SYNTAX.concat.d
> +++ b/test/unittest/scripting/err.D_SYNTAX.concat.d
> @@ -1,8 +1,8 @@
> -#!/usr/sbin/dtrace -qs
> +#!dtrace -qs
>   
>   /*
>    * Oracle Linux DTrace.
> - * Copyright (c) 2006, Oracle and/or its affiliates. All rights reserved.
> + * Copyright (c) 2006, 2026, Oracle and/or its affiliates. All rights reserved.
>    * Licensed under the Universal Permissive License v 1.0 as shown at
>    * http://oss.oracle.com/licenses/upl.
>    */
> diff --git a/test/unittest/scripting/err.D_SYNTAX.desc.d b/test/unittest/scripting/err.D_SYNTAX.desc.d
> old mode 100644
> new mode 100755
> index 34ae864c..e8ec7851
> --- a/test/unittest/scripting/err.D_SYNTAX.desc.d
> +++ b/test/unittest/scripting/err.D_SYNTAX.desc.d
> @@ -1,8 +1,8 @@
> -#!/usr/sbin/dtrace -qs
> +#!dtrace -qs
>   
>   /*
>    * Oracle Linux DTrace.
> - * Copyright (c) 2006, Oracle and/or its affiliates. All rights reserved.
> + * Copyright (c) 2006, 2026, Oracle and/or its affiliates. All rights reserved.
>    * Licensed under the Universal Permissive License v 1.0 as shown at
>    * http://oss.oracle.com/licenses/upl.
>    */
> diff --git a/test/unittest/scripting/err.D_SYNTAX.inval.d b/test/unittest/scripting/err.D_SYNTAX.inval.d
> old mode 100644
> new mode 100755
> index d3338cfd..d2ae68a6
> --- a/test/unittest/scripting/err.D_SYNTAX.inval.d
> +++ b/test/unittest/scripting/err.D_SYNTAX.inval.d
> @@ -1,8 +1,8 @@
> -#!/usr/sbin/dtrace -qs
> +#!dtrace -qs
>   
>   /*
>    * Oracle Linux DTrace.
> - * Copyright (c) 2006, Oracle and/or its affiliates. All rights reserved.
> + * Copyright (c) 2006, 2026, Oracle and/or its affiliates. All rights reserved.
>    * Licensed under the Universal Permissive License v 1.0 as shown at
>    * http://oss.oracle.com/licenses/upl.
>    */
> diff --git a/test/unittest/scripting/err.D_SYNTAX.pid.d b/test/unittest/scripting/err.D_SYNTAX.pid.d
> old mode 100644
> new mode 100755
> index 01044d6e..1f383dd7
> --- a/test/unittest/scripting/err.D_SYNTAX.pid.d
> +++ b/test/unittest/scripting/err.D_SYNTAX.pid.d
> @@ -1,8 +1,8 @@
> -#!/usr/sbin/dtrace -qs
> +#!dtrace -qs
>   
>   /*
>    * Oracle Linux DTrace.
> - * Copyright (c) 2006, Oracle and/or its affiliates. All rights reserved.
> + * Copyright (c) 2006, 2026, Oracle and/or its affiliates. All rights reserved.
>    * Licensed under the Universal Permissive License v 1.0 as shown at
>    * http://oss.oracle.com/licenses/upl.
>    */
> diff --git a/test/unittest/scripting/tst.arg0.d b/test/unittest/scripting/tst.arg0.d
> old mode 100644
> new mode 100755
> index 905fefb6..d2aa4345
> --- a/test/unittest/scripting/tst.arg0.d
> +++ b/test/unittest/scripting/tst.arg0.d
> @@ -1,8 +1,8 @@
> -#!/usr/sbin/dtrace -s
> +#!dtrace -s
>   
>   /*
>    * Oracle Linux DTrace.
> - * Copyright (c) 2006, 2021, Oracle and/or its affiliates. All rights reserved.
> + * Copyright (c) 2006, 2026, Oracle and/or its affiliates. All rights reserved.
>    * Licensed under the Universal Permissive License v 1.0 as shown at
>    * http://oss.oracle.com/licenses/upl.
>    */
> diff --git a/test/unittest/scripting/tst.assign.d b/test/unittest/scripting/tst.assign.d
> old mode 100644
> new mode 100755
> index 9bbd8e49..cde5d64c
> --- a/test/unittest/scripting/tst.assign.d
> +++ b/test/unittest/scripting/tst.assign.d
> @@ -1,8 +1,8 @@
> -#!/usr/sbin/dtrace -qs
> +#!dtrace -qs
>   
>   /*
>    * Oracle Linux DTrace.
> - * Copyright (c) 2006, 2020, Oracle and/or its affiliates. All rights reserved.
> + * Copyright (c) 2006, 2026, Oracle and/or its affiliates. All rights reserved.
>    * Licensed under the Universal Permissive License v 1.0 as shown at
>    * http://oss.oracle.com/licenses/upl.
>    */
> diff --git a/test/unittest/scripting/tst.assign.r b/test/unittest/scripting/tst.assign.r
> index 103e9945..8b137891 100644
> --- a/test/unittest/scripting/tst.assign.r
> +++ b/test/unittest/scripting/tst.assign.r
> @@ -1,5 +1 @@
> -                   FUNCTION:NAME
> -                          :BEGIN
>   
> --- @@stderr --
> -dtrace: script 'test/unittest/scripting/tst.assign.d' matched 1 probe
> diff --git a/test/unittest/scripting/tst.basic.d b/test/unittest/scripting/tst.basic.d
> old mode 100644
> new mode 100755
> index cd7b716a..792d6f06
> --- a/test/unittest/scripting/tst.basic.d
> +++ b/test/unittest/scripting/tst.basic.d
> @@ -1,8 +1,8 @@
> -#!/usr/sbin/dtrace -s
> +#!dtrace -s
>   
>   /*
>    * Oracle Linux DTrace.
> - * Copyright (c) 2006, 2020, Oracle and/or its affiliates. All rights reserved.
> + * Copyright (c) 2006, 2026, Oracle and/or its affiliates. All rights reserved.
>    * Licensed under the Universal Permissive License v 1.0 as shown at
>    * http://oss.oracle.com/licenses/upl.
>    */
> diff --git a/test/unittest/scripting/tst.pgid.d b/test/unittest/scripting/tst.pgid.d
> old mode 100644
> new mode 100755
> index 8d82f2bd..44ce7515
> --- a/test/unittest/scripting/tst.pgid.d
> +++ b/test/unittest/scripting/tst.pgid.d
> @@ -1,8 +1,8 @@
> -#!/usr/sbin/dtrace -qs
> +#!dtrace -qs
>   
>   /*
>    * Oracle Linux DTrace.
> - * Copyright (c) 2006, 2020, Oracle and/or its affiliates. All rights reserved.
> + * Copyright (c) 2006, 2026, Oracle and/or its affiliates. All rights reserved.
>    * Licensed under the Universal Permissive License v 1.0 as shown at
>    * http://oss.oracle.com/licenses/upl.
>    */
> diff --git a/test/unittest/scripting/tst.pgid.r b/test/unittest/scripting/tst.pgid.r
> index 6e512550..15f22b61 100644
> --- a/test/unittest/scripting/tst.pgid.r
> +++ b/test/unittest/scripting/tst.pgid.r
> @@ -1,6 +1,2 @@
> -                   FUNCTION:NAME
> -                          :BEGIN The pgid is
> +The pgid is
>   
> -
> --- @@stderr --
> -dtrace: script 'test/unittest/scripting/tst.pgid.d' matched  probe
> diff --git a/test/unittest/scripting/tst.pid.d b/test/unittest/scripting/tst.pid.d
> old mode 100644
> new mode 100755
> index 2d0499d7..70197c86
> --- a/test/unittest/scripting/tst.pid.d
> +++ b/test/unittest/scripting/tst.pid.d
> @@ -1,8 +1,8 @@
> -#!/usr/sbin/dtrace -qs
> +#!dtrace -qs
>   
>   /*
>    * Oracle Linux DTrace.
> - * Copyright (c) 2006, 2020, Oracle and/or its affiliates. All rights reserved.
> + * Copyright (c) 2006, 2026, Oracle and/or its affiliates. All rights reserved.
>    * Licensed under the Universal Permissive License v 1.0 as shown at
>    * http://oss.oracle.com/licenses/upl.
>    */
> diff --git a/test/unittest/scripting/tst.pid.r b/test/unittest/scripting/tst.pid.r
> index 9430557f..b8a74268 100644
> --- a/test/unittest/scripting/tst.pid.r
> +++ b/test/unittest/scripting/tst.pid.r
> @@ -1,6 +1,2 @@
> -                   FUNCTION:NAME
> -                          :BEGIN The pid is
> +The pid is
>   
> -
> --- @@stderr --
> -dtrace: script 'test/unittest/scripting/tst.pid.d' matched  probe
> diff --git a/test/unittest/scripting/tst.quiet.d b/test/unittest/scripting/tst.quiet.d
> old mode 100644
> new mode 100755
> diff --git a/test/unittest/scripting/tst.sid.d b/test/unittest/scripting/tst.sid.d
> old mode 100644
> new mode 100755
> index e4f1395c..670761d8
> --- a/test/unittest/scripting/tst.sid.d
> +++ b/test/unittest/scripting/tst.sid.d
> @@ -1,8 +1,8 @@
> -#!/usr/sbin/dtrace -s
> +#!dtrace -s
>   
>   /*
>    * Oracle Linux DTrace.
> - * Copyright (c) 2006, 2020, Oracle and/or its affiliates. All rights reserved.
> + * Copyright (c) 2006, 2026, Oracle and/or its affiliates. All rights reserved.
>    * Licensed under the Universal Permissive License v 1.0 as shown at
>    * http://oss.oracle.com/licenses/upl.
>    */
> diff --git a/test/unittest/scripting/tst.trace.d b/test/unittest/scripting/tst.trace.d
> old mode 100644
> new mode 100755
> index 148e5c60..f52b14ef
> --- a/test/unittest/scripting/tst.trace.d
> +++ b/test/unittest/scripting/tst.trace.d
> @@ -1,8 +1,8 @@
> -#!/usr/sbin/dtrace -s
> +#!dtrace -s
>   
>   /*
>    * Oracle Linux DTrace.
> - * Copyright (c) 2006, 2021, Oracle and/or its affiliates. All rights reserved.
> + * Copyright (c) 2006, 2026, Oracle and/or its affiliates. All rights reserved.
>    * Licensed under the Universal Permissive License v 1.0 as shown at
>    * http://oss.oracle.com/licenses/upl.
>    */
> diff --git a/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithBreakPoint.d b/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithBreakPoint.d
> index 50bbf177..044b5a95 100644
> --- a/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithBreakPoint.d
> +++ b/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithBreakPoint.d
> @@ -1,7 +1,6 @@
> -#!/usr/sbin/dtrace -ws
>   /*
>    * Oracle Linux DTrace.
> - * Copyright (c) 2006, 2021, Oracle and/or its affiliates. All rights reserved.
> + * Copyright (c) 2006, 2026, Oracle and/or its affiliates. All rights reserved.
>    * Licensed under the Universal Permissive License v 1.0 as shown at
>    * http://oss.oracle.com/licenses/upl.
>    */
> @@ -10,8 +9,8 @@
>    * ASSERTION: Destructive actions may never be speculative.
>    *
>    * SECTION: Speculative Tracing/Using a Speculation
> - * SECTION: dtrace(1M) Utility/ -w option
>    */
> +#pragma D option destructive
>   #pragma D option quiet
>   
>   BEGIN
> diff --git a/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithBreakPoint.r b/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithBreakPoint.r
> index 1590807c..206641c0 100644
> --- a/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithBreakPoint.r
> +++ b/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithBreakPoint.r
> @@ -1,2 +1,2 @@
>   -- @@stderr --
> -dtrace: failed to compile script test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithBreakPoint.d: [D_ACT_SPEC] line 28: destructive actions may not follow speculate( )
> +dtrace: failed to compile script test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithBreakPoint.d: [D_ACT_SPEC] line 27: destructive actions may not follow speculate( )
> diff --git a/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithChill.d b/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithChill.d
> index 47e248d2..e02577d2 100644
> --- a/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithChill.d
> +++ b/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithChill.d
> @@ -1,7 +1,6 @@
> -#!/usr/sbin/dtrace -ws
>   /*
>    * Oracle Linux DTrace.
> - * Copyright (c) 2006, 2021, Oracle and/or its affiliates. All rights reserved.
> + * Copyright (c) 2006, 2026, Oracle and/or its affiliates. All rights reserved.
>    * Licensed under the Universal Permissive License v 1.0 as shown at
>    * http://oss.oracle.com/licenses/upl.
>    */
> @@ -10,8 +9,8 @@
>    * ASSERTION: Destructive actions may never be speculative.
>    *
>    * SECTION: Speculative Tracing/Using a Speculation
> - * SECTION: dtrace (1M) Utility/ -w option
>    */
> +#pragma D option destructive
>   #pragma D option quiet
>   
>   BEGIN
> diff --git a/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithChill.r b/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithChill.r
> index d01ab558..ab7c6ed9 100644
> --- a/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithChill.r
> +++ b/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithChill.r
> @@ -1,2 +1,2 @@
>   -- @@stderr --
> -dtrace: failed to compile script test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithChill.d: [D_ACT_SPEC] line 28: destructive actions may not follow speculate( )
> +dtrace: failed to compile script test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithChill.d: [D_ACT_SPEC] line 27: destructive actions may not follow speculate( )
> diff --git a/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithCopyOut.d b/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithCopyOut.d
> index 14cc1d5c..dbb8f294 100644
> --- a/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithCopyOut.d
> +++ b/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithCopyOut.d
> @@ -1,7 +1,6 @@
> -#!/usr/sbin/dtrace -ws
>   /*
>    * Oracle Linux DTrace.
> - * Copyright (c) 2006, 2021, Oracle and/or its affiliates. All rights reserved.
> + * Copyright (c) 2006, 2026, Oracle and/or its affiliates. All rights reserved.
>    * Licensed under the Universal Permissive License v 1.0 as shown at
>    * http://oss.oracle.com/licenses/upl.
>    */
> @@ -10,8 +9,8 @@
>    * ASSERTION: Destructive actions may never be speculative.
>    *
>    * SECTION: Speculative Tracing/Using a Speculation
> - * SECTION: dtrace(1M) Utility/ -w option
>    */
> +#pragma D option destructive
>   #pragma D option quiet
>   
>   char a[2];
> diff --git a/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithCopyOut.r b/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithCopyOut.r
> index 89592786..f57aba47 100644
> --- a/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithCopyOut.r
> +++ b/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithCopyOut.r
> @@ -1,2 +1,2 @@
>   -- @@stderr --
> -dtrace: failed to compile script test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithCopyOut.d: [D_ACT_SPEC] line 34: destructive actions may not follow speculate( )
> +dtrace: failed to compile script test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithCopyOut.d: [D_ACT_SPEC] line 33: destructive actions may not follow speculate( )
> diff --git a/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithCopyOutStr.d b/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithCopyOutStr.d
> index 43a41440..00f56e1d 100644
> --- a/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithCopyOutStr.d
> +++ b/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithCopyOutStr.d
> @@ -1,7 +1,6 @@
> -#!/usr/sbin/dtrace -ws
>   /*
>    * Oracle Linux DTrace.
> - * Copyright (c) 2006, 2023, Oracle and/or its affiliates. All rights reserved.
> + * Copyright (c) 2006, 2026, Oracle and/or its affiliates. All rights reserved.
>    * Licensed under the Universal Permissive License v 1.0 as shown at
>    * http://oss.oracle.com/licenses/upl.
>    */
> @@ -10,8 +9,8 @@
>    * ASSERTION: Destructive actions may never be speculative.
>    *
>    * SECTION: Speculative Tracing/Using a Speculation
> - * SECTION: dtrace(1M) Utility/ -w option
>    */
> +#pragma D option destructive
>   #pragma D option quiet
>   
>   string str;
> diff --git a/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithCopyOutStr.r b/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithCopyOutStr.r
> index 3bc21b18..da4038aa 100644
> --- a/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithCopyOutStr.r
> +++ b/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithCopyOutStr.r
> @@ -1,2 +1,2 @@
>   -- @@stderr --
> -dtrace: failed to compile script test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithCopyOutStr.d: [D_ACT_SPEC] line 34: destructive actions may not follow speculate( )
> +dtrace: failed to compile script test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithCopyOutStr.d: [D_ACT_SPEC] line 33: destructive actions may not follow speculate( )
> diff --git a/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithPanic.d b/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithPanic.d
> index 80a3204d..9fb6a1e3 100644
> --- a/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithPanic.d
> +++ b/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithPanic.d
> @@ -1,7 +1,6 @@
> -#!/usr/sbin/dtrace -ws
>   /*
>    * Oracle Linux DTrace.
> - * Copyright (c) 2006, 2021, Oracle and/or its affiliates. All rights reserved.
> + * Copyright (c) 2006, 2026, Oracle and/or its affiliates. All rights reserved.
>    * Licensed under the Universal Permissive License v 1.0 as shown at
>    * http://oss.oracle.com/licenses/upl.
>    */
> @@ -10,8 +9,8 @@
>    * ASSERTION: Destructive actions may never be speculative.
>    *
>    * SECTION: Speculative Tracing/Using a Speculation
> - * SECTION: dtrace(1M) Utility/ -w option
>    */
> +#pragma D option destructive
>   #pragma D option quiet
>   
>   BEGIN
> diff --git a/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithPanic.r b/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithPanic.r
> index 3c120a03..7c15314d 100644
> --- a/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithPanic.r
> +++ b/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithPanic.r
> @@ -1,2 +1,2 @@
>   -- @@stderr --
> -dtrace: failed to compile script test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithPanic.d: [D_ACT_SPEC] line 28: destructive actions may not follow speculate( )
> +dtrace: failed to compile script test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithPanic.d: [D_ACT_SPEC] line 27: destructive actions may not follow speculate( )
> diff --git a/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithRaise.d b/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithRaise.d
> index a8c1c4d4..c239bc7a 100644
> --- a/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithRaise.d
> +++ b/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithRaise.d
> @@ -1,7 +1,6 @@
> -#!/usr/sbin/dtrace -ws
>   /*
>    * Oracle Linux DTrace.
> - * Copyright (c) 2006, 2021, Oracle and/or its affiliates. All rights reserved.
> + * Copyright (c) 2006, 2026, Oracle and/or its affiliates. All rights reserved.
>    * Licensed under the Universal Permissive License v 1.0 as shown at
>    * http://oss.oracle.com/licenses/upl.
>    */
> @@ -10,8 +9,8 @@
>    * ASSERTION: Destructive actions may never be speculative.
>    *
>    * SECTION: Speculative Tracing/Using a Speculation
> - * SECTION: dtrace(1M) Utility/ -w option
>    */
> +#pragma D option destructive
>   #pragma D option quiet
>   
>   BEGIN
> diff --git a/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithRaise.r b/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithRaise.r
> index 136f5cde..6e85370a 100644
> --- a/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithRaise.r
> +++ b/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithRaise.r
> @@ -1,2 +1,2 @@
>   -- @@stderr --
> -dtrace: failed to compile script test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithRaise.d: [D_ACT_SPEC] line 28: destructive actions may not follow speculate( )
> +dtrace: failed to compile script test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithRaise.d: [D_ACT_SPEC] line 27: destructive actions may not follow speculate( )
> diff --git a/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithStop.d b/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithStop.d
> index a0bca73d..dd20eac4 100644
> --- a/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithStop.d
> +++ b/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithStop.d
> @@ -1,7 +1,6 @@
> -#!/usr/sbin/dtrace -ws
>   /*
>    * Oracle Linux DTrace.
> - * Copyright (c) 2006, 2021, Oracle and/or its affiliates. All rights reserved.
> + * Copyright (c) 2006, 2026, Oracle and/or its affiliates. All rights reserved.
>    * Licensed under the Universal Permissive License v 1.0 as shown at
>    * http://oss.oracle.com/licenses/upl.
>    */
> @@ -10,8 +9,8 @@
>    * ASSERTION: Destructive actions may never be speculative.
>    *
>    * SECTION: Speculative Tracing/Using a Speculation
> - * SECTION: dtrace(1M) Utility/ -w option
>    */
> +#pragma D option destructive
>   #pragma D option quiet
>   
>   BEGIN
> diff --git a/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithStop.r b/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithStop.r
> index 8cdc6ba1..98725509 100644
> --- a/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithStop.r
> +++ b/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithStop.r
> @@ -1,2 +1,2 @@
>   -- @@stderr --
> -dtrace: failed to compile script test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithStop.d: [D_ACT_SPEC] line 28: destructive actions may not follow speculate( )
> +dtrace: failed to compile script test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithStop.d: [D_ACT_SPEC] line 27: destructive actions may not follow speculate( )
