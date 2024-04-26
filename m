Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B95313D2B7
	for <dtrace@lists.linux.dev>; Fri, 26 Apr 2024 15:57:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714147058; cv=fail; b=Er1Mowy0IpPJf354YeGn1zDd1mQ068VA2djJ9Q4N6kY0d+rpGWQk826F6tnjMTjhHruqAvOzyx86UTc3/u14/oHy2IJVN1gd1W65LweCo68KPePCjb1K8LPhLl8aACeSZdrS3tv4kNDba/3wAaj/+/kT/licD1KtC6zi38gU+eM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714147058; c=relaxed/simple;
	bh=E0ocg3+VvVx3vv0CjlthO5pCPoZupRcFTdXFeVFQO7c=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=MelLUUmFUsMOyI66f/mCL3oIZlIdFp4y+cEf6aJ3OEGEXmKOE+rW+TN2m/AK85sAj5Zhqa4VKeYxrsxp242iOCwnsFbXfs4SKy3M8q+mbSa0UmMbBieZA4ILjxjsTOtC2jzWE/2iet49+t5jHqhUFX4kmKMiST+ZMJyFh02vrQY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=FrczT+Ms; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=kLQvjJiU; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="FrczT+Ms";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="kLQvjJiU"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 43Q8SqcU025071
	for <dtrace@lists.linux.dev>; Fri, 26 Apr 2024 15:57:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2023-11-20;
 bh=8HXAS/QeDI6XRJdzbIn8BvJK3EasDWj5EueBlB2xSjU=;
 b=FrczT+MscsKEoB1JLi5wmmJnCNSyZbCisR1rJ4E8/iLLnlIMGIidBAieDXppYwo7sk61
 bwZKK1qKazaPgGuGoZtWAPy17go6fFUMRiQK8grnczqQkXRiXhLoXS6E0hJjEEyO+raP
 yJz/UIUGSkfV/bbiYq20UqLySnhYbhcTYthjRmp7wOliKDItrfzvVolsAEfNmsTKj0aG
 MD1K5dOazcZUq0pUO8QXIbJ/SDO2dON+8txmoVBSuuWddfDDdzMr70wC8T72DMC15hzV
 K7TUmLk5YrO75SCJev2Z3FVJ0Z57Z8+pCn1NsGDDTL/6/KQEgYGraS8FTkxWloEPU8vQ Zw== 
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3xm4g4nthj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 26 Apr 2024 15:57:35 +0000
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 43QF1aj7030934
	for <dtrace@lists.linux.dev>; Fri, 26 Apr 2024 15:57:34 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2040.outbound.protection.outlook.com [104.47.66.40])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 3xm45bu9pt-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 26 Apr 2024 15:57:34 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TZUx/7K99GgeBcw8a1Kmp4dUfzuJZwb+XaB0XHFzwCL64bYwY4VTODNBIX5rMzqYTZbENikPU1UfRnnD6ctYcdBmYCQyNI9vH+XgWIVQMOO1TZ0MrgglBWKDt4BSWo5jdrYUY7WJoOofdONTOfJa11Ol2JetaRV0IbzEhVJbCA3x9Zraxxfzo1nfR8bpvC2ChSq+faDlpD2RYraHbGdJJ+EtMWAWvNm8+X8b8iZTKsMgNtR/fBNbDeXEBpw3842vLSK91vfbIokvmIcfwFiRg6sn1+2tzzD881es2SmQrsZbwBy9RFkXTnffx+mQb0XsHlV1bQh08q74fU8UXpQgYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8HXAS/QeDI6XRJdzbIn8BvJK3EasDWj5EueBlB2xSjU=;
 b=Bxjdpz+AXQ62b4Z2Og0juGNjSb57cMXy+W8oFzM1fTSFj9xwxbjQQeHg7zG1HscE5W6Upf31+I8SF2OusDWKS/EqEP3HQFJ+YTGk4fbksHB6E4GB+FRJCuvlZCaq2r1Hk/X9rBNytgPDLQXkCPwJcwO5Xc9foOPa6J38rSATQ+OlyLo137E1A8uA/Ignx7l6wyOV3GilbscaVDZZWwAI3Q40Usjq6gm5jyqsxIQQfu3EskfpYG/YRQjF6wGf8u2UBKShzHomVIsXpZ87tRPgvQh+oM8uQWMZY+LS3HcoysNS1HcwYtaaZr7MW8+A6mph4EM77NqGl2FsBVvas4Sb6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8HXAS/QeDI6XRJdzbIn8BvJK3EasDWj5EueBlB2xSjU=;
 b=kLQvjJiUcMMgzxEGn1+yB1LkaNSjXeR+Up/3KgIdVE+U/B826/5HALjppiOqYc2fUsNtMJSlTQEB8C9P9Ee8Ve9HW0FMwpDwWrOnwdPaM2df/C8TkCVdmBs+GIAB9lsQelDkvep6hth6Rt9GIf+HwIR/ZFdTqg4A+86NW2u5MrI=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by IA1PR10MB7540.namprd10.prod.outlook.com (2603:10b6:208:445::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.44; Fri, 26 Apr
 2024 15:57:31 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::880a:3c23:a6e1:3b65]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::880a:3c23:a6e1:3b65%4]) with mapi id 15.20.7519.030; Fri, 26 Apr 2024
 15:57:31 +0000
Message-ID: <6b7ed9a1-f9d7-4827-cef9-a910f3265f8d@oracle.com>
Date: Fri, 26 Apr 2024 11:57:28 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH] libcommon: disable _FORTIFY_SOURCE
Content-Language: en-US
To: dtrace@lists.linux.dev
Cc: dtrace-devel@oss.oracle.com
References: <20240425164057.420580-1-nick.alcock@oracle.com>
 <673c27a1-c879-0c38-643f-bd117c476009@oracle.com>
 <875xw4mkd0.fsf@esperi.org.uk>
From: Eugene Loh <eugene.loh@oracle.com>
In-Reply-To: <875xw4mkd0.fsf@esperi.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: DS7PR03CA0199.namprd03.prod.outlook.com
 (2603:10b6:5:3b6::24) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|IA1PR10MB7540:EE_
X-MS-Office365-Filtering-Correlation-Id: 35b7bded-d2d9-47ea-f7fc-08dc66099460
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?ZUk1VmVvUGU0Z2VUdzRhNllCNUNmSVNWaTVzWCtBWnF1Wjhjb2VDRUxiSlkr?=
 =?utf-8?B?V0VPZS82dzdmeHZYTzcrSU4yWXRYSlo4TFluNURETnNsUXpxSGJZbnJXNldh?=
 =?utf-8?B?WVNrZldBWCtHK25xYnFFaWRuR2ZBakJQSDVVZ3lVZnZUbzRXOTVGekM5K3Ar?=
 =?utf-8?B?VEdjR3g3aUU1aWhjNWczN21UWHhUSXFFZkl0V0lsRE1WRnhmWVU3MnlEbjhx?=
 =?utf-8?B?WS9rQ0ZjR3g3QmxVK01KZExYdlBES21xTHBTYjZiSFlDL2lRcGV3VjBSYmNs?=
 =?utf-8?B?d1krTDZMTk1rQ21HSHR0SThPUjE4WnpNWGgyelhnYXoxc3RmRXFlRXY4NDZJ?=
 =?utf-8?B?dkVsOFdZbjNWUDNjbDc0QVhJTU5YMDBhV3hlN09ibktrTk82L2ExNmJVeXZW?=
 =?utf-8?B?elhaRmVFcEF3b1hVN0tiZk5jV2xMYTZMaVFVTVpTcm9ra1dQM2ZnNlJnR1R1?=
 =?utf-8?B?d1VVemRuQXhuNmlIKzhPa1ZhMklpN3R4Vm8yQVNoTi9hZ3dLTTJBSDgvYXlX?=
 =?utf-8?B?OEdyUTVJYmpjakNaMmo2alNibjBMQThNZWhZTE1zZEJRT1dYZ0t0Z1QvR2JF?=
 =?utf-8?B?eWhLcTBXLzVzVi83eDNMUkJMSEsvMStBQVNnbGJnZjBhUFdVYVE1dnpqekpP?=
 =?utf-8?B?MTV5UFRHQkRqUkc0LzZOZnNyYlNUV1hTblNqS2tCODZGV245bjhuUTNOeFVs?=
 =?utf-8?B?YTlrTnpWdSthc2dsZHdBaUk2VzZ3VjVZUUhYOWhFS2g1d0VRS1lLZDZVOGhp?=
 =?utf-8?B?VzBmZUo5R0FvN2RpL3lpN1RRcDhFeVh6YzBkZkdvWjZMTkttbVZzUW1qWlJ3?=
 =?utf-8?B?aEJUNGVXdFU1K0piSmw1ZzFTK01URW9wRGQ5NDQ5NGN6OW51QTdaS3R4NkFq?=
 =?utf-8?B?WjFraVV2dHVBblpMVW0va2hvbGNMSkRYbnVrWksrQm9NajBOZnFtSm9ueFRJ?=
 =?utf-8?B?aW1aUTlRNStuOXBZazlPVjE1bUVYcEd2L3lTWFhsMjFXSTFBWkZ0NURIYU1t?=
 =?utf-8?B?bGtWbEM2THhKOW03Q2RCMk41RVZKanArMUJsWFpVTk5kcEhqa3U5Q2w1anRL?=
 =?utf-8?B?V2dackhqWGtDOTdLZGVBOXYzSVBnTUxsWmxyaUgyODRORmhOZFVwY29DVmdH?=
 =?utf-8?B?U2xuM1dnTHh5NlRFSklNL0ZHcVoxa1ZmRVdWcXozeDNlUHhYbXRpSStwMTN6?=
 =?utf-8?B?emtvckdrdzdKMHM5OVdNQUdicW50amw4TW5sLzRRNUlsUTRubGw2dzJraXha?=
 =?utf-8?B?Ykx3MGFjd21ObUREVzZZV3VUSkwzR3lVN1FCUmZ2eVlNT1JHZEhDWkVNaUdl?=
 =?utf-8?B?LzlnZldiTFFMcDlKcVFocU1SNmFzQzhwc0ZTSXFRb1pBWERVYnFBTFl3cTE0?=
 =?utf-8?B?cGlURUVGN2pKRWx1R3d4UkZvOXozS1Jsbkp6R3VzbGU1QTFvR1NEeC95aGhJ?=
 =?utf-8?B?NUVxa2RaMm1YNmdManh3OEZBNTlpMWJlaHhlVmlUTVRIUS9nWG5tMXNNblVm?=
 =?utf-8?B?ckNzbllDSWhDcTJSMUY0ZlJCZ0UxMkJnR2dKSzJJbDE5ak8yKytKdFhKeFQ3?=
 =?utf-8?B?WEVhNUFac1VodjZMeTYvMkN6Y0RlN01DNDBlanZkOUhNS1pZYXc3Nit0WUtD?=
 =?utf-8?B?R2dvS2pad2tCS3AzSVhsM3QvSnhsOGJuR2lNOGUrUXNZdXFNcytCQ20zUk12?=
 =?utf-8?B?VjUvcGppYllBNGZwME9zd0MzVXppU2pxY1lpUE1xUnpoZjR2RkowUVJ3PT0=?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(1800799015)(376005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?NVBGUEVmcGxQSXh3eStZVG1HeVpFVHorSXdrdFRQdTZiZHo0MlRUWHdTMjF3?=
 =?utf-8?B?TGZtaHBsWGtuS2tSRlBxR2JITklGbFR4aXQ4K1RNdk44Q3ZIOFdtQUJRaU55?=
 =?utf-8?B?TDJKYXVLdDVVd3hlS3l3N1M4UnM3cVRkY3p1R1lxUFVUMC9VUUZsbkRxc0N6?=
 =?utf-8?B?WDJVazVwZXFjMG4zMGhGdGRoMlhWbEVDS0xHZm1IcmQrRE02NjNoTTlEY1o0?=
 =?utf-8?B?UDhwbyt3T3hxK0xBTlM0UFhBRFFNMVFUUGJCbGppTGlrU2JBaDB1dDYreTA1?=
 =?utf-8?B?L1JMbzVNbzFZM2J5SEdVNFdrVVFzVFhYTUFSQjRieGhQQWFPVEhKR0JYUG42?=
 =?utf-8?B?NTdsZk5WMDlhQVVTT3YxTnltL2lGRnZWcWVvdVk1S0VWQTNwNnRqbHJGanpp?=
 =?utf-8?B?K2xsdUdHRDR1VXA1ZFlEVkoxNGRkUWdMM0JNWExyeHl5S0FDNEN6UHhOd2RI?=
 =?utf-8?B?ZU5YR051NnJ0eVlCRm5oaDBKaENibnluSkUzdjByRUFsQmFxYzNTT3hoYlk1?=
 =?utf-8?B?SG5HcHdBVjEyaFB2bjN0SXArdTFabEF2RnY3cTdBUVJLRXFnMWZzdVZ0TU5s?=
 =?utf-8?B?Unk0MU1tSy9ZVm9SaDhVakhmcm52VUlza0wzMTQvWWNJbFdCMlpJcG5aNkNz?=
 =?utf-8?B?cUFvRkpKenRCZHlzK1lwb0p3ZXM5cC94c1BUTVlvMytZTFdPTXJFekJlYS8w?=
 =?utf-8?B?SnRWWmlQU0J6MTVrSnJmZmN3MVU2RXROYVV2M2tmTTBUSXVzSzdwbXJ5Z3Uy?=
 =?utf-8?B?YUlGaFVTUEs0MzdobURFem5vaUxodHhOb2VwTUp2OEpONUJWaGc3dWFUakFX?=
 =?utf-8?B?V1VYdmVBOExJOWFnS2VybU1MTE5VN05pUW8yK2VPYllTZ1U0MENZeVJYTWMv?=
 =?utf-8?B?cms4NWdodytZTmhueEJpNnVNc0xMcVNJblc2aVJTSUF2ZHg4SmRDc0xINjRu?=
 =?utf-8?B?YUx1N09Oa2ptczJGOVdac1NwMjlHalVTMUhkaXlpdHM0TW9Qc1dCejVhcHNm?=
 =?utf-8?B?ckxUcXg5UUlkdzQzTC9aa3lwMWdMWVFtc2FGaEUwSmFHbUZXVmNCV3BnQkox?=
 =?utf-8?B?OFJoOVVlb1lUZ2kveFZ3dW5FVWRsV1QwWnZ3ZnJDTjkxd205RXVOUUNxemNB?=
 =?utf-8?B?OUk4Q082endjeEwxRVpvT2JRcEtuMTB2QmszV2dkZFN1dXNNSUluRXJUSEpo?=
 =?utf-8?B?ZDFQc0xUYXhZa0g1ZDBNdFRDa2ZMYnFSYlpsZStmbkZySTgyUjVyOVRZd0Zr?=
 =?utf-8?B?RXNkdHNpaUw2b1U3NEZFL3MwZHBGcjJHblpTNExIcEFZZXZrc1RZODAzTU42?=
 =?utf-8?B?eEU3SUZrZzM2UHVkMHhLL01kNkVaZk41U29ERzYzbXdXdVBGbnQ0Tkt4WFlX?=
 =?utf-8?B?MUdWNXVROGZCNHMxUGhJTlpCYnhnMFBWTTlUL01oZllsSHhQd2d6UytXQjJs?=
 =?utf-8?B?Qi9JZkVmVDM1UjIvWWppWTNRRGp4Y0lZNWxocStxQlBtdVZzQ3ZvY250US9p?=
 =?utf-8?B?cVlzVWZkZGpFRkJ3OS9jcFVlTmNpaEJjNEhmSXZESlVTeVVDNk9OQ0dVbUlP?=
 =?utf-8?B?azhqKzJldlpBYkNGV29qa3NZbzliY240ZmV1QzV0QjV5QkRTcFREQ2RBZU5r?=
 =?utf-8?B?Qi9vNkZGNitRYSsreWhwVVVSM0JydzR2akMvVUV2SGM5SzhrQnc1MU5SVTFk?=
 =?utf-8?B?c0orazJtYU1kT29IMFZxZlN4NXhleGxPRk1aYUV5M1dnL0Raczdua2plWUh1?=
 =?utf-8?B?L01BbG1uSkRYZHRzQ0JJRzRLNExIZHVobHhwcHlFTFhIMURYYmZ4SUJ3Y3p4?=
 =?utf-8?B?bTZGdXVzUUQ2SHg2MS9qZ1o0cDl4QWZVSjlhY1VuQ1ZCYThsaWpnbmtucGRp?=
 =?utf-8?B?aTREQWtwWWlPaFJrRzNPa1J3dlFxbWV0VVQySnF0cksyYkU0cUtjMVdkV25m?=
 =?utf-8?B?ZlEwS1BLNy82VXp5eEJIeXpKdzdrempFNnBzeE1xM0w3NUtKVnV6UlJIa0NL?=
 =?utf-8?B?d1dKZU9jRGxNbVFpdjVjcHpPYU5GODlMcTFVQjRTUGE3SUZYWWtscGJ5WXF6?=
 =?utf-8?B?QUhyTXRXL0Z1RkQrUXc1ZktsR0ZDSU1BREdzVFY4TW1RTE5Cd2dRQ1I3OGlX?=
 =?utf-8?Q?LTn0IRMUYr7Xg7jfR8GWwByqY?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	e67Dx+HCR9Rx2Zb4bo/tP7b7byOvrj30XOtuVcbhrEQLpAh0enAyW1nPiYC56JydeAqy5gtuLIyAJGyDy5X72fkQsYf5l6JrXp8hZEkl6ck/iRl6NKwy3/QN/HUwknd9CdWas9rX4K1ImYY1ywq2t/ppdzjOALHvJTrgdITDa0al2VYwSWiUKt/YJcRkp7hrUooNvUmcfKZeyUbXXnrO6DRd9ZUsmPgyqoth9aJJ4jPM9wwReoc4nTYOMz0uhdwFkPusn3VzV0dloqVwLsrL21BocuLnDo6A0tNKunFhFfcq5y03eR2Jfyw0/PK3wNL6rXg/4DeEOZEsJ4TpUKY+n58rVggCCYVcFGOwmrtrA8pDQM290jlq2R8VmaxyPX4XocKJMpwBpl7/vQBX0uCslOIEUVdwUmC7PXqxvaHsfOCBqwK3fcblsWcc1ftHZjPTFQBwT5C5hDDVXGLH6QzFW3kflI0OJx7azKJ2LpR3vbaZJ3MVW9VpEO7ALs8dCctqfEjakux5Fn1c+VLJYxCUnImc6ZkWvMNb2gtU+K5U8AUZ1n03JlWT5za+fl81JXHgv6ZmgO7t/c5bIwrdYAfsoBSBNumaHHoJNZ9G5ACIbFk=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 35b7bded-d2d9-47ea-f7fc-08dc66099460
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Apr 2024 15:57:31.1648
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: h9xQyBkhbm+lD8mtECXoNErWA4XXgMTTUzdHniXJlmksfD6DmpZjdBx/pmcmONNvnks9dPo32dQkhC63sRf1lg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR10MB7540
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1011,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-04-26_13,2024-04-26_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 suspectscore=0 mlxscore=0
 mlxlogscore=999 bulkscore=0 malwarescore=0 spamscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2404010000
 definitions=main-2404260107
X-Proofpoint-GUID: 8edh9YMosJUGd12lIO-wd9_qZKBgtRQa
X-Proofpoint-ORIG-GUID: 8edh9YMosJUGd12lIO-wd9_qZKBgtRQa

On 4/26/24 07:30, Nick Alcock wrote:

> On 25 Apr 2024, Eugene Loh uttered the following:
>
>> Reviewed-by: Eugene Loh <eugene.loh@oracle.com>
>> but "This" (the opening word in the commit message) is a little ambiguous.
> How? There's only one possible referent, _FORTIFY_SOURCE. (The subject
> line is part of the commit log too!)

Perhaps.  Not a big deal.  But if one says "disable _FORTIFY_SOURCE" and 
then "this", does "this" refer to "disable _FORTIFY_SOURCE"? Why not 
just s/This/_FORTIFY_SOURCE/?

>> On 4/25/24 12:40, Nick Alcock wrote:
>>> This is incompatible with the dynamic-length-string trick we pull in
>>> the DOF parser (which is in any case seccomp-jailed).
>>>
>>> Signed-off-by: Nick Alcock <nick.alcock@oracle.com>
>>> ---
>>>    libcommon/Build | 2 +-
>>>    1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/libcommon/Build b/libcommon/Build
>>> index 50aa4ed88f8c3..fd54dc044f9af 100644
>>> --- a/libcommon/Build
>>> +++ b/libcommon/Build
>>> @@ -8,6 +8,6 @@ LIBS += libcommon
>>>      libcommon_TARGET = libcommon
>>>    libcommon_DIR := $(current-dir)
>>> -libcommon_CPPFLAGS := -Ilibcommon -Ilibproc
>>> +libcommon_CPPFLAGS := -Ilibcommon -Ilibproc -U_FORTIFY_SOURCE
>>>    libcommon_SOURCES = dof_parser.c dof_parser_host.c dt_list.c
>>>    libcommon_LIBSOURCES = libcommon
>>>
>>> base-commit: 6c5f67cc8ea1d694da8043c8f5aeb2f97b69997a
>>> prerequisite-patch-id: 27ade1c234620c8ed86991c2311a7887e935e1c0
