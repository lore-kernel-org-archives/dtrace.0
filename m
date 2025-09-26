Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1D341FDA8E
	for <dtrace@lists.linux.dev>; Fri, 26 Sep 2025 19:06:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758913578; cv=fail; b=SSJ0UItrEPI41T4ZNkVUt4P3QzjgpAouQl7siuN0twnSgO6HUXb1hldtRZBPfdq39JATYlNUoPgYkliC4h96vuSufMnzwJ4cofb9mQN8SP5cBKOlGrdX/3a+Qed8I6AHeTzHHgIRxADVlx36l9NicIcFLRxdh9mNhI6qEBGagmE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758913578; c=relaxed/simple;
	bh=crdycjCwtem8kLmyg/CYmVLqU2nH6nxq9wVlR3tCSak=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=hsq6qDHO3qB0KIlmPYD/X1f2+X3c+vjyLW6urJWlXNBMDHwlebJQFItGHBmQSQPqbVwc05HLmHFwEa8m3XNE35IVF9u7UH8eXvn0mQHDC61Ua7UfKiMRr8Ov2pnAIwLIP2asYq2KAUtJpGGkIOCttCIpIr79Su5+EsNfl+HwKJI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=GqcQXgqq; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=lnD7vrdL; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="GqcQXgqq";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="lnD7vrdL"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58QIMr19015577
	for <dtrace@lists.linux.dev>; Fri, 26 Sep 2025 19:06:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=TNhECcUmddHPRhnM1FGXq+w9FytUliyxcw+hWyREs48=; b=
	GqcQXgqq+0YO5EQwAh6Ud+5HmjG8d8Fb8Zmnz0D3oo251Gs5SNvR4c90XyR0G94l
	Unuj95AjgOTBfDs171I2f0vHh23QcwwU7kcGY7fl0i6uFMrqwofg63lk821NhxOc
	nzsfAGq9o1k4AekA8oPh7JhUQMzxTRM4WpJwbL5aerRYM6ZXPPnOWudD6cDlv/yk
	IJjB30hoypPlboxfhkE/Fhjis4P6TLwGpMiwBoJuU5DNFCCvB2iQ4pL961dU0mf9
	LsLGS5wPOiX0c5AWYvVlea4XOJn8svNJk4dKr7xikg5G5cTADRwi2nqubLpNILtK
	Jz3ZoVwEDPYQqEohVQ5XCA==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 49dybn0549-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 26 Sep 2025 19:06:15 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 58QIP9BX023334
	for <dtrace@lists.linux.dev>; Fri, 26 Sep 2025 19:06:15 GMT
Received: from ch4pr04cu002.outbound.protection.outlook.com (mail-northcentralusazon11013034.outbound.protection.outlook.com [40.107.201.34])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 49dd8m7f6v-5
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 26 Sep 2025 19:06:15 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GhcZD23FdkAJOY8u12RZfPjPT6hjnRlAVZkHMzRldqBzzrq+sp+odtI+FHF6X6646aNf3qRTmcT9OeO+SttS0dnUa/0RUigeDo/PyvDIB7CUZoYZYm9rPrCMFVHW7ZknGdQof8L3hrmVHmjyngNxG4/zR+IP79pkv4Y8w2uk4tximHIYo9jmqsVGaXmrzEih45wTAOdjsYyNLAQcgFCbJ+1PKGyt2t2VXFhqUWGAyph78qEkGu0Eh9cbhOcMhzRlw7Mnj46GZclKxCTZj8N79yHs4ywiePQfd7qFx0CaO2kN+BG1T6Q02REdQ4uYYjOV7wxnUMb5IsRPKHr0BVhpAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TNhECcUmddHPRhnM1FGXq+w9FytUliyxcw+hWyREs48=;
 b=YeV4K7TophHthTOt12+BLlAgtWfGHwvJEd11KV4MbtsU8YPbOZL0vdaOx5+1RSbXXVoPbnAGb4EnUfRd8P8SO5qaAUaan7BO/72Ixxb1yL9Ehg7pa1p13ToBU96t2csZJ4NHJatJwTgI2AMXw/tNtDjNXB9xF89QWHf4Yy5oL/xT1jZe4jQb+Q1LgWKKTXeQnYDeBK4VemsQQE3YO5pQjXT6HVYF5Oh+H99e+EymA+z+S/7XfI4uwprG4e4XSPi7lAqzAUR+FmWVpn5ZSfiCaAVO2okQGDF8/ov7ny+GQkz4DnjlmKW8+ujdMlbSO7YFPMs1LIhw/LLYugVqq8mC8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TNhECcUmddHPRhnM1FGXq+w9FytUliyxcw+hWyREs48=;
 b=lnD7vrdLxlBWz0M9QQASUcpVo+GMM1cNRS3b36XWqNzebSLlFreHiK/7TcthiBXsGsQ+K0TXOvh+mOvoYuUExoru3oUkyKnf6vs8iBCjlXOY2KNMIw7uWAu9c5vNiZSfLWeGztzVim0JN4Bcqfdm4wyjuEQYRSkdL4iJh6CT5OU=
Received: from SJ0PR10MB5647.namprd10.prod.outlook.com (2603:10b6:a03:3da::17)
 by SJ5PPF0687F9010.namprd10.prod.outlook.com (2603:10b6:a0f:fc02::786) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Fri, 26 Sep
 2025 19:06:11 +0000
Received: from SJ0PR10MB5647.namprd10.prod.outlook.com
 ([fe80::8db4:df1d:6afd:e4a7]) by SJ0PR10MB5647.namprd10.prod.outlook.com
 ([fe80::8db4:df1d:6afd:e4a7%7]) with mapi id 15.20.9160.011; Fri, 26 Sep 2025
 19:06:11 +0000
From: eugene.loh@oracle.com
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH 08/20] doc: Fix anchor links for built-in variables
Date: Fri, 26 Sep 2025 15:05:45 -0400
Message-Id: <20250926190557.8485-8-eugene.loh@oracle.com>
X-Mailer: git-send-email 2.18.4
In-Reply-To: <20250926190557.8485-1-eugene.loh@oracle.com>
References: <20250926190557.8485-1-eugene.loh@oracle.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR05CA0142.namprd05.prod.outlook.com
 (2603:10b6:a03:33d::27) To SJ0PR10MB5647.namprd10.prod.outlook.com
 (2603:10b6:a03:3da::17)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR10MB5647:EE_|SJ5PPF0687F9010:EE_
X-MS-Office365-Filtering-Correlation-Id: 6851b979-991b-45ab-5c2c-08ddfd2fc1d6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?TnZqalJvMHd3c3JnRVRNMWFoWEQ0S1NaYnNOdlp4VEhPVFRKaHhZTDBuanZZ?=
 =?utf-8?B?RmtNUEZZWHQ1Zy9UWU1IcVdySHVXRDBlcmlaTVZoK0RIb1c2MDBUTkdud3c4?=
 =?utf-8?B?R0VwbmFhbk9GRmtqNU0rLzdLaGo5T0V1QXdsbGJGc0pMcytUY3JPYzZJMHV2?=
 =?utf-8?B?NjB6Q0tZSlFoYU03d0FSQ2VyNWkzQ2QyZzRuSHc3THpUTnZ5SWtDcDBvTm9N?=
 =?utf-8?B?RjVkaXdLNVRsWk1iNkhYUEdIK3hRUW03WEgyZ0laT2VFRlI0Qk1JbFB5TTUy?=
 =?utf-8?B?cVBybmk1Z004SFJsVU1zMjkxWThqMFVNQmNMOTVtOS8xR2JZZGFIa3hrNity?=
 =?utf-8?B?ai90ZW0xV1puZC9uZGNEUU84a094aEk3T1dIMTA3cXM5a1RrL3lpTmcwc29s?=
 =?utf-8?B?R1pVN0VJQTVHc3RSd1UrMFh6SldOYURTNEpMNlJQZjF1SnpMR1VIQXU4dVRL?=
 =?utf-8?B?SUJYdElSZkVjdzZkeW5oa1d5RmV4bGZOUndaUG9TWkVXak4zTWVPZ29RbStL?=
 =?utf-8?B?VS9uazFmNjlMeTcwVFhJdDQvYmc0Z1I2ZnBwL1ROeEdaamVlMkdrNnhBeVFa?=
 =?utf-8?B?eldkbitvZWJtZTB1blRLakdIaWhhZVZLNlFGVy81YVZPaEJ1SkxlSlpvYUJB?=
 =?utf-8?B?S21hcXpZQkJvRTFMYzEveXNDenNJT0JLWm1qejhGV2xxMGNPb2NPMVkya3dX?=
 =?utf-8?B?cHBNOXZqQWF5TXVSMis4RHdIN29HMDJPdHA0cG00ZHBNR1NUd2NjT2VTMkli?=
 =?utf-8?B?TWg3TVhsZThzc1Jaakk4NFdoMlBVdW0vVUJDOHltSUtLbWx0Y1NNWGFYVWlk?=
 =?utf-8?B?YlpoZW1ka2hZY2R1WjRXL2ZwcTNOb3lTTVpucHFrNTd0anFDc3RhTGxCMVBp?=
 =?utf-8?B?cWlyU1RBem10eXJYQ2d3Z3doUXZGdk1PMHhzVHdZeWhMOFZqRzdheTk4Y25F?=
 =?utf-8?B?L1ZRMzY1MUlnYjZFS0x1U0UxZ3RUUHdGMkZWL0xTUjBvQzZneExqMTUzdUha?=
 =?utf-8?B?S085SlJWZFhRd3ZGYkU0T0NibG1GcFlzYmdmb2FRcnZqNmYyUG4xczZNdytr?=
 =?utf-8?B?d2IxQ3VxT0VDN0gyOUxzSXl2VGxmVXFESWVxNUp4dmlHOWdtNWVhV2hlR01E?=
 =?utf-8?B?TG02eGhaeE1DdnNGNjZNNFlNOUVMd0dFUVVSREkwMjliQUtJaHc4MXVnZFlv?=
 =?utf-8?B?L1U2UVMvRHZBYVNWbStHZnlzRDA2SlBqVzZYTW1aMCtTRmVnaUdnL29acnlN?=
 =?utf-8?B?SlFZK3RxS0lxTGhTUVhydzhEalVHb25IcFE4bG1JRUFuaHptbzRmMmFQRmpE?=
 =?utf-8?B?ZWE3S3hCUjdMd09xTlJIU0d4MGtFSDVPaDdQai9nRUFQTFlKc0JvUmhDT3pX?=
 =?utf-8?B?NVgwU2pwTmRYYmE1SkNCL3IybVZMVnJxcVhRQUNIY0NxaGxEb3owSHNVU3B4?=
 =?utf-8?B?UXFMSjFUcWVSN1hiOXFZdkNBZ0I0MXJyNnVjQ1NOcjVnR3JTQUNRRXRITDRr?=
 =?utf-8?B?eGdPcURWbWxGV2FKWGVDYU5tOTM0S3lDSXF6MDV5WWZVcGJ0VkRaeWdTL0RS?=
 =?utf-8?B?UFNsZTVXLzh1NlBReThHa1Z2c1FsL0ZrVDQxMnJseEovaGtYN3pqNnV3aXNn?=
 =?utf-8?B?K2krVCtVdTlEdjVpeVk2bHJRaUNkYVdsL2Fnc2xjOFFGNGk2b1hFaDNMdVhk?=
 =?utf-8?B?YWZqVEdJd1VRdFlicnBTREhJNEZ1L2FrTlpQU0NIRkR0WEFRQWZsWlFKd2Z3?=
 =?utf-8?B?dmpGMDNSdzU3WmE1MDVLem83cllVSUhtYWNMRGVrSlo3UHFrbC8rQm1PZ0xL?=
 =?utf-8?B?WTVVemZNcXZLM1F1TmV2WjFnaEZzUitpUEFNc0daTzlUY1BuR0xGL1U0cGF6?=
 =?utf-8?B?RnZjN09LenFwR1hrb3BWeEZKVUhyZGFHWVlTdEMxN3pSZ1JocXBHRjVrRmFH?=
 =?utf-8?Q?AYVs1uAGzwAerYNJ/s59fmfqTkAziGB5?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR10MB5647.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MCsxeEtCVmJ6VjhCTm9pQ1EybDFzK2hLQWdyaGo5VnVaK1oxVnEzdHByTjBj?=
 =?utf-8?B?dThnLzB2b2pCekdBNTM0STNpU1ZtY01VMklCSndNdFZ0U3kzQUZEMm9GNzBw?=
 =?utf-8?B?T2d2UUNFaTQ0Q2ZXOURUZUpBQ0JmWmVMWlpWTnpHRW8xOTNYVW9heEhqMGor?=
 =?utf-8?B?UlIrcjhqVUQybG8xYlV2Q0krcHhDb1BaQnZUZ2Q2Y3VMV0JNNjZtTUoxNUZM?=
 =?utf-8?B?MTVxQ1NGaTNaeStnOUxUY3VWcVhvN0JVN0FNekh0MmRmYTlLeEpGUEwwM2Ns?=
 =?utf-8?B?OWhvTmFralRBWUhvSG1OWGFmeUVzaTNPYkxDaUtBNTY5UzVhdFk2eEpyOU85?=
 =?utf-8?B?bWZDdk5xNXpFeGh6OWFiU09JeW1WcXFNMlJWL3BOU3grSG9DQk95L2VUT2t5?=
 =?utf-8?B?ak9rNUs5REs5S1JMUkRrRzFnOEJtQndkR0RIVGNnNllDU0k2N0F4dVFuMzZE?=
 =?utf-8?B?UFpSekJhY2l2M0dRM3hoeHpNWE45UDhjcGIvY2x2UjF6cC91RFBTWXZJL0VX?=
 =?utf-8?B?VmYxZ1VqWWNPYXh3eEtSMGNWNVVmZUgrYU92T29HOTVwckZweEVLZEl4cUlh?=
 =?utf-8?B?b3Fxb0cwbHRtVlFMNitVWjJ4aVJ4UDF0NmpRak9iTjNmVEtHQWtzWG9TSGNS?=
 =?utf-8?B?QVpUeXVReFJobW9wZ0JDbysxKzVOcDdYbDc3QmIrVTRuV1N1aStiU3pPZU1O?=
 =?utf-8?B?elVhV3hMRWRmN0oxRnI4eVU4NHBON0pacVJ4WG1Jc21GeUx3RlB3dkpESU5W?=
 =?utf-8?B?ZkFhTUZkRExqUFNsSlFEakdSdE1KRkpRRE1TTUJIbzFtcVk2djY1R1dBS3d2?=
 =?utf-8?B?UFRidW9WcWV0NGVLYnZ0N1QrTjc2UFpycGh5Mm5ycFhJa1N4WkZMa2FIMHZS?=
 =?utf-8?B?Y0dvMlo3YjJXRlFGUnZUeXpQeGdqNjhhUDBaRUlTa001N0JBejFaMW81VnF5?=
 =?utf-8?B?UDZoanFaRmRveUlNNFUzR1B1eWxjZ09INWYydStKa0czUVNRcGNCVlVSN1A2?=
 =?utf-8?B?bjYwTkhJdUdlNk43QzJkRTZGMlZsc0Y5NDRkM21IUUJXbmN6ck9sQzBrUlhJ?=
 =?utf-8?B?ZDdoOG9lNEFRd29WTXBkQXFGVUcwZFlKbWdoQlJDOFV4NGlod2k5bzRrWm9R?=
 =?utf-8?B?R0RsZi8yRE82TTI2Rkc2K1pvWk04VE8yY1E5L2l0NjZmYUVIbHVRa3cyNWth?=
 =?utf-8?B?SHVWMkVMY3N6WjZ1U29UNzRabTFzMWJ6YXQ4WklYekV5V0ErYjRTMXNObVJX?=
 =?utf-8?B?bmFrdUx2YjRTWC9HbnhVQjFiUG5rcS85emlBeVZMVE10QmVlUUZ4WFkwUU83?=
 =?utf-8?B?VmxudnZCOUZ2Nis4dWR3NTBxeVhCYVRJSEpFNkdHenRvTWEzNlZGQTVYQk5a?=
 =?utf-8?B?K3NSY1FxcjBQU214aUdVVmc4ZGVocWxOSzFrd1BnNE9YYWFSSDR3NXpWaFBr?=
 =?utf-8?B?Y2hMck9uMGY0eGovUUtXZ1hDK0tLWUxBMGRBQ0J4ZXlPUlU4YjlIcTdiS1ZJ?=
 =?utf-8?B?Rks0dFFmVVNuSEREYWl1K3JzZFRPeDQ3T2szamp1amlJUXMrN21ETWJOU21S?=
 =?utf-8?B?b0tJc01kUEFGYjhEaXNIVWZmTC9CUnFUbDFFdEVMTXVFSDZhYjlmSE1vU3Fj?=
 =?utf-8?B?WXhXVS9yQ0hiY3FqRjlRZ29oL2FZOVZiMmpkcW5LdUZRbkk5TFJXckhDK3F5?=
 =?utf-8?B?S2xmeDhyRmNUczRPWnlYQzdJejgzWVY4MzBGakd6MHFJQXE4NExYbkd1Zmxs?=
 =?utf-8?B?VVFYWXdaRktacW0wT2cyTzNiaVlOWFo0alMzNTNQRnRsTUhtcWsyd2pzZ0Iz?=
 =?utf-8?B?Z3docGhpOVBVRng4SlY4cExoazFuRCtjZkJqMWN1QjYreWc1WkwrOFJsY3Fu?=
 =?utf-8?B?L21nRkFVRGNLM1pyaUJLV01FcDZnT3lnRWZrUnJ4S2tIZGpDRFovdEpaVi9N?=
 =?utf-8?B?WGpsaXNCc2V1cmpFTUdNeHl5RTdMZHEwa2Evd3prNnlaS3dmNXI0TTUzRDdV?=
 =?utf-8?B?dDRzTWlHdjl4QS91MEE0TFdIY09zOGhPazBMSXQ0NnpyL2F3ZGwxNVZRYXha?=
 =?utf-8?B?dXB5ZEZrdVY5cWhzTlVsdlpLbGhWR0FLK0x3b0xnQVhkZ2VHMkUxVTNORit2?=
 =?utf-8?Q?X8PYHoh7etebMkHuv+fyh8ebX?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	XsYMd1hHLYsQFUphsyLyqdqgK0jewU2TFfEzYbNQXSXIPoicgj4q4C0QGKNXcTISIIsbortxwm6If7pdBHNfX2v9uTzUsk6tqAhfw+W7ZXSzPts0WKhSRIo44InHWNk8MtXRT+L2w6Y8o0uA7injSWr2iS0lyxvvNwELTYz2y8Y+JVkiyOZ6xfj2F/cTdxxaxK+MMOI9aem/7GXni4JR3eXL5Nr2hEsQ3wz9koPb6EcSRcLyUXZS6dXl1OiXdLaKeCv0rSDzeowz3/u3XmXoq8I7yzdwps9RWs1JOGIzxB0OLeWI0YM1G7UWeYuS+aGqojcdWsUQKhy9mimwySPumXJatMKuc2VWu3aqlTNFtZ/T1plvWTU6k6SDjIriZAtFA7iQBHtlnygYAy3Iaqq7UMTPs0+LiUKoaLGDR+Tuzeop4z9UJp/C2EIaAcV8U4ZYko8sj0QkGR33xcETw/KPBw9YXs9ptvo1dy/Tt3dEsAz301OiRmUXsT/x1Xd9sGhU978/3uVcCGbEyMFSo69gkgk9Yx05HVv3sTgAhu4IWrFP9QURXZRRK8zDG3CJfBw/mnW3dwcbVxCAgKn/PWdXEurEnsoA9kb8KvqGqxmI8n4=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6851b979-991b-45ab-5c2c-08ddfd2fc1d6
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR10MB5647.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2025 19:06:11.5483
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: r4qi6yOOTf5zzl3Uuec/xH6cfN5WiIKguG1GPKLnquD3WFagwBQa+p6ZOaQ3hSCVMIvKMuH5HUvx1mlaWr/Qtg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF0687F9010
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-26_06,2025-09-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 phishscore=0 spamscore=0
 mlxlogscore=999 mlxscore=0 suspectscore=0 adultscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2509150000
 definitions=main-2509260172
X-Proofpoint-ORIG-GUID: GfoPHoQv_RHJR_NU7CdfcE4KGQLjMBQq
X-Authority-Analysis: v=2.4 cv=C+rkCAP+ c=1 sm=1 tr=0 ts=68d6e427 cx=c_pps
 a=OOZaFjgC48PWsiFpTAqLcw==:117 a=OOZaFjgC48PWsiFpTAqLcw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=yJojWOMRYYMA:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=rvpTFhCrE2KpyQrJetQA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI2MDE1OSBTYWx0ZWRfX9DTHQrufB5ko
 lYfvzMIloDVQSY0hx8IgR9Rkx/xnj9TGdSbPlFnLMU2T4SXOQXlBtTPkVKNuknNMqU+Clf+QsoP
 eQg0YrI10DkwTrFz8nXCuqdUumWPLpXLc1JnrALWoe/3Pbex/ejgJRQqeuaN23z/WT+NSHeIJBs
 8CqLPI3H/HxkS9lO5rWjNV5beiFaiJGbksJ5cpHzTCIcY1LIp9t1BiHxAvgMkkdgGyna9iLFolJ
 LgsmBYbhO3+E8FBca/RHKmTDChqFiVTRNcM6gcAq74saIVohqI78hDJWlu9aFOeA5CyE/DgyiHV
 YTVytoQf3VTFkgqU48pmm755uP9pHBfKEZdiBTDzrBhAFrKkw0hhIeamh8yTEiLAnf3JPbMY5UW
 7VVgucatxdvT8SRne5Tmrt5QTh250A==
X-Proofpoint-GUID: GfoPHoQv_RHJR_NU7CdfcE4KGQLjMBQq

From: Eugene Loh <eugene.loh@oracle.com>

Anchor links (links pointing to specific locations within files) are
broken, at least for viewing the Markdown User Guide in github from
Chrome and Edge, in at least two respects:

*)  The arcane ID names are displayed at the anchor sites.

*)  The links do not point to the specific locations within the files.

Remove the {#ID} tags and have the links point to the names that are
generated by default at the anchor sites.

This patch addresses the documentation on built-in variables.

Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
---
 doc/userguide/index.md                        | 56 +++++++++----------
 .../dtrace_builtin_variable_reference.md      | 56 +++++++++----------
 2 files changed, 56 insertions(+), 56 deletions(-)

diff --git a/doc/userguide/index.md b/doc/userguide/index.md
index a8f6a7e76..68d1164f8 100644
--- a/doc/userguide/index.md
+++ b/doc/userguide/index.md
@@ -76,34 +76,34 @@
     -   [Dynamic Runtime Options](reference/dynamic_runtime_options.md)
 -   [DTrace Stability Reference](reference/dt_stability_reference.md)
 -   [DTrace Built-in Variable Reference](reference/dtrace_builtin_variable_reference.md)
-    -   [Macro Variables](reference/dtrace_builtin_variable_reference.md#dt_macrov_scrpt)
-    -   [args\[\]](reference/dtrace_builtin_variable_reference.md#dt_ref_vars_args)
-    -   [arg0, …, arg9](reference/dtrace_builtin_variable_reference.md#dt_ref_var_arg0-9)
-    -   [caller](reference/dtrace_builtin_variable_reference.md#dt_ref_var_caller)
-    -   [curcpu](reference/dtrace_builtin_variable_reference.md#dt_ref_var_curcpu)
-    -   [curthread](reference/dtrace_builtin_variable_reference.md#dt_ref_var_curthread)
-    -   [epid](reference/dtrace_builtin_variable_reference.md#dt_ref_var_epid)
-    -   [errno](reference/dtrace_builtin_variable_reference.md#dt_ref_var_errno)
-    -   [execname](reference/dtrace_builtin_variable_reference.md#dt_ref_var_execname)
-    -   [fds](reference/dtrace_builtin_variable_reference.md#dt_ref_var_fds)
-    -   [gid](reference/dtrace_builtin_variable_reference.md#dt_ref_var_gid)
-    -   [id](reference/dtrace_builtin_variable_reference.md#dt_ref_var_id)
-    -   [ipl](reference/dtrace_builtin_variable_reference.md#dt_ref_var_ipl)
-    -   [pid](reference/dtrace_builtin_variable_reference.md#dt_ref_var_pid)
-    -   [ppid](reference/dtrace_builtin_variable_reference.md#dt_ref_var_ppid)
-    -   [probefunc](reference/dtrace_builtin_variable_reference.md#dt_ref_var_probefunc)
-    -   [probemod](reference/dtrace_builtin_variable_reference.md#dt_ref_var_probemod)
-    -   [probename](reference/dtrace_builtin_variable_reference.md#dt_ref_var_probename)
-    -   [probeprov](reference/dtrace_builtin_variable_reference.md#dt_ref_var_probeprov)
-    -   [stackdepth](reference/dtrace_builtin_variable_reference.md#dt_ref_var_stackdepth)
-    -   [tid](reference/dtrace_builtin_variable_reference.md#dt_ref_var_tid)
-    -   [timestamp](reference/dtrace_builtin_variable_reference.md#dt_ref_var_timestamp)
-    -   [ucaller](reference/dtrace_builtin_variable_reference.md#dt_ref_var_ucaller)
-    -   [uid](reference/dtrace_builtin_variable_reference.md#dt_ref_var_uid)
-    -   [uregs](reference/dtrace_builtin_variable_reference.md#dt_ref_var_uregs)
-    -   [ustackdepth](reference/dtrace_builtin_variable_reference.md#dt_ref_var_ustackdepth)
-    -   [vtimestamp](reference/dtrace_builtin_variable_reference.md#dt_ref_var_vtimestamp)
-    -   [walltimestamp](reference/dtrace_builtin_variable_reference.md#dt_ref_var_walltimestamp)
+    -   [Macro Variables](reference/dtrace_builtin_variable_reference.md#macro-variables)
+    -   [args\[\]](reference/dtrace_builtin_variable_reference.md#args)
+    -   [arg0, …, arg9](reference/dtrace_builtin_variable_reference.md#arg0--arg9)
+    -   [caller](reference/dtrace_builtin_variable_reference.md#caller)
+    -   [curcpu](reference/dtrace_builtin_variable_reference.md#curcpu)
+    -   [curthread](reference/dtrace_builtin_variable_reference.md#curthread)
+    -   [epid](reference/dtrace_builtin_variable_reference.md#epid)
+    -   [errno](reference/dtrace_builtin_variable_reference.md#errno)
+    -   [execname](reference/dtrace_builtin_variable_reference.md#execname)
+    -   [fds](reference/dtrace_builtin_variable_reference.md#fds)
+    -   [gid](reference/dtrace_builtin_variable_reference.md#gid)
+    -   [id](reference/dtrace_builtin_variable_reference.md#id)
+    -   [ipl](reference/dtrace_builtin_variable_reference.md#ipl)
+    -   [pid](reference/dtrace_builtin_variable_reference.md#pid)
+    -   [ppid](reference/dtrace_builtin_variable_reference.md#ppid)
+    -   [probefunc](reference/dtrace_builtin_variable_reference.md#probefunc)
+    -   [probemod](reference/dtrace_builtin_variable_reference.md#probemod)
+    -   [probename](reference/dtrace_builtin_variable_reference.md#probename)
+    -   [probeprov](reference/dtrace_builtin_variable_reference.md#probeprov)
+    -   [stackdepth](reference/dtrace_builtin_variable_reference.md#stackdepth)
+    -   [tid](reference/dtrace_builtin_variable_reference.md#tid)
+    -   [timestamp](reference/dtrace_builtin_variable_reference.md#timestamp)
+    -   [ucaller](reference/dtrace_builtin_variable_reference.md#ucaller)
+    -   [uid](reference/dtrace_builtin_variable_reference.md#uid)
+    -   [uregs](reference/dtrace_builtin_variable_reference.md#uregs)
+    -   [ustackdepth](reference/dtrace_builtin_variable_reference.md#ustackdepth)
+    -   [vtimestamp](reference/dtrace_builtin_variable_reference.md#vtimestamp)
+    -   [walltimestamp](reference/dtrace_builtin_variable_reference.md#walltimestamp)
 -   [DTrace Function Reference](reference/dtrace_functions.md)
     -   [Default Action](reference/dtrace-ref-DefaultAction.md)
     -   [Unimplemented Functions](reference/unimplemented_functions.md)
diff --git a/doc/userguide/reference/dtrace_builtin_variable_reference.md b/doc/userguide/reference/dtrace_builtin_variable_reference.md
index 3ecc55440..fd1af0f75 100644
--- a/doc/userguide/reference/dtrace_builtin_variable_reference.md
+++ b/doc/userguide/reference/dtrace_builtin_variable_reference.md
@@ -3,7 +3,7 @@
 
 DTrace includes a set of built-in scalar variables that can be used in D programs or scripts.
 
-## Macro Variables {#dt_macrov_scrpt}
+## Macro Variables
 
 Macro variables are variables that are populated at runtime and identify information about the running `dtrace` process or the process running the compiler.
 
@@ -243,7 +243,7 @@ To find the number of system calls made by the `date` command, save the script i
 sudo dtrace -s syscall.d -c date
 ```
 
-## args\[\] {#dt_ref_vars_args}
+## args\[\]
 
 The typed and mapped arguments, if any, to the current probe. The `args[]` array is accessed using an integer index. Use `dtrace -l -v` and check `Argument Types` for the type of each argument of each probe. For example, consider the system call `prlimit()`. The prototype on its `man` page \(`man -s 2 prlimit`\) is consistent with its DTrace probe listing \(`dtrace -lvn 'syscall:vmlinux:prlimit*:entry' | grep args`\). Specifically, argument 2, if non NULL, points to a `struct rlimit` with the requested resource limit, which can be traced with:
 
@@ -255,7 +255,7 @@ syscall:vmlinux:prlimit*:entry
 }
 ```
 
-## arg0, …, arg9 {#dt_ref_var_arg0-9}
+## arg0, …, arg9
 
 ```
 int64_t arg0, ..., arg9
@@ -271,7 +271,7 @@ rawfbt:vmlinux:ksys_write:entry
 }
 ```
 
-## caller {#dt_ref_var_caller}
+## caller
 
 ```
 uintptr_t caller
@@ -279,7 +279,7 @@ uintptr_t caller
 
 The built-in variable `caller` references the program counter location of the current kernel thread at the time the probe fired.
 
-## curcpu {#dt_ref_var_curcpu}
+## curcpu
 
 ```
 cpuinfo_t * curcpu
@@ -287,7 +287,7 @@ cpuinfo_t * curcpu
 
 The built-in variable `curcpu` references the current physical CPU.
 
-## curthread {#dt_ref_var_curthread}
+## curthread
 
 ```
 vmlinux`struct task_struct * curthread
@@ -295,7 +295,7 @@ vmlinux`struct task_struct * curthread
 
 The built-in variable `curthread` references a `vmlinux` data type, for which members can be found by searching for "task\_struct" on the Internet.
 
-## epid {#dt_ref_var_epid}
+## epid
 
 ```
 uint_t epid
@@ -306,12 +306,12 @@ The built-in variable `epid` references the enabled probe ID \(EPID\) for the cu
 ## errno
 
 ```
-int errno {#dt_ref_var_errno}
+int errno
 ```
 
 The built-in variable `errno` references the error value returned by the last system call run by this thread.
 
-## execname {#dt_ref_var_execname}
+## execname
 
 ```
 string execname
@@ -319,7 +319,7 @@ string execname
 
 The built-in variable `execname` references the name that was passed to `execve()` to run the current process.
 
-## fds {#dt_ref_var_fds}
+## fds
 
 ```
 fileinfo_t fds[]
@@ -327,7 +327,7 @@ fileinfo_t fds[]
 
 The built-in `variable fds[]` is an array which has the files the current process has opened in a `fileinfo_t` array, indexed by file descriptor number. See [fileinfo\_t](dtrace_providers_io.md).
 
-## gid {#dt_ref_var_gid}
+## gid
 
 ```
 gid_t gid
@@ -335,7 +335,7 @@ gid_t gid
 
 The built-in variable `gid` references the real group ID of the current process.
 
-## id {#dt_ref_var_id}
+## id
 
 ```
 uint_t id
@@ -343,7 +343,7 @@ uint_t id
 
 The built-in variable `id` references the probe ID for the current probe. This ID is the system-wide unique identifier for the probe, as published by DTrace and listed in the output of `dtrace -l`.
 
-## ipl {#dt_ref_var_ipl}
+## ipl
 
 ```
 uint_t ipl
@@ -355,7 +355,7 @@ The built-in variable `ipl` references the interrupt priority level \(IPL\) on t
 
 This value is non-zero if interrupts are firing and zero otherwise. The non-zero value depends on whether preemption is active, and other factors, and can vary between kernel releases and kernel configurations.
 
-## pid {#dt_ref_var_pid}
+## pid
 
 ```
 pid_t pid
@@ -363,7 +363,7 @@ pid_t pid
 
 The built-in variable `pid` references the process ID of the current process.
 
-## ppid {#dt_ref_var_ppid}
+## ppid
 
 ```
 pid_t ppid
@@ -371,7 +371,7 @@ pid_t ppid
 
 The built-in variable `ppid` references the parent process ID of the current process.
 
-## probefunc {#dt_ref_var_probefunc}
+## probefunc
 
 ```
 string probefunc
@@ -379,7 +379,7 @@ string probefunc
 
 The built-in variable `probefunc` references the function name part of the current probe's description.
 
-## probemod {#dt_ref_var_probemod}
+## probemod
 
 ```
 string probemod
@@ -387,7 +387,7 @@ string probemod
 
 The built-in variable `probemod` references the module name part of the current probe's description.
 
-## probename {#dt_ref_var_probename}
+## probename
 
 ```
 string probename
@@ -395,7 +395,7 @@ string probename
 
 The built-in variable `probename` references the name part of the current probe's description.
 
-## probeprov {#dt_ref_var_probeprov}
+## probeprov
 
 ```
 string probeprov
@@ -403,7 +403,7 @@ string probeprov
 
 The built-in variable `probeprov` references the provider name part of the current probe's description.
 
-## stackdepth {#dt_ref_var_stackdepth}
+## stackdepth
 
 ```
 uint32_t stackdepth
@@ -411,7 +411,7 @@ uint32_t stackdepth
 
 The built-in variable `stackdepth` references the current thread's stack frame depth at probe firing time.
 
-## tid {#dt_ref_var_tid}
+## tid
 
 ```
 id_t tid
@@ -419,7 +419,7 @@ id_t tid
 
 The built-in variable `tid` references the thread ID of the current thread.
 
-## timestamp {#dt_ref_var_timestamp}
+## timestamp
 
 ```
 uint64_t timestamp
@@ -427,7 +427,7 @@ uint64_t timestamp
 
 The built-in variable `timestamp` references the current value of a nanosecond timestamp counter. This counter increments from an arbitrary point in the past. Therefore, only use the timestamp counter for relative computations.
 
-## ucaller {#dt_ref_var_ucaller}
+## ucaller
 
 ```
 uint64_t ucaller
@@ -435,7 +435,7 @@ uint64_t ucaller
 
 The built-in variable `ucaller` references the program counter location of the current user thread at the time the probe fired.
 
-## uid {#dt_ref_var_uid}
+## uid
 
 ```
 uid_t uid
@@ -443,7 +443,7 @@ uid_t uid
 
 The built-in variable `uid` references the real user ID of the current process.
 
-## uregs {#dt_ref_var_uregs}
+## uregs
 
 ```
 uint64_t uregs[]
@@ -451,7 +451,7 @@ uint64_t uregs[]
 
 The current thread's saved user-mode register values at probe firing time.
 
-## ustackdepth {#dt_ref_var_ustackdepth}
+## ustackdepth
 
 ```
 uint32_t ustackdepth
@@ -459,7 +459,7 @@ uint32_t ustackdepth
 
 The built-in variable `ustackdepth` references the user thread's stack frame depth at probe firing time.
 
-## vtimestamp {#dt_ref_var_vtimestamp}
+## vtimestamp
 
 ```
 uint64_t vtimestamp
@@ -467,7 +467,7 @@ uint64_t vtimestamp
 
 The built-in variable `vtimestamp` references the current value of a nanosecond timestamp counter that's virtualized to the amount of time that the current thread has been running on a CPU, minus the time spent in DTrace predicates and functions. This counter increments from an arbitrary point in the past. Therefore, only use the vtimestamp counter for relative time computations.
 
-## walltimestamp {#dt_ref_var_walltimestamp}
+## walltimestamp
 
 ```
 int64_t walltimestamp
-- 
2.47.3

