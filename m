Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FFD5187FE0
	for <dtrace@lists.linux.dev>; Thu, 30 Jan 2025 22:33:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738276434; cv=fail; b=oVlAFPpR/ILdHHmWT7wh0NC6wwSvESi6/Zw8nt2stSa4rgaokMo2D8ChR/2snt/DdiBFLUMYp/uGEmkN0rSlJn21n+o10892/8MSV18hubL0OYMS0BZG3Wu4AO0+v1oxczO02dlPh6STlgl1BM4ej87FKjdRbWEy005wqY54vjI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738276434; c=relaxed/simple;
	bh=XWr2Ce5fdGp7UHk+l1Y0F18CImtCBPQtLdTpHRsJyDc=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=J1n11BIVFp+RPHbRXaNFM+0dhnea+8x4pY5aMWpEgk8nNX9OFkWtC3bRQ1rnIkjFIFfL9IK9iMOTWECLP/D6Sbd0cxF5fZOCUhWz/M4KPtYnt2Jlg5kkSNJl0F3B3vD+T5D9CkWwXbdgFRor+V8Hib4mTxWIy1WLJ6EDJEHXWGk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=V2hIDlbi; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=Qr45zZYl; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="V2hIDlbi";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="Qr45zZYl"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50UMF5Mv010024
	for <dtrace@lists.linux.dev>; Thu, 30 Jan 2025 22:33:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=gyoxpreqiz4lap3ck9V1HNvwIUUCR774mliUB8QFfjo=; b=
	V2hIDlbiCI7tfekmkfehrtvkGTAdecxerj7HJ1yQMazdOul7xkiQoraBl0nz6XcN
	un5TBLQfJQrDi5rxgFudu45fXSKJsAiKX19ZzI/N9ybWOdhmqLHNNjhU4+vDlhci
	QjixIk4HsuyfMgs14PKbefYFW3uNNiKwkteNrHlCVQ0D4w8BIceRLhA587aajkkv
	PQ1kx8n19Lixbvp/s/qN148omLsCGV1M0CvQxIpJBmB0Z93TBuyIpnh2OhhB8JsH
	VyM2+fz4AsSF8eEorPc8rJeGU4ZI2Xu2ThTiqpUZoa00mGfFssg/t/k/bK7Q6Jhw
	rMeFbOBAshEyQdv4GR84ag==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 44gh6w04fa-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 30 Jan 2025 22:33:51 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 50UM4Ehs032230
	for <dtrace@lists.linux.dev>; Thu, 30 Jan 2025 22:33:50 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2173.outbound.protection.outlook.com [104.47.55.173])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 44gf937qa5-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 30 Jan 2025 22:33:50 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XVGw7dcSI/vqAcUwVRWt6Wdu4d2tSSBSSnbn1xj8f0hEVYPibpIxvz1pO30y9vGLrPfTev8BWI3OdxXVtjURZBHtPGzarO1DYtES84VHP6NwWc4Yt5G3uVlGAb+/aK703RQrPbxBc0cLAqrerVYRd2jXQBdAt4102CENzt1JbGdPUMFZN5HjVefpZwDUO/D2lYddog8IG6xAim3+uniJb9y8AjKicrcx9t3nJ3l3l3RCCHbnVAKVoNax7uTOp41rOIXDMQcBA4CKIexFBXYJVS+MOJJIL0O5FJibZ7Hdb9F6gNe4YxBqWyajGQkzcgxKJC1Dh2TXj2EfkCOvvalzPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gyoxpreqiz4lap3ck9V1HNvwIUUCR774mliUB8QFfjo=;
 b=eAncLOeK5ZiCxrmrZjv+p8PdIvvHY/lsWTrV+cHCoX8zAvtVI3C/Exs3lzf+BNMl0Y6qTYgFSbJWZ1Q+EofVuuZFu0gF/j1cr7USKuopLanx8AvYClbozCSVgXCP4HSFWNvAH7ItAmRqE4lOcnfIR12vOpNPtEXRVjDOS3OB+VIwUe93UGHAZNEshzWL+Y9I22uMbyR+zT2cY2rA4am+IHXXMG3LfjRhYiP5rwTfY83lfi2XkQr8hrAWrYXeAzMnVqzoxxtebk3fPJ/Aj4reZJF75cKCAH0rw/tL3Vtq5MWy7gdmIm3ELCAGgmabavROxUEObt9jR4WkIL8S9WVhyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gyoxpreqiz4lap3ck9V1HNvwIUUCR774mliUB8QFfjo=;
 b=Qr45zZYlTt8AIiDHq4rwtD8rPB2LtVNFc3eFuh4iQbftjSvPD6WnV/+/Dj63sidx2Ak1tgrJFaQhygPIv49rAYkmAQQNYewBjlp6YB5MTh4Iak1BW59Yz2L/xrEefgMX54nzW8OWmki6k68T+lNUecnmOhBbZL5sLu8jZTzF9tY=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by SA1PR10MB6615.namprd10.prod.outlook.com (2603:10b6:806:2b8::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.20; Thu, 30 Jan
 2025 22:33:47 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%7]) with mapi id 15.20.8398.017; Thu, 30 Jan 2025
 22:33:47 +0000
Message-ID: <4b5002a1-1c42-9ab1-92f8-3cbb29368de3@oracle.com>
Date: Thu, 30 Jan 2025 17:33:45 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH 6/6] procfs: populate pr_argc, pr_argv, and pr_envp with
 default values
Content-Language: en-US
To: Kris Van Hees <kris.van.hees@oracle.com>, dtrace@lists.linux.dev,
        dtrace-devel@oss.oracle.com
References: <PH8PR10MB633769A4429BE0BA293C8FE0C2EF2@PH8PR10MB6337.namprd10.prod.outlook.com>
From: Eugene Loh <eugene.loh@oracle.com>
In-Reply-To: <PH8PR10MB633769A4429BE0BA293C8FE0C2EF2@PH8PR10MB6337.namprd10.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR13CA0214.namprd13.prod.outlook.com
 (2603:10b6:a03:2c1::9) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|SA1PR10MB6615:EE_
X-MS-Office365-Filtering-Correlation-Id: a627c655-0f9a-4c6c-ce84-08dd417e28d9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?aGQxbm1nQ1JNektsYmlGZ2lQQ0tsU1A4dWhCVjlWMHM0VXNjTUduWkJGS2Fu?=
 =?utf-8?B?cmpVd1RqTTFJN3dJTXRJMXpadTNteFJPWEJhUG1ubThDN3d0bGNUMmlrSTFC?=
 =?utf-8?B?YWNiUFNQcGs1a0ZyMkZnckdUeklMZWFydjlhTlVLdERrNEpxWno1OS96dU9G?=
 =?utf-8?B?cHVYLzNMblRxRjl5Zmw3SnRYR1dQaHlvcGZjeU1lM3ZRVWdvTGFJOFBUV3F3?=
 =?utf-8?B?eXdVZGNWbTJLc2lRb3lMakxpcFVmRythNlhtL1MvV0pjTW9TMCtVV3pSc2ZY?=
 =?utf-8?B?MjFhQXJheFVweVNPVE1HSXIyRTBrbW1qMldqTEdrTHg0cTVmWlBhUDlFcUhU?=
 =?utf-8?B?aTFwZzU5K1hTRWhZMUVuYjdGWHV2K2FucFFsT2JyS3RSbEFQc2h5dlA5SERW?=
 =?utf-8?B?Qzg1cnlpZjA4cVVWTDNkdkdTSXBaYUJkeDk4dXo3MHlSVnlWWHlYWVVlR0hQ?=
 =?utf-8?B?SlBWMUtuTTNITktNOUs5RXlReHBPUFNXT0ovR0RBcGwvZExZcXhadDBCaWlJ?=
 =?utf-8?B?TFR3K0FjVjd3ZVFRUUdSWjY5QWJibUUzdU1nT0VzWjlsYU9xbjNZT0toRGdR?=
 =?utf-8?B?SUpoZFpFUk9oZW9vU1NOZ1ZITzRwbkl3cEo4K3FkbXpKNEovZHZrcWlxVllX?=
 =?utf-8?B?SXo2aUZrMWh2UVh6aFZKTDM5dHY5Rm9CQzFaVmEzdkNBNERCQ01BbFBuZlI0?=
 =?utf-8?B?TzVQYzQ0U1lqZEVLZ2pVZzVVYTZxbWZPa01EUWZqY3VnSStCbXdGdzIyVmQ0?=
 =?utf-8?B?YVhtcmdPdWlIWlYvYktrd3U3dVp4TVkvRkhteWptVzNxWiszM1RzSHRYR2JV?=
 =?utf-8?B?RWh5UkxEOFpBdWlWTmZKejJWcDFZSzlJWUVwOXNkdzV3alJSZGRlYmMvaUxZ?=
 =?utf-8?B?VTlkVG1pRDYvWXZ2cTBUT05XZEVwdXljblczRjdlZElGcWRHZ3Y3bWdsenpE?=
 =?utf-8?B?bTFLT2krRDkwcmxrWkF6dTdVK2xQcXZMT1VialhQY1pES2xJTi9PMHljR1Ns?=
 =?utf-8?B?RzFXYTlZdjUwc21rL2dFR05FL3VXTXE0QjZCWmtnRTUvdGw5ays1L2daU1R2?=
 =?utf-8?B?MzNtdGlFWURpMHJJQnRGVzRDdTlPeXBicnBtMFU5U0xkbEJ6QUx2bFd4bStl?=
 =?utf-8?B?RnhON05ZdTJZZHlwRzIxNGdhLzVpZ2ZlbVYrQU5mYXhYY3VaUm9nRjd3Q25u?=
 =?utf-8?B?bVhGUVBuQ3UyWmt3eWxoZW4wK3FESGhHTjEzdmtYelM0cks5b2xvRk9RRHhG?=
 =?utf-8?B?T3dkSkREUWhsTFRESW4yZDdvY0hhR252R2hQZ01QTmFYSVlaUU9MSTJZQjVV?=
 =?utf-8?B?S3RzeU5vWDZ0OUxVdkdpbzI2LzZOMzlJajhnMzNCOEI4eXpTTFBVQnRCOHB5?=
 =?utf-8?B?WVU5SWdDYisrcGFSZVJ5M0V0TithUUhTOFk5VG9ISncxd05sWnR4SFNJZjl4?=
 =?utf-8?B?MGthNWI3bEp4dFN0QnpCUThMdVJ0c2F2MDAwSzZBTjJPMkxuNkE4NmVlZFFj?=
 =?utf-8?B?SGwyQ0hEaFFOTElHeGZrZm5KQkJDa3BrRUNWRkJBSm5UbU1qaU1TR2pHenhh?=
 =?utf-8?B?b2JYbEloWXI5ZUFFWllvVkxxNm5mODNpNlkydlpXM0RWREVkcFpMcWxGWmJ2?=
 =?utf-8?B?RnRaZkNibmtOaHl0cmRkMVdsRFBGaElpMmd6am10ZThVZ3M5S2NOOXdCTW9t?=
 =?utf-8?B?TDVNNTM3dlNHV1JBRzFoRkVpVW42MTY4aFIyalhYY3UxMGVYbFpxWkJtOEVK?=
 =?utf-8?B?SDhFUW44YWpXSXQyeER1NGQ3Q0ZaWDBrTThqNkFPanl6cmxqelNPNWg3dlY5?=
 =?utf-8?B?eDlvTXc3UldSa2ZOc1dEQT09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aVdRQ0NMaEIyTVFiLyt3eW8xVkliUWJBZURMOE82ckdBTTdOMWJySEh2WHJU?=
 =?utf-8?B?VDJEdDZkTjh5WXoxTkxJMENpdmJYeks2ekNiMjF1QVhOdFBBVnByd2tSTHZ4?=
 =?utf-8?B?U3hDakJTSXRZeldwQkxsL1J6bmRZclc4eVdSeEpnZUh2RUMrS2V1V0UxbGto?=
 =?utf-8?B?UUxmUzF2ejNTN3VFMC9ybVpzeHE1VHVxRXNScHh1U2Rva1phQ3BPcE5nakZr?=
 =?utf-8?B?Y1JUa3lwaE9JcHRqQnZDNzAwZm4veVlWQnVEOUtmSHp4NFBPdmZUSE5qVzRx?=
 =?utf-8?B?cWpqOVRCU1AxNlRiWXN6T1lVVERITnpzU2hZNHNodjdSZ0VVZjZ0OExtVjFU?=
 =?utf-8?B?aGpiQ09XVHNFNElOVE9yQ1ZXU2xlNC94RndILytKOUtZSk1lLzM0RHdVUUZ2?=
 =?utf-8?B?NW5aVGdxQnFGNno5UHZ4SEZpbENvRVVKTnpDc2lnckJ3MEFqdzEremFpK2Zn?=
 =?utf-8?B?ZkQ0Uld6RVc1ZDg1VzJtVSs2MDNnV3hUdWlXRjlOMUNuWUxBWWVDeWo4aUhP?=
 =?utf-8?B?eDZmMlFzZWpIUy9nM0M3NVVtWG1aY2p5VTJiMmZPWTVXQVRuZjgraWYrM0hm?=
 =?utf-8?B?VnhHS1pqUFlyc0VON2Jpam9VWDV5eVRPUWtOVlNjSmVNdVhIY3AreXlRd2Zm?=
 =?utf-8?B?SVpZU0pranZMMjJkT0dQYmcwTkMvTzVVUEVGbndLSC9FV2VDSUJSMlBWd1V5?=
 =?utf-8?B?b0p2UytUaWdPWStvLzZobFdSd1VzM2s5QUVKajZsbE5CTjNzd0Y5SFdiTUNH?=
 =?utf-8?B?ZGdlckxNZDBNUlNQaHg5V0M3cUp6YjF2R3FJNU1jSi8wa2FwUGdrK25pV1VD?=
 =?utf-8?B?bUh2cEdqNXBZeVdOaFJGenNVQTFJQnpVQlpHTmsxNFRGQVRraWkzVURqMERD?=
 =?utf-8?B?REdmQklMZTRJSFdLSGRpSjZHT0w1WTFBdHVTOFdBL2VWbFdxMFhndEQ1VHZT?=
 =?utf-8?B?U1hTU2hoL0VNTDY2ZUZzbjVyWnNWM1FKMGFsVklETU93Ty9zL3ZPOWlPK1h3?=
 =?utf-8?B?NE54MlE0N3ZCeTdSaWV5dDJ3SnQ3TnZZYkVIdDNMcmp2d014OHlxdEZTbHFU?=
 =?utf-8?B?UFNjMC9CS0NXcmR2R204bkFPNnFmZk55QXE5S3dadi92VjJwV0djMEMxSkhH?=
 =?utf-8?B?R0RDdTd2REhpcGV2WlhuV2FVczdSRjhuZm1Xd2VYMllOMHUwRG12a051RnZp?=
 =?utf-8?B?dUw3alRaQmFjZ0x2bm9vclNlRUJvUGkzTG5ldFFRWkNuTTlJQitHS0dSNnI4?=
 =?utf-8?B?UUoxMVJ3TlJ0SUZQQXkzMzdyVmFlL1loR2ozWER6a1FZOTZ5a1lZRXg0UDVG?=
 =?utf-8?B?bG0xcnluWGlPcGZCM3k1N2tZNHg5aW42dkpDRDBjZk1LMVAyczlJRmRIbW4v?=
 =?utf-8?B?cXNoU2ptSlZGaEh6VGFCdTdrSmo0MjJ0Vkd0a3JqSDI5ZlVGSllSekt1Nloy?=
 =?utf-8?B?ZlJLYWJ3NXJHcTlnR2w3SWtlbS9GWmxjdCt4YmVGNnBwcWlpRFBvWlhFN0k5?=
 =?utf-8?B?UEdnWjRMM1YvUnhraDdMZFE4QVlQZklqTnpDZ0tKUjZxZmhucUpmNC9tekNv?=
 =?utf-8?B?N0lpbHJOOU1wZk5qakd5VzcxeHdpd2FqQjdPMW0rNUc2cFpWV3F1SmNEL3pJ?=
 =?utf-8?B?dTh2T3pyYWxlS2hUTDZnRlhmOHhPUWZMWXpQRzdMMXEzdTMyRzlsNFFQMlJ6?=
 =?utf-8?B?bHZJck12ZjB5MklmRlErOFU5cVhvQVF4bFB1SUVOWlhWNmdQTHVLam00ZzU5?=
 =?utf-8?B?UFp2YU44cTFhK0d5cjRsY3lTMjI3VTNCSzZ1REkrVG9FL08xSmtycHByaHFB?=
 =?utf-8?B?OTJQQW41UG1FU09qS1pSQmI0TlVUQjhReXhJek5pcHNqRXp2dEVMWFdOM2Vv?=
 =?utf-8?B?QnllWVZoVmlLb1FUN1YyMThBTFVPaG5jM2g2RlkxeFpMOHBvQnZBemZtVk1B?=
 =?utf-8?B?c3llUmtVbmY5dUZEVXJPQXR5akdGam1hRDU2U3N2SWNwL3g3bVk2MmRYSXQ0?=
 =?utf-8?B?TGxQYVJwNzhnazk5bVFqWjVsQVl4SVQ0bXVXSHhCem51MlMxRE9PVlJORThX?=
 =?utf-8?B?QWxqZnhHNFBqeURQMFVCMEtPc1F0MUhXVS9IUGk4eEI2cjFIbTQ4ekZLeU9L?=
 =?utf-8?Q?FsAZbBWvc7foZ3G2Y7FUu+DGD?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	yPyLbTdTfIHJFbZKAec719XnNPhSeFCfaXaehCsNwd4izArNHMTInkpgajT53Qjf0XxiownJDAagU7DalL8yzBgaPuA0v0ISRi2h+64mWf55nYs8zxPIOkrKqUKgW4GvFbkRyBhAvpVtpqER4w8L1jQCtYk+cU6/2Ow5bezbWALP8QfyJ+EiPnclsdBoq0QgErRLANh4/YH+DLEDjNH3DW6y78WHU/nwJSxv+iIXJUZ6MYD/fmQFnsUQOUahdYmCXiKcOXWu9mHuI1aq+0okVR8+htPsNN765IWFxxggBzPHT4cTXcK8O7EpTvQCRPi1PhitAAEpdcPByraY3RnDIWpLN2S3KXeppUgxU5rp5R/KDRUZf/nc8ihQSQdfAbkVq/MwSEtQ6rk2UhHlABNNZ9inFzomMVox56AjE/ADghV7oRwLzHBYUm4x/2DdjLLmWKInJWKYsW788PMLn5XnXk2N4bke+R50wSaysSJ+Q7gZ1Qnzb/T2DgynLTdt/g55uvW9mUbkhM5U0rSyHxgzYb1VltBfxhEOxxldl77f/EC7COIdKQuWlKbY3TVSBlF4l6hpb1ZCszCkxtxNHMi66yo4sEN3jJxDwSlafE2hxwk=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a627c655-0f9a-4c6c-ce84-08dd417e28d9
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2025 22:33:47.3782
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TQMdShkxdn8hiEChJzy7XY3cdSaWSukBTMMS1IQUDyKBWoRBoHTFOAL/+tGBQ5BgN/3bKD8Tk2I4yk/TxHGsYA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR10MB6615
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-30_09,2025-01-30_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 adultscore=0 mlxscore=0
 suspectscore=0 spamscore=0 phishscore=0 malwarescore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2501170000
 definitions=main-2501300175
X-Proofpoint-ORIG-GUID: p3PPk2mJUy6oug2srnW3L5PFaV5Zgo2e
X-Proofpoint-GUID: p3PPk2mJUy6oug2srnW3L5PFaV5Zgo2e

My main question is how it is better to provide incorrect results than 
it is not to have implemented this functionality?  How about just 
waiting until we implement this functionality?  Isn't it better that a 
user is told that we haven't implemented this stuff rather than give 
them results that are incorrect?

It is odd that XFAIL is being lifted when we are producing incorrect 
output, but I suppose that is the burden of some other test/s.  So, okay.

Meanwhile, XFAIL is being lifted for
test/unittest/builtinvar/tst.psinfo-bug21974606.d
even though that change should probably actually appear in an earlier patch,
"procfs: implement d_execargs() for pr_psargs translator support", where 
it starts to XPASS since it depends only on ps_args and not on any of 
the fields handled in the current patch.

On 1/28/25 01:31, Kris Van Hees wrote:
> The pr_argc, pr_argv, and pr_envp fields in psinfo are not implemented
> yet, so it makes sense to set them to 0 rather than not providing any
> translator for them.
>
> Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
> ---
>   dlibs/aarch64/5.11/procfs.d                       | 8 +++-----
>   dlibs/aarch64/5.12/procfs.d                       | 8 +++-----
>   dlibs/aarch64/5.14/procfs.d                       | 8 +++-----
>   dlibs/aarch64/5.16/procfs.d                       | 8 +++-----
>   dlibs/aarch64/5.2/procfs.d                        | 8 +++-----
>   dlibs/aarch64/5.6/procfs.d                        | 8 +++-----
>   dlibs/aarch64/6.1/procfs.d                        | 8 +++-----
>   dlibs/aarch64/6.10/procfs.d                       | 8 +++-----
>   dlibs/x86_64/5.11/procfs.d                        | 8 +++-----
>   dlibs/x86_64/5.12/procfs.d                        | 8 +++-----
>   dlibs/x86_64/5.14/procfs.d                        | 8 +++-----
>   dlibs/x86_64/5.16/procfs.d                        | 8 +++-----
>   dlibs/x86_64/5.2/procfs.d                         | 8 +++-----
>   dlibs/x86_64/5.6/procfs.d                         | 8 +++-----
>   dlibs/x86_64/6.1/procfs.d                         | 8 +++-----
>   dlibs/x86_64/6.10/procfs.d                        | 8 +++-----
>   libdtrace/procfs.d.in                             | 8 +++-----
>   test/unittest/builtinvar/tst.psinfo-bug21974606.d | 1 -
>   test/unittest/builtinvar/tst.psinfo-bug22561297.d | 4 +---
>   test/unittest/builtinvar/tst.psinfo1.d            | 1 -
>   20 files changed, 52 insertions(+), 90 deletions(-)
>
> diff --git a/dlibs/aarch64/5.11/procfs.d b/dlibs/aarch64/5.11/procfs.d
> index 9c06fe1f..52b2bbe2 100644
> --- a/dlibs/aarch64/5.11/procfs.d
> +++ b/dlibs/aarch64/5.11/procfs.d
> @@ -143,11 +143,9 @@ translator psinfo_t < struct task_struct *T > {
>   	pr_fname = T->comm;
>   	pr_psargs = d_execargs(T);
>   	pr_wstat = 0;
> -/*
> -	pr_argc = get_psinfo(T)->__psinfo(argc);
> -	pr_argv = (uintptr_t)get_psinfo(T)->__psinfo(argv);
> -	pr_envp = (uintptr_t)get_psinfo(T)->__psinfo(envp);
> - */
> +	pr_argc = 0;			/* Not implemented yet. */
> +	pr_argv = 0;			/* Not implemented yet. */
> +	pr_envp = 0;			/* Not implemented yet. */
>   
>   	pr_dmodel = PR_MODEL_LP64;
>   
> diff --git a/dlibs/aarch64/5.12/procfs.d b/dlibs/aarch64/5.12/procfs.d
> index 9c06fe1f..52b2bbe2 100644
> --- a/dlibs/aarch64/5.12/procfs.d
> +++ b/dlibs/aarch64/5.12/procfs.d
> @@ -143,11 +143,9 @@ translator psinfo_t < struct task_struct *T > {
>   	pr_fname = T->comm;
>   	pr_psargs = d_execargs(T);
>   	pr_wstat = 0;
> -/*
> -	pr_argc = get_psinfo(T)->__psinfo(argc);
> -	pr_argv = (uintptr_t)get_psinfo(T)->__psinfo(argv);
> -	pr_envp = (uintptr_t)get_psinfo(T)->__psinfo(envp);
> - */
> +	pr_argc = 0;			/* Not implemented yet. */
> +	pr_argv = 0;			/* Not implemented yet. */
> +	pr_envp = 0;			/* Not implemented yet. */
>   
>   	pr_dmodel = PR_MODEL_LP64;
>   
> diff --git a/dlibs/aarch64/5.14/procfs.d b/dlibs/aarch64/5.14/procfs.d
> index 2824d137..8c05e299 100644
> --- a/dlibs/aarch64/5.14/procfs.d
> +++ b/dlibs/aarch64/5.14/procfs.d
> @@ -143,11 +143,9 @@ translator psinfo_t < struct task_struct *T > {
>   	pr_fname = T->comm;
>   	pr_psargs = d_execargs(T);
>   	pr_wstat = 0;
> -/*
> -	pr_argc = get_psinfo(T)->__psinfo(argc);
> -	pr_argv = (uintptr_t)get_psinfo(T)->__psinfo(argv);
> -	pr_envp = (uintptr_t)get_psinfo(T)->__psinfo(envp);
> - */
> +	pr_argc = 0;			/* Not implemented yet. */
> +	pr_argv = 0;			/* Not implemented yet. */
> +	pr_envp = 0;			/* Not implemented yet. */
>   
>   	pr_dmodel = PR_MODEL_LP64;
>   
> diff --git a/dlibs/aarch64/5.16/procfs.d b/dlibs/aarch64/5.16/procfs.d
> index daf30745..e52ab29a 100644
> --- a/dlibs/aarch64/5.16/procfs.d
> +++ b/dlibs/aarch64/5.16/procfs.d
> @@ -143,11 +143,9 @@ translator psinfo_t < struct task_struct *T > {
>   	pr_fname = T->comm;
>   	pr_psargs = d_execargs(T);
>   	pr_wstat = 0;
> -/*
> -	pr_argc = get_psinfo(T)->__psinfo(argc);
> -	pr_argv = (uintptr_t)get_psinfo(T)->__psinfo(argv);
> -	pr_envp = (uintptr_t)get_psinfo(T)->__psinfo(envp);
> - */
> +	pr_argc = 0;			/* Not implemented yet. */
> +	pr_argv = 0;			/* Not implemented yet. */
> +	pr_envp = 0;			/* Not implemented yet. */
>   
>   	pr_dmodel = PR_MODEL_LP64;
>   
> diff --git a/dlibs/aarch64/5.2/procfs.d b/dlibs/aarch64/5.2/procfs.d
> index 3594e5e9..4a95dfd1 100644
> --- a/dlibs/aarch64/5.2/procfs.d
> +++ b/dlibs/aarch64/5.2/procfs.d
> @@ -143,11 +143,9 @@ translator psinfo_t < struct task_struct *T > {
>   	pr_fname = T->comm;
>   	pr_psargs = d_execargs(T);
>   	pr_wstat = 0;
> -/*
> -	pr_argc = get_psinfo(T)->__psinfo(argc);
> -	pr_argv = (uintptr_t)get_psinfo(T)->__psinfo(argv);
> -	pr_envp = (uintptr_t)get_psinfo(T)->__psinfo(envp);
> - */
> +	pr_argc = 0;			/* Not implemented yet. */
> +	pr_argv = 0;			/* Not implemented yet. */
> +	pr_envp = 0;			/* Not implemented yet. */
>   
>   	pr_dmodel = PR_MODEL_LP64;
>   
> diff --git a/dlibs/aarch64/5.6/procfs.d b/dlibs/aarch64/5.6/procfs.d
> index 9c06fe1f..52b2bbe2 100644
> --- a/dlibs/aarch64/5.6/procfs.d
> +++ b/dlibs/aarch64/5.6/procfs.d
> @@ -143,11 +143,9 @@ translator psinfo_t < struct task_struct *T > {
>   	pr_fname = T->comm;
>   	pr_psargs = d_execargs(T);
>   	pr_wstat = 0;
> -/*
> -	pr_argc = get_psinfo(T)->__psinfo(argc);
> -	pr_argv = (uintptr_t)get_psinfo(T)->__psinfo(argv);
> -	pr_envp = (uintptr_t)get_psinfo(T)->__psinfo(envp);
> - */
> +	pr_argc = 0;			/* Not implemented yet. */
> +	pr_argv = 0;			/* Not implemented yet. */
> +	pr_envp = 0;			/* Not implemented yet. */
>   
>   	pr_dmodel = PR_MODEL_LP64;
>   
> diff --git a/dlibs/aarch64/6.1/procfs.d b/dlibs/aarch64/6.1/procfs.d
> index 2d52f079..4881aa5b 100644
> --- a/dlibs/aarch64/6.1/procfs.d
> +++ b/dlibs/aarch64/6.1/procfs.d
> @@ -143,11 +143,9 @@ translator psinfo_t < struct task_struct *T > {
>   	pr_fname = T->comm;
>   	pr_psargs = d_execargs(T);
>   	pr_wstat = 0;
> -/*
> -	pr_argc = get_psinfo(T)->__psinfo(argc);
> -	pr_argv = (uintptr_t)get_psinfo(T)->__psinfo(argv);
> -	pr_envp = (uintptr_t)get_psinfo(T)->__psinfo(envp);
> - */
> +	pr_argc = 0;			/* Not implemented yet. */
> +	pr_argv = 0;			/* Not implemented yet. */
> +	pr_envp = 0;			/* Not implemented yet. */
>   
>   	pr_dmodel = PR_MODEL_LP64;
>   
> diff --git a/dlibs/aarch64/6.10/procfs.d b/dlibs/aarch64/6.10/procfs.d
> index 2d52f079..4881aa5b 100644
> --- a/dlibs/aarch64/6.10/procfs.d
> +++ b/dlibs/aarch64/6.10/procfs.d
> @@ -143,11 +143,9 @@ translator psinfo_t < struct task_struct *T > {
>   	pr_fname = T->comm;
>   	pr_psargs = d_execargs(T);
>   	pr_wstat = 0;
> -/*
> -	pr_argc = get_psinfo(T)->__psinfo(argc);
> -	pr_argv = (uintptr_t)get_psinfo(T)->__psinfo(argv);
> -	pr_envp = (uintptr_t)get_psinfo(T)->__psinfo(envp);
> - */
> +	pr_argc = 0;			/* Not implemented yet. */
> +	pr_argv = 0;			/* Not implemented yet. */
> +	pr_envp = 0;			/* Not implemented yet. */
>   
>   	pr_dmodel = PR_MODEL_LP64;
>   
> diff --git a/dlibs/x86_64/5.11/procfs.d b/dlibs/x86_64/5.11/procfs.d
> index 7679db2e..96e55dc1 100644
> --- a/dlibs/x86_64/5.11/procfs.d
> +++ b/dlibs/x86_64/5.11/procfs.d
> @@ -143,11 +143,9 @@ translator psinfo_t < struct task_struct *T > {
>   	pr_fname = T->comm;
>   	pr_psargs = d_execargs(T);
>   	pr_wstat = 0;
> -/*
> -	pr_argc = get_psinfo(T)->__psinfo(argc);
> -	pr_argv = (uintptr_t)get_psinfo(T)->__psinfo(argv);
> -	pr_envp = (uintptr_t)get_psinfo(T)->__psinfo(envp);
> - */
> +	pr_argc = 0;			/* Not implemented yet. */
> +	pr_argv = 0;			/* Not implemented yet. */
> +	pr_envp = 0;			/* Not implemented yet. */
>   
>   	pr_dmodel = PR_MODEL_LP64;
>   
> diff --git a/dlibs/x86_64/5.12/procfs.d b/dlibs/x86_64/5.12/procfs.d
> index 7679db2e..96e55dc1 100644
> --- a/dlibs/x86_64/5.12/procfs.d
> +++ b/dlibs/x86_64/5.12/procfs.d
> @@ -143,11 +143,9 @@ translator psinfo_t < struct task_struct *T > {
>   	pr_fname = T->comm;
>   	pr_psargs = d_execargs(T);
>   	pr_wstat = 0;
> -/*
> -	pr_argc = get_psinfo(T)->__psinfo(argc);
> -	pr_argv = (uintptr_t)get_psinfo(T)->__psinfo(argv);
> -	pr_envp = (uintptr_t)get_psinfo(T)->__psinfo(envp);
> - */
> +	pr_argc = 0;			/* Not implemented yet. */
> +	pr_argv = 0;			/* Not implemented yet. */
> +	pr_envp = 0;			/* Not implemented yet. */
>   
>   	pr_dmodel = PR_MODEL_LP64;
>   
> diff --git a/dlibs/x86_64/5.14/procfs.d b/dlibs/x86_64/5.14/procfs.d
> index 3a348ebc..8dbf3c01 100644
> --- a/dlibs/x86_64/5.14/procfs.d
> +++ b/dlibs/x86_64/5.14/procfs.d
> @@ -143,11 +143,9 @@ translator psinfo_t < struct task_struct *T > {
>   	pr_fname = T->comm;
>   	pr_psargs = d_execargs(T);
>   	pr_wstat = 0;
> -/*
> -	pr_argc = get_psinfo(T)->__psinfo(argc);
> -	pr_argv = (uintptr_t)get_psinfo(T)->__psinfo(argv);
> -	pr_envp = (uintptr_t)get_psinfo(T)->__psinfo(envp);
> - */
> +	pr_argc = 0;			/* Not implemented yet. */
> +	pr_argv = 0;			/* Not implemented yet. */
> +	pr_envp = 0;			/* Not implemented yet. */
>   
>   	pr_dmodel = PR_MODEL_LP64;
>   
> diff --git a/dlibs/x86_64/5.16/procfs.d b/dlibs/x86_64/5.16/procfs.d
> index daf30745..e52ab29a 100644
> --- a/dlibs/x86_64/5.16/procfs.d
> +++ b/dlibs/x86_64/5.16/procfs.d
> @@ -143,11 +143,9 @@ translator psinfo_t < struct task_struct *T > {
>   	pr_fname = T->comm;
>   	pr_psargs = d_execargs(T);
>   	pr_wstat = 0;
> -/*
> -	pr_argc = get_psinfo(T)->__psinfo(argc);
> -	pr_argv = (uintptr_t)get_psinfo(T)->__psinfo(argv);
> -	pr_envp = (uintptr_t)get_psinfo(T)->__psinfo(envp);
> - */
> +	pr_argc = 0;			/* Not implemented yet. */
> +	pr_argv = 0;			/* Not implemented yet. */
> +	pr_envp = 0;			/* Not implemented yet. */
>   
>   	pr_dmodel = PR_MODEL_LP64;
>   
> diff --git a/dlibs/x86_64/5.2/procfs.d b/dlibs/x86_64/5.2/procfs.d
> index 6ad926ee..23e05c2c 100644
> --- a/dlibs/x86_64/5.2/procfs.d
> +++ b/dlibs/x86_64/5.2/procfs.d
> @@ -143,11 +143,9 @@ translator psinfo_t < struct task_struct *T > {
>   	pr_fname = T->comm;
>   	pr_psargs = d_execargs(T);
>   	pr_wstat = 0;
> -/*
> -	pr_argc = get_psinfo(T)->__psinfo(argc);
> -	pr_argv = (uintptr_t)get_psinfo(T)->__psinfo(argv);
> -	pr_envp = (uintptr_t)get_psinfo(T)->__psinfo(envp);
> - */
> +	pr_argc = 0;			/* Not implemented yet. */
> +	pr_argv = 0;			/* Not implemented yet. */
> +	pr_envp = 0;			/* Not implemented yet. */
>   
>   	pr_dmodel = PR_MODEL_LP64;
>   
> diff --git a/dlibs/x86_64/5.6/procfs.d b/dlibs/x86_64/5.6/procfs.d
> index 7679db2e..96e55dc1 100644
> --- a/dlibs/x86_64/5.6/procfs.d
> +++ b/dlibs/x86_64/5.6/procfs.d
> @@ -143,11 +143,9 @@ translator psinfo_t < struct task_struct *T > {
>   	pr_fname = T->comm;
>   	pr_psargs = d_execargs(T);
>   	pr_wstat = 0;
> -/*
> -	pr_argc = get_psinfo(T)->__psinfo(argc);
> -	pr_argv = (uintptr_t)get_psinfo(T)->__psinfo(argv);
> -	pr_envp = (uintptr_t)get_psinfo(T)->__psinfo(envp);
> - */
> +	pr_argc = 0;			/* Not implemented yet. */
> +	pr_argv = 0;			/* Not implemented yet. */
> +	pr_envp = 0;			/* Not implemented yet. */
>   
>   	pr_dmodel = PR_MODEL_LP64;
>   
> diff --git a/dlibs/x86_64/6.1/procfs.d b/dlibs/x86_64/6.1/procfs.d
> index 2d52f079..4881aa5b 100644
> --- a/dlibs/x86_64/6.1/procfs.d
> +++ b/dlibs/x86_64/6.1/procfs.d
> @@ -143,11 +143,9 @@ translator psinfo_t < struct task_struct *T > {
>   	pr_fname = T->comm;
>   	pr_psargs = d_execargs(T);
>   	pr_wstat = 0;
> -/*
> -	pr_argc = get_psinfo(T)->__psinfo(argc);
> -	pr_argv = (uintptr_t)get_psinfo(T)->__psinfo(argv);
> -	pr_envp = (uintptr_t)get_psinfo(T)->__psinfo(envp);
> - */
> +	pr_argc = 0;			/* Not implemented yet. */
> +	pr_argv = 0;			/* Not implemented yet. */
> +	pr_envp = 0;			/* Not implemented yet. */
>   
>   	pr_dmodel = PR_MODEL_LP64;
>   
> diff --git a/dlibs/x86_64/6.10/procfs.d b/dlibs/x86_64/6.10/procfs.d
> index 2d52f079..4881aa5b 100644
> --- a/dlibs/x86_64/6.10/procfs.d
> +++ b/dlibs/x86_64/6.10/procfs.d
> @@ -143,11 +143,9 @@ translator psinfo_t < struct task_struct *T > {
>   	pr_fname = T->comm;
>   	pr_psargs = d_execargs(T);
>   	pr_wstat = 0;
> -/*
> -	pr_argc = get_psinfo(T)->__psinfo(argc);
> -	pr_argv = (uintptr_t)get_psinfo(T)->__psinfo(argv);
> -	pr_envp = (uintptr_t)get_psinfo(T)->__psinfo(envp);
> - */
> +	pr_argc = 0;			/* Not implemented yet. */
> +	pr_argv = 0;			/* Not implemented yet. */
> +	pr_envp = 0;			/* Not implemented yet. */
>   
>   	pr_dmodel = PR_MODEL_LP64;
>   
> diff --git a/libdtrace/procfs.d.in b/libdtrace/procfs.d.in
> index 827d6b81..d4433be4 100644
> --- a/libdtrace/procfs.d.in
> +++ b/libdtrace/procfs.d.in
> @@ -181,11 +181,9 @@ translator psinfo_t < struct task_struct *T > {
>   	pr_fname = T->comm;
>   	pr_psargs = d_execargs(T);
>   	pr_wstat = 0;
> -/*
> -	pr_argc = get_psinfo(T)->__psinfo(argc);
> -	pr_argv = (uintptr_t)get_psinfo(T)->__psinfo(argv);
> -	pr_envp = (uintptr_t)get_psinfo(T)->__psinfo(envp);
> - */
> +	pr_argc = 0;			/* not implemented yet */
> +	pr_argv = 0;			/* not implemented yet */
> +	pr_envp = 0;			/* not implemented yet */
>   
>   	pr_dmodel = PR_MODEL_LP64;
>   
> diff --git a/test/unittest/builtinvar/tst.psinfo-bug21974606.d b/test/unittest/builtinvar/tst.psinfo-bug21974606.d
> index 68d9503d..03857e83 100644
> --- a/test/unittest/builtinvar/tst.psinfo-bug21974606.d
> +++ b/test/unittest/builtinvar/tst.psinfo-bug21974606.d
> @@ -4,7 +4,6 @@
>    * Licensed under the Universal Permissive License v 1.0 as shown at
>    * http://oss.oracle.com/licenses/upl.
>    */
> -/* @@xfail: dtv2 */
>   
>   /*
>    * ASSERTION:
> diff --git a/test/unittest/builtinvar/tst.psinfo-bug22561297.d b/test/unittest/builtinvar/tst.psinfo-bug22561297.d
> index b9efd0ec..ffccf469 100644
> --- a/test/unittest/builtinvar/tst.psinfo-bug22561297.d
> +++ b/test/unittest/builtinvar/tst.psinfo-bug22561297.d
> @@ -4,11 +4,9 @@
>    * Licensed under the Universal Permissive License v 1.0 as shown at
>    * http://oss.oracle.com/licenses/upl.
>    */
> -/* @@xfail: dtv2 */
>   
>   /*
> - * ASSERTION:
> - * To print psinfo structure values from profile.
> + * ASSERTION: To print psinfo structure values from profile.
>    *
>    * SECTION: Variables/Built-in Variables
>    */
> diff --git a/test/unittest/builtinvar/tst.psinfo1.d b/test/unittest/builtinvar/tst.psinfo1.d
> index 9e6d5053..7c451598 100644
> --- a/test/unittest/builtinvar/tst.psinfo1.d
> +++ b/test/unittest/builtinvar/tst.psinfo1.d
> @@ -4,7 +4,6 @@
>    * Licensed under the Universal Permissive License v 1.0 as shown at
>    * http://oss.oracle.com/licenses/upl.
>    */
> -/* @@xfail: dtv2 */
>   
>   /*
>    * ASSERTION:
