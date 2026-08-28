Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91BA83A9D95
	for <dtrace@lists.linux.dev>; Fri, 28 Aug 2026 20:50:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787950241; cv=fail; b=bQJrEc9pmcN3IOQzxECrFsvmfumfM10MoDarSX2gVgZ9hEprCmZ2QpvCW+CXXIOpdLqrsunoc5gSyFW1vUKa0a1v2sDslLDD0qpWwo3Vtux+c0oYjwD71P56n/fd22DExjIRN+Hj6Qzx0d2UCHDSMNZdashinw1O+33RQ2hEc5w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787950241; c=relaxed/simple;
	bh=LeSRkSHO5X8sU/FCL2UIjJDkkdF+4Jh8oaZBDaJgHGE=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=fVv3JmYolmYF5gu2hBJMrwfJL0TxzYx31S8g6dkegGaMQzYb2NtPnTUCkMbqr0q9tw+zKPXZs/b1sbwR0mUCmWrXbQgtL2nbbdz+smXBl3TByM/QvCcI7cC+Qhi3xHT8ZtKroXEGm5dKXNT/9nSavSLw3CLCNoJTOEP4xJU7ECM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=Vdwzrvn9; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=HP0PC9n6; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="Vdwzrvn9";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="HP0PC9n6"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67SHJsFo3147086
	for <dtrace@lists.linux.dev>; Fri, 28 Aug 2026 20:50:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=kGu84pL5fkxM3KLtrG1HARdOrVdtaLgwbx2Pf8G53VM=; b=
	Vdwzrvn9avas6cwX/4uhxsOgcBNYLO36Gclv67VYFYhCNWNamw/dHRN0o4dyveyD
	R3W/QmyKBsAqtP5CfBBwiz3Poe2TJV9Mx6GrwbEFHbCinifb3GNzjxwshrJPOY7E
	dEiiu1PE01E1kbnWG5MXXb3eE8tHrdicSkFyS9zCXB2Kb+hOshnPpikCPVYwdN/5
	1p0ssqOJNEEuZ7AmUIQphx9NNYUn/vvNSsHe7zEEH99bpH2C1GQ7WlFTd+BnQZPs
	YCaKuUj8a7/3CxiuRgRtxDniwlusKxXKppcNvttW3A/b59YYlF2cJGkUElBW0K+A
	B9QvRMIa6c2xpZy0aYSOOA==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4g72j22k2c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 28 Aug 2026 20:50:38 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.7/8.18.1.7) with ESMTP id 67SKo9fu030238
	for <dtrace@lists.linux.dev>; Fri, 28 Aug 2026 20:50:37 GMT
Received: from ch4pr04cu002.outbound.protection.outlook.com (mail-northcentralusazon11013055.outbound.protection.outlook.com [40.107.201.55])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4g846hhhgb-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <dtrace@lists.linux.dev>; Fri, 28 Aug 2026 20:50:37 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OxCdvCVjiNzFcNRgj9KZwuynwIZ3Ba6d6r9KuRlNri7tYALGHCsAzDZw0ZAvIaZg56etIfwG3/XKqioyn6Y3q9AtG9lf86hVW8EmduvfHnJI4L0ChAt+9DAbvOScc3L5dqRri+27Fb6NPWVfu3BHrmmRLzQWhi4qpqzXseG2Qy9KXUMjNmEp3evGFSrz0k1C2wL+Yg/MABT2JG86lnftuCSgKwJS5k+o7q7sDtgRCkyx8EUP5gtrRKRH1fOjDbX+yP5K9Tkw3bIDrQ3HKgRNPFXiWYn91i7VeDvAt3Sk9DlXEgL1QxELgBBzeDFRvgDpPBmswR4Yh9/uTbXIn+v8nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kGu84pL5fkxM3KLtrG1HARdOrVdtaLgwbx2Pf8G53VM=;
 b=CzmvZHphbXUmxUE4g1EW5IMoyKHpiV72R0vn2f4FmzNX1Erq+psgQnpbW8eCSOwwisCo4SB5pinj4ayyfB+wumxa9+WHj9qEE9y4TSOR5gt9FzV48tUtARIHPOJ0aTDTFXmeaIoAZoOZZQ+m5OeoCfrcqXhFLh+o0L+C9hse/6rzHNnQoggcrmMcn+gRFIf+iGceBaKLww0Q4plOBd9LJpeptGJFZ65+HcaiNjmjnsk6zVIb77jrweOr8F+SN/CFJcll7p5jmYgo3DF8BwiAIZpSNh7lgoWLt45oEvTzGtxXdSUNInofQx/la4K0H+H4epk3aCpvF8/pPeBjnfin0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kGu84pL5fkxM3KLtrG1HARdOrVdtaLgwbx2Pf8G53VM=;
 b=HP0PC9n6ULltkJBSE+YnLiZpFQg6v9/rCzg5KAm1+g+I3N2pbcI4lWygOAgVusGr5dgAzdS3NoS2YN+jlFKJH40PydPBMpAoAucCk1SciWHYbTlgaUj/ysE4HYNW9GQIYmGwkb6BQO4svLLYUUJ/x+j0XUzT/h26iyIgEZTGzno=
Received: from BLAPR10MB5075.namprd10.prod.outlook.com (2603:10b6:208:322::19)
 by PH0PR10MB997688.namprd10.prod.outlook.com (2603:10b6:510:384::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.7; Fri, 28 Aug
 2026 20:50:32 +0000
Received: from BLAPR10MB5075.namprd10.prod.outlook.com
 ([fe80::8f5:4de9:81ce:f5c6]) by BLAPR10MB5075.namprd10.prod.outlook.com
 ([fe80::8f5:4de9:81ce:f5c6%5]) with mapi id 15.21.0382.007; Fri, 28 Aug 2026
 20:50:32 +0000
Message-ID: <0d314b71-d474-408e-a56c-7df0e82ee8a3@oracle.com>
Date: Fri, 28 Aug 2026 14:50:30 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] provider: only call discover for the provider
 implementations
To: Kris Van Hees <kris.van.hees@oracle.com>, dtrace@lists.linux.dev,
        dtrace-devel@oss.oracle.com
References: <15cd034ae8698f3fefbc8259c3ce031e@oracle.com>
Content-Language: en-US
From: Elena Zannoni <elena.zannoni@oracle.com>
Organization: Oracle USA Inc.
In-Reply-To: <15cd034ae8698f3fefbc8259c3ce031e@oracle.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: CYZPR20CA0013.namprd20.prod.outlook.com
 (2603:10b6:930:a2::13) To BLAPR10MB5075.namprd10.prod.outlook.com
 (2603:10b6:208:322::19)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BLAPR10MB5075:EE_|PH0PR10MB997688:EE_
X-MS-Office365-Filtering-Correlation-Id: 513c3637-221f-402a-6a55-08df05460036
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|23010399003|18002099003|22082099003|56012099006|10067099003;
X-Microsoft-Antispam-Message-Info:
	ckLA9EnlO53f94KyiPPilpuYHnJ5NgvvCzD+MBGDnYIGjm60a7JVW09y6ZZP/GQ2+vjQWpB/478T+WeEwU2TpHyzAi0AaPVmpdwH2nLSbxGRmupB0fdZGP7W763fORE+zeuWfjqIAMub7k4i4hSVXTIszQfhUeZYV3N6LtpqYQ/5/y1vr0vmvByQoD3ATrPOjnTiBwRsuGmq+0PfYSN2SBS+3k7lD/nIXSb4YhqdjHq73IEsTOJPM3K59CLntAKZpcd713mpxSRnx1jOlwqT9hW5WtJRIxK2BgDcnh/KW3db+jLLY+3h74I2LKR891k7VguagtmOWE95Q79D36/ABu3lX4IhVEpe0KCBpMAuCT9Tqu92Kh1wZvEaU17ojyP88nj6ajwQ7NKf9MtFvpjYLGfxbyNicpwcCcEpyiY+Z4fjKGVMahoz5+U+Y13pkZa24tnSHNOv6sW7QZDKV5T8vU0x9wGnGgs5gFk2eaNEdxB62JoZo8Y0Mir7UW3/vJM7j4TIp4XTaiXUl4qc1T9S2oNfFEzdO3/fOhtqQUId9kPQjCgdqhQz6JjRpiFvO+7ykKv55reXZVSZ8kkml5Rpi6UojCMwA2xj8RGlNDKvrNsgu96irfVBns4YFLBv8TrZR2h6DQ611Uw+d3PIFHwuOiMedvDKrepr9CS/JoNdNcQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BLAPR10MB5075.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(18002099003)(22082099003)(56012099006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QzU1TzlzSFh0THRZMDFSZWU1cEFOZzhHSElsTWZRUDRoeTh6dlpMYWd6ZlN6?=
 =?utf-8?B?bSt0ai9KQVd3VjVsM1lBMXdCWDdkMlVJYXgwN1hvWmlUcjBrVTZVZUp1Z0kx?=
 =?utf-8?B?MXRlcTZwVGdZUERTQ3hyRGNRUUlQQ2hvLzBFdlM4eXg4ZDJDWGNpRTRBK2tu?=
 =?utf-8?B?K2gweW4yekpXbVIrQ3RNV0VkYWFvNEVHdCs3eHBzWlFqVGxucWQ1NDRHMkJL?=
 =?utf-8?B?d1pHc3NVZm5sMlNrZ0V3dGw5QTJXTXNLUWE5KzZsYnNOK1FMQkRzTkxmRk5S?=
 =?utf-8?B?dU5QSUVJUmFuaTBXZXB1cGFFY1I3WDliOUZxMzdqQjF5cGxKSlNKRlEzd0R6?=
 =?utf-8?B?QThtdHJNMWFpUmdaYWpiZXhmKzlYYmN3RWJUT3Z0dU84Nk8zS3lrM1NsNkNI?=
 =?utf-8?B?UG14cml2RUo5dDN3T0lITFhvM1pwcnhXUjM2OHB2bTkvNmI3Y1NiVGN0UUpE?=
 =?utf-8?B?Y285TlhNMkxveWZFZDhWeFlpb1g1bzM4Skh2Tk4vMGhUODMvbE93MW1BbUkv?=
 =?utf-8?B?WnFZMEVVdlhmN2xtc2o3QmJYNDhQSXlIcCtvRHh0a3RQeWt5T1NmUUNxdXZh?=
 =?utf-8?B?Z0U3RlNSZVlwVk5VKytSYytwSE5FTTlhM0JxejJuTmVFYmNDRE1YU3ZvM05P?=
 =?utf-8?B?dWx2bFJJQ0dOUzdMKzg3blBTN0NpNWFjaGFDSndpaDg2WjJIWXlvOTZTRjJo?=
 =?utf-8?B?TUlPVE1UMmJyUFNuaVFWV2gyWHlnQkVyNkRGSmlva2VTS2VOSDk1Z2U5MjhT?=
 =?utf-8?B?eUhTOXBJMVNpRUJpRWxYM3pRSkhXMWNzQ2FWdXBIdlpoc1ZsdHpzVmtZNVhy?=
 =?utf-8?B?MUMrZVpyY1pTZzRXTTRzZDMySVlsUDltOEFlNHNMZUFYa1IzWGlJbkU5ZEgr?=
 =?utf-8?B?RFp4ZUJKYlZJaHcyanMvVkZjNURHR0xBVFJndXJBdzdwV21RNTNwR2FJRDZE?=
 =?utf-8?B?aEd0Vk1VQWRCMm9iSWxGQmVCRUt0OWo0cU9kU1dUaVRaaWdGaXAxR1JJSG5V?=
 =?utf-8?B?VGhnTUZLY1RQZERPbU9DcS9VcmZEWUp2WmFzcGxjR29jMFJmekk5eUQ2dWN2?=
 =?utf-8?B?UWRlWFdRdjBYUkllbFBnNnBmbFprNGhQSlR5VjA4aGpCRjlINzZuSk1vNmV2?=
 =?utf-8?B?V1FoK0RKaHcyeVZuVXJVclZsa1QxVUs0WE9kLzlpWTNiOUs4bXk4UlBsL25B?=
 =?utf-8?B?WE0wdkpyb0p4NThVM0o0d3I1aDFVY1pST3I0NFJycDFROG5JSVpNVENYREM0?=
 =?utf-8?B?VGxwTUdLVnVBejZxeklkZWZLenc1Ni91NXUyVEJiV1k5ODFQRkNIdWdaakky?=
 =?utf-8?B?eU5SMVJsTkFGVUM1b2dYVDhhcmVaNXFmSlhYRFJrZFZHSTdkcmduTC9sMWsv?=
 =?utf-8?B?NG90c2FiMWFXV2RjOEYzZVhCdVRkdk95UmxJVzFqWjFob3k2cEJueEtMTmU1?=
 =?utf-8?B?ZytJQXlub09LTEN3VUJwaHVjNEZURUVMT2tXaDZhbDFRNjhYclhDSkh4Wlhv?=
 =?utf-8?B?NGZPQUJHZXpTVVcwOFhMdmdLVnZTelFXb3M1K0RDYlY5VkFyRWdvUUtNK0xS?=
 =?utf-8?B?YzF5bGRhcC9QR2cwdXBoS3VxMzdTNjhmNEkxUFFpYXc3OEowc0owbUlPa0NO?=
 =?utf-8?B?RXpKUDZqTllibWYxMlNscVBZNlptejZqcW1OajhkbC8vYnpXMUlLb0FtQTls?=
 =?utf-8?B?dlBaRkgvUGZodEJENms3UmlNSWNnV0ZLZnZJc0ZDb095NEUrcUNsd3pTbm5F?=
 =?utf-8?B?L0hjOVowWHBraVNqYVVPSTlZOVF6K0RQZ014VUIzaW1YMXEvaGt2ekpOMVMx?=
 =?utf-8?B?NjU0SWZYSEFDSVR5czJLQnpONmxzb3dQOWlOU3V4VFJLSnZZVFBHd0kzSGNQ?=
 =?utf-8?B?c05VY01jNjhycnJkd2hPUTdhVmJ0c3E5N0JYUDhoeVhkMkpwcDJBTlVlSXpa?=
 =?utf-8?B?eVdzazJIMGlTM0QxMWNNeERyTTh2VW01VzRJVzRwMWI5RmFRTWRyR004K3Z3?=
 =?utf-8?B?dmt0d2gzS3dPbkVjZDF1NGhPVC9lcFg1OHdLdWo3VjZIdXJaY1M0Vm8xbzA4?=
 =?utf-8?B?SkN0TnZJVnN3SjNON1hhZEpHcnNlRE15UHhrM0VUS1NCdHhPbGQxVWo4RENG?=
 =?utf-8?B?TFRSTUtrQVpaWkx3YmQwOE56VzNtbHFPUGZvY3BqMmZGN09SK20wOU50V3NH?=
 =?utf-8?B?eFhnczdSRWo4d2FmVk1MaGxBZTVOYS80TnJpa2IrUlFnZ2RTZXpodnE0eW1L?=
 =?utf-8?B?emhhV0hVaUtYS3dVWmJJSTd0aWZsb3pabkZta2Z3elZEUXl2bmlhZHlJZVRr?=
 =?utf-8?B?Z0w2Z3dOSnREajZreVpac1huZS9uNFR0eUU0L1U3VUFMOGlBOVFjQT09?=
X-Exchange-RoutingPolicyChecked:
	kWdu1snE0Thk4+qS5lzlga2nennv3CYkKB5kSJ2LVHAvWpFVPEjixlwYXGhSScT2CNOfD5TxfIkUM8VEF+lQeJ2d+dCmswV1FEoCCbtFhw6wdYXUz/5yNO/RhsU4ZsHC3hsqbeOKuxoQfUS/wKTn2BkqP2D7ZWuoS+UJsiSBlB7h7juq2xSkHXUjAdjaEHZeaqSHr1tdKdpKAT5NL/Wp94/XLEAot2AF2LUQNSAblIJelWJDZs1mPI/EPSSKTOJXCQD381kpZ4JaZsJ2K5wwaJyI2rj63egg3e7URkAydt6pfcyxPDUQY0NK46dSuSZ49NS8Z6WqPlCZgHTFi9Ey+w==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	apyq1tkr7dMPp/+cilyaSUbs4/ONqVZW9UeF7nlcXqQI512ielfXF81k/Nn/5qCYCew+W0FYQQgWxrR1uUvfsAhNmZNGsPf+TmTP8W4y552jwD5Y4KXkF2txlzvn0TbqzDre4+yBYC4sOjWwH4QPwjCrzVTNseyMUivMA+ly1+R4gmjO9nKJ3S0knpVOYZCCmffowArHfLnHxGw6RJ8Zwqm0fqnbM9Vt3unU/Kad5zjg/PLn8ffsRhISuSO0d48aXbWuarnMnKDcGXVkEt8ga3EO2x05oKWP+Mtf0i/E2ceyZtyLPiKWM0YNL/YD3T+fi8/Y965FGbEM7l432T+pvEaCZWfK10KYaiB2G++vAPhFOG7weSeZnD+EDRnf70BygbRVhRL054jPU4l0oyvqVWkayPrEsqVDDZa4I/drjOgDf4vREOfGXA7GiKvozTVSXAtLBy+N5ugSv0iPiAcKksbn1BYSQgK2INEbHf8PWMIhkG3KX1kQIv/nADK7PoV4FYzMfmu7weWL0ZyulDqI0c1pdDvbGwQ6LFlbv+3NTrT08PmB0JUYN0Qhel9dNKucJkN/1BWJ0noRd3XRMrRXDI+kLBKCMz5jLNZUwjFfspI=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 513c3637-221f-402a-6a55-08df05460036
X-MS-Exchange-CrossTenant-AuthSource: BLAPR10MB5075.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2026 20:50:32.0819
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Gkt9fd2Np336t9G+/6JGHDv6N1tDAsSCYDK/NhPFsdeVDF4M6NUiVRqMiba7n3j8Wuies0oeLXvqDNrL1An/BACV7JFY6F+JA1Q6IS+Wev4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB997688
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-28_06,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 adultscore=0 bulkscore=0 suspectscore=0 lowpriorityscore=0 phishscore=0
 spamscore=0 mlxscore=0 mlxlogscore=999 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2606160000 definitions=main-2608280181
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI4MDE4MSBTYWx0ZWRfX8DhvbE3RrP0H
 7I2maARW/Yxfi76P+kdNVIcTQAJvyMF3kTt3KdHgtRa0cWWNUBzM1oYCe8kAhQCx5kA0WzwN/CQ
 PGMLZO6P4recEKemOcqPkwV565K+WvjNNS5kANGFlfQVeizu8DCn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI4MDE4MSBTYWx0ZWRfX9layno9eTuoy
 KHG+ILIOCrN3nG+3MDchmZZOLHg7lqnXlMg/f16AYOMYV66qodSjRtFUlPiJUEJy/lwsca4xok1
 Xgbhh4VD+/I/kbsndXEvs7ITziD3fC0EfcFHMtybHoZMuBzOggJ2JfxZjZjVxf8VM7HAOxICflC
 stASK4Wk65bTLmwvjZ7pqxJ02Z/E7W3URMI4IeuO23SwpEwvy1Ktn5kP9VE2zHYRC3w7QLsTAv7
 9OPi7KgHBKVDeAxtXT6T5BS/SdriordXNO75APOBa1IIWvuWMlyybPV4etM7u37C7IFenTg5H7O
 HVZrsCFchPwRzAfJUJN2kaz5wTDijd//u7x7azvr2Rl0OY9xoQDa47Jz1P7+2XhHJ9LnMF4dCHb
 ImoWqhelcLDKdXoEdfbEz/LeJCP6i+HYxY1DcTUS3F2VKQvoR9NSkPjYuF3YkYJg07cO9rG6ssd
 p9WHwqSxuwCJvUgqYpg==
X-Proofpoint-GUID: hWnmKWsqNLOMtFCjGenkexaZVQ8zmKZ1
X-Authority-Analysis: v=2.4 cv=Wek8rUhX c=1 sm=1 tr=0 ts=6a91f49e b=1 cx=c_pps
 a=WeWmnZmh0fydH62SvGsd2A==:117 a=WeWmnZmh0fydH62SvGsd2A==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Sv0fKeRqtYgA:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=jiCTI4zE5U7BLdzWsZGv:22 a=o5oIOnhZENCTenyL_yNV:22 a=yPCof4ZbAAAA:8
 a=U88CV-dg_J_4uhpn254A:9 a=QEXdDO2ut3YA:10 a=WmVTiCyuxqgg3mnwYu6p:22
X-Proofpoint-ORIG-GUID: hWnmKWsqNLOMtFCjGenkexaZVQ8zmKZ1


Reviewed-by: Elena Zannoni <elena.zannoni@oracle.com>

On 8/28/26 12:48 PM, Kris Van Hees wrote:

> Since the discover() functionality is provided by the implementation
> of a provider type rather than being specific to a provider, we only
> need to loop over dt_providers[].  The discover hooks themselves should
> take care of any newly discovered probes.
> 
> Suggested-by: Eugene Loh <eugene.loh@oracle.com>
> Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
> ---
>  libdtrace/dt_provider.c | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)
> 
> diff --git a/libdtrace/dt_provider.c b/libdtrace/dt_provider.c
> index e073e1f2..818390d2 100644
> --- a/libdtrace/dt_provider.c
> +++ b/libdtrace/dt_provider.c
> @@ -186,12 +186,13 @@ int
>  dt_provider_discover(dtrace_hdl_t *dtp)
>  {
>  	int		prid = dtp->dt_probe_id;
> -	dt_htab_next_t	*it = NULL;
> -	dt_provider_t	*pvp;
> +	int		i;
>  
>  	/* Discover new probes. */
> -	while ((pvp = dt_htab_next(dtp->dt_provs, &it)) != NULL) {
> -		if (pvp->impl->discover && pvp->impl->discover(dtp) < 0)
> +	for (i = 0; dt_providers[i]; i++) {
> +		const dt_provimpl_t	*pvops = dt_providers[i];
> +
> +		if (pvops->discover && pvops->discover(dtp) < 0)
>  			return -1;        /* errno is already set */
>  	}
>  
> -- 
> 2.52.0
> 
> 

