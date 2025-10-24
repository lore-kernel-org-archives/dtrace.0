Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5C4C346E7C
	for <dtrace@lists.linux.dev>; Fri, 24 Oct 2025 17:51:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761328275; cv=fail; b=EXqiAYAlzQ8tGBvnJHs8ok1jlORib2dpTgxmOUShgV378urMczud//VcqXGydOyICVTd9ALHxMINZM0irll0doLJ8w+vnvOhKscT0E/8hxDCtrKjt2Bk1Kruh0ed4PrPo3zmSYNofULNFEIM2BJgPhZojZi5Bh/NGw8sqOFkby0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761328275; c=relaxed/simple;
	bh=gqZsemXMH9OOwU9blflP3cdzQk1WwZj3ZaLsrnpRVOw=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=SThT421B49vbMCS7+EjrSzXP2qeYmOFExaZ7cbJzI1vHlBvt9lIDDNBtnAngTh6WEgUmGBJc/Kx89tEQ3UV4yCwv3fq7TJr2l0g9vKEFvZl5frNEN4HBaz5saajqLT8pv0D97Aoqdd+ITZjXKHSAZv5jcbMywoECqsZjCCeS1aM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=jfbuVzfT; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=LjyMkFL2; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="jfbuVzfT";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="LjyMkFL2"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59OGuBeY019456
	for <dtrace@lists.linux.dev>; Fri, 24 Oct 2025 17:51:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=rGeyYko/jZMmvVVhfns5i+QMaRcuCoYtSh1XAHLGlX4=; b=
	jfbuVzfTBHRDKnZNZ3Q63gufR7pGAlnb7FalZtVVD53vEhGUgLJpbNqCs7/6m0VL
	mD7t72pJ9+acItL3ApfrFc8bH0tBfrVSMJloZ6m50hxxmDe1nbI33vfG3eUxha4x
	jdyfy4VlHgP6ipfu7KPCbqSHKVvhY/xv7L9K/ZN+8BBnGjXRB8qT34LG0vtsODZf
	NRoYTfx2SS2F/wdrw7PMdGaOEVBULvTti9zu2ipReGqL4RFjmV12AuTJ1DgiavK2
	PrnaXeKMe3zowJhbpT1LhKdyW8tyKMPOrWutRq2bIy9oqL3XSuOu3+rQxd72afda
	bIH/NaRrTrqkgDVLRupRdQ==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 49xvcydbks-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 24 Oct 2025 17:51:10 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 59OGuLAR006392
	for <dtrace@lists.linux.dev>; Fri, 24 Oct 2025 17:51:09 GMT
Received: from sn4pr0501cu005.outbound.protection.outlook.com (mail-southcentralusazon11011013.outbound.protection.outlook.com [40.93.194.13])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 49xwkaqpve-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 24 Oct 2025 17:51:09 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RK2U4VR+eBGxfHsJ9m8azUdzZC/UOIdrBiv4ZOZUen0kwe3ghcZt3eMIDKPrSlf8vtx6qvFe+eap8ATw7nc2Q7JBmc4uMUHwjdOsXOJ2MNrsZ9HGj8sbxHU+tfRuz94etV9IH4kSATDLRoZ7crOMvZCVI1RIUFvLI6uxOAMNlMcsCPqvJZcOIXcqO0R02UpTqGzG+hCFk7Ita5QWk32nfket7aEaLW8B/WCWW6Fcfgx7MQvhY4QAtgUyJfSos39DipAfuvN0c+lcu6EhAwZ0+eLIQBVjzkXv20Ouv6IKFjqsl9OsQ+fz1w+1zjogpKY9FCRODRsWnQSAt9KBGHiGig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rGeyYko/jZMmvVVhfns5i+QMaRcuCoYtSh1XAHLGlX4=;
 b=ED+PUGWGt1SUWEJ7WeoORCRoJ4E5PQG0IT7QbfIkRGzrjBy05R57DZFsVdyTXG97qxyJXeKSuMc8D5KRVU7UV9NqIL+QjkmX4nOiW8ztBUAjETXrZRSju8rAHK7kUYGJY4h3mHqf1GAC6JMRQiRu3XGTK5t1/H7eUY59MTbYi8CNRPYT9OzlNWfzYZEyg0cAvNIMlFXW+Z+rwIDhiikkh/g0CjYE26xVs4w2uoI0SUPC11AZmBRro1hcA5Dqg8yrcHeWsmV7Z+tU6lWx85F37vIozJEyz+EwMe2Jy3snGqworYaGDh5XfKhnd6a3i3NzLyjGe1liNsxZYwVzCV8Xtw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rGeyYko/jZMmvVVhfns5i+QMaRcuCoYtSh1XAHLGlX4=;
 b=LjyMkFL2tFe1+capzqg4IuIm0m6NvkG0495mxx+t6aeTrIrxzkec/kICRgtl45UrX/zNlp8ndM3i0tgyOhOwvCNitHW6fkD6BbAywlykns3rumVPS3JCKT8zuaUocBXz4A+MQcq6g7idc0F6yfpMty3/QtEbeljSTJm3NJoCM24=
Received: from IA3PR10MB8513.namprd10.prod.outlook.com (2603:10b6:208:576::12)
 by CO1PR10MB4532.namprd10.prod.outlook.com (2603:10b6:303:6d::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.13; Fri, 24 Oct
 2025 17:51:05 +0000
Received: from IA3PR10MB8513.namprd10.prod.outlook.com
 ([fe80::dd32:577c:40ed:9823]) by IA3PR10MB8513.namprd10.prod.outlook.com
 ([fe80::dd32:577c:40ed:9823%5]) with mapi id 15.20.9253.011; Fri, 24 Oct 2025
 17:51:05 +0000
Message-ID: <f5e969a5-d0d7-4df1-aca2-ba8ebe06ba77@oracle.com>
Date: Fri, 24 Oct 2025 10:51:03 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCHv3] Update llms-txt and add README
To: Eugene Loh <eugene.loh@oracle.com>, dtrace@lists.linux.dev
References: <20251023221648.6200-2-bruce.mcculloch@oracle.com>
 <bcc9ae77-67a1-2e50-8175-45dd8fde722d@oracle.com>
Content-Language: en-US
From: Bruce McCulloch <bruce.mcculloch@oracle.com>
In-Reply-To: <bcc9ae77-67a1-2e50-8175-45dd8fde722d@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MW4PR03CA0105.namprd03.prod.outlook.com
 (2603:10b6:303:b7::20) To IA3PR10MB8513.namprd10.prod.outlook.com
 (2603:10b6:208:576::12)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA3PR10MB8513:EE_|CO1PR10MB4532:EE_
X-MS-Office365-Filtering-Correlation-Id: acb54fc8-d431-4df7-23e9-08de1325e78c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dmxPVjNKc2pMaHh3Y0trNDFBQjZvZ0xRcldpdUt3Szc3WDM0RFR2Y2thTlNG?=
 =?utf-8?B?OXE2T2U2c3c0YmVXb2dEYkk2RHhjTU12UlRwSVRHKzdYWkE0dkVCM1g3S3Fp?=
 =?utf-8?B?L2pWL0VzNzVPSEE2VXFuay9TYlhJWDRQdTFyYVF0YXpMWC9HTFl3MjREcjlH?=
 =?utf-8?B?ZkNyZEZLbHRYbHJ3MDRaTlRQK3NjRnN3RWF4OHhqWElGaHh4U0RLWG5jSkFR?=
 =?utf-8?B?b0lGVDg2OGw2Sjg1WGRaMlZxeEpBclBrdDRSRzlSR1cySXF1MVhlVWg0VzRR?=
 =?utf-8?B?V3cxYThORFZscUR2eDBQeWlRMDl2TlZVUHVLa2UyREJ3TS9VWVNaSmk3a3RF?=
 =?utf-8?B?M0xiTWtHeEdYMkhWY0lJSThjV2dmNE5maVFLK3BmdS9ocm5sdExvMUEyc3BY?=
 =?utf-8?B?Y0RaejNuZ3ltS3VVQzZrVGlBbkdGc1dpUFhtZTRUU3ZmWE5OSllxamdFZVU5?=
 =?utf-8?B?YkRWKzdvWFUwY3U1Szcrb0t4Ym41am0yamhwUjdGVDR2Z1luSEgvM1ZZTlp1?=
 =?utf-8?B?cGl6b1lIYms2M0JEKzJ5Unl5dXdyRlFxc214TVZFNEtBRWFQbS9yOXg2dHdL?=
 =?utf-8?B?RDY1RTFsc1FEM2xqbHl1OVJVYnh1RHZpT3V5bUtuZHpSbHNGNmVWQkpDWjJD?=
 =?utf-8?B?MTkvdXpWNE8yMVZpaVYwR29hOHJ2WVBUOHp4OENYcE5sVWhabnI4RG1WMTNG?=
 =?utf-8?B?UUw2RzRpYUptRk9DaHEzTFBsTms3YmhSdnVMdjkxaE9KT0E3UnZENVNPYlk0?=
 =?utf-8?B?SGxWOVoxa0dSUE0rd3F0VlZaRkZ0bFJha05PVlBIczErVlNTVFljbFdZMFJE?=
 =?utf-8?B?RVpmTlJ2bDJOOSt4WThhbGE3RWZZUldmbTUyc29LN20yTnFORGhCN1lpQWJh?=
 =?utf-8?B?Um9oL2VLaXdrbDIyRUJ3TFErdFR3MjlZVFlFcDh2MXFWOHBXZEx5V3NNK1hw?=
 =?utf-8?B?eS85bWJETnl5Ymg4Q3BLUFlabjQ3RFlmMzRoU1U1NzNoUEJSOEpBV2lsTW5W?=
 =?utf-8?B?NmVhbDBnM215QTJKK0lOU0oxZEZQYXJ2aU15OFNESnE5dkNSODE5ZnRzZG4y?=
 =?utf-8?B?b2ZjdzduVmdadnVUS2JJTTRSb3M5QkVITUhQUkxJdDJRVGE0UTYwUkRFSlVx?=
 =?utf-8?B?MUFTakEwby9sdCtFMG1BTVRleTlRYVZxUUVHSFJFU1A1Mk1KUGhDaWk0Tmh6?=
 =?utf-8?B?M0h0dEFKcDM4Mm9HMEY5RjZWM3BXM2trNU00eGRhMkg5c05jRFhWZmJCTDd5?=
 =?utf-8?B?ZkQ1OXFNZEg4b01ySlBGUWg2bWdYRi9pZ1F1YlR5NjN6bGxqNjd3WGRNczJ6?=
 =?utf-8?B?Z0dQSUpYR3RiWDZTRzdoeXJDT0hXNVJkVE4zbDJEUlFiaTBxaThCNjJySkRn?=
 =?utf-8?B?dWNYeXdaUnkrVlVYbEhHeVpYS3NqZ3M2Q2lBK3oyejZzb25wT3pZS3NadHlO?=
 =?utf-8?B?THJSNU5nWHNmNmVtaVpsbEl4dlhicnlwYU91M25zZ1FYNDVwK1Z2dnR2bDhh?=
 =?utf-8?B?U215aWgvT0xkcVpHRnBLQVQzdkV2Vi9yVFJrZnBrSzhNR0puVGt2VVJHWGkv?=
 =?utf-8?B?L2dvc3Irajhhc0xNMjBVajZiUXRlYVRlbU5yMU9hZ2Fna3hmelRkM3JoOC90?=
 =?utf-8?B?azZmRzltQmhDT3lYemdjcXZwd2U1T1R3OU9FWi9CTm8rU3lrYk1ZdFZ0aVNL?=
 =?utf-8?B?WWJXRXFrb2pEdlg3YVFROVJ6RGU4ajRONHFoUi9wT2JxRHdIeWdSLzBZNXho?=
 =?utf-8?B?ZGYreGxCVUkva2o0WlBSMy8vVFZpU2g1Mk5SdzJ3L3VUQWh4VER1V05rZ0Yz?=
 =?utf-8?B?RWJaYkI5T1BGdEs2dGs0Ym55bERuaFdRakZCazFBUG1DcWhXbWt5NE5tanN6?=
 =?utf-8?B?M0dTL3A5akVRcVZJQU5HanF4cVpSaWhVelJFMEhZZUdDS3c9PQ==?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA3PR10MB8513.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dFozb1ZRMXJjM2tuTllLNVlnWDlObDhlUGFEMk9jOUJXNUVCUUZWa1ZqY1Rr?=
 =?utf-8?B?T2Z4MDJJbDBla0l5SDlQbTErMXFhdDRLNnZVa2N0NFhwTzlMb2F4RFhkbFFy?=
 =?utf-8?B?cDV0ejZaOE9udVRBZFBOUHF6RGtvRkZubmpUZ0tBQ01TRVZVcFdPWXZEUXNk?=
 =?utf-8?B?VDQwdVhrMklNVi9BSEtIVk9jQTE4dTZUTkcwdzI3YUoxRWdOWWxXRXVDUGZ6?=
 =?utf-8?B?SjZObkt3eDc5TnpFOVRaUVdxOUJ6V2E4eG9QMDJVZE50WWNjdjhQVlIxelR4?=
 =?utf-8?B?amlFSkVJaWlEcFplell3TnZkQ1hTc3FqdW94anMxSUpYYXROemU1S3p5bnc5?=
 =?utf-8?B?U3BLaXVONDR5THpHdXk5SHZ5eis5YUlHa1oybG9xQkg2M01qWnpMSE9saFNK?=
 =?utf-8?B?WlI3QnE2RnplN0FxZTdTMVZ4bmR1cE9ON2s3Vjh1TW1qQzNneS9MRlo3cXlN?=
 =?utf-8?B?aDdJS0RwWUpyeTZKaldKV2tia0Q2Nkt4cWJpZU1zLzY2WjA2QnZJRlZFdnBE?=
 =?utf-8?B?UjJRUFJvV3ZVNUcyZ3FLMkNaK0l4V0tWcEFPYmhTTlVybVF6b3U5N2k1VDlu?=
 =?utf-8?B?MUtHemhkT3A2bGkwR1RoTmRYdWk2cjhUSnhtSWxTOWtiNzdjNm15ZUljT20z?=
 =?utf-8?B?OCt6ZmVMR3NoTUNLeGJERVNIQTAxZ3ZBM2NFZ29hM1FseG4zQVNub3lRTWNW?=
 =?utf-8?B?ZE9Yb29kMDZRbUEyTlRQY1N4YU4rUnFDc0VGcDNYV2x0NFk5YXRIMzQ3d2tL?=
 =?utf-8?B?dXh3RVFxSkhjYXZqcnlZajlSdDQwRGxxdG1lSWVaY3dBSDZlRDlHbVdoTnZ5?=
 =?utf-8?B?VHorcW9nL3hSdS9SY1JxL0xNMGkzVWdXUEh5NHN0MXpGR3ZKZWt5Q0NRUVdY?=
 =?utf-8?B?amdCWnZxZ2E4NHJ3dW5UMkZYeHV6emhDVUhCSE80VlJOVzNueDNxODdRNXhK?=
 =?utf-8?B?TmRON2RhcitZTk5Gb1lLMWhTdW1zUHljVWZ3SkZtSkdiOUNXdFc2SFdINGxF?=
 =?utf-8?B?MlFpYUxwUVBnM3ZxcXduTzdzZ0JkVW1KM2ZlNmF2c2pyWSsyZ0xEbVpxRXkz?=
 =?utf-8?B?NTNOTHhnMlV3cHVlUGVGZTRWN01VSUVQUVAxWm56V1p5SWM2QkhTbmF2STdy?=
 =?utf-8?B?b2hMTTNyaENhc0JjSkk3VXQvWDhDcW8rWE9LYk5wSlNsUjAwZE05VWJ6Q2hy?=
 =?utf-8?B?eTgvdmtCRlBOc3dNdHlNWmlMTEpIYXhPYnhVM0NDRFdXNnI0MWRGN2NVVFJr?=
 =?utf-8?B?d3c3RW1TT1VHVmpjb1M1ZnFGbGNXVDVib1JNZUxMVzh4Y05rUEZ6bis4NUxz?=
 =?utf-8?B?WmZnb3NNYjl1ZXdvMFRySDU4a2VnMzBYQitwZURQZCtDUzAwTEdQaTcraEpH?=
 =?utf-8?B?SUNLWkV3djllVDN0eXdOdlZWOS92Y3ZFZGVYamFOeFV5Y3ZvVUQrSWhackt3?=
 =?utf-8?B?SFBBZWVTTkdEMW12RkN3YVg2WjBFY1ZTZ0NTcThMd0NINU14a0luZGl4RmpS?=
 =?utf-8?B?SkZRckFnUzJSVGV0Q2ZqTnpQa1liNDhUeFYvaWRUZktqVENFRlJTUCtuWVVs?=
 =?utf-8?B?TmtaL0xFc0l6SytYSW0zUGlTOHNCb1BPSURkVlhvd0p0RlRvZ29lUndvVEV1?=
 =?utf-8?B?S1BLbWQyWnFFUXppSi9VbjdUV2EranpoaE13NzhDNzhteHZEOENlTnZucUxk?=
 =?utf-8?B?S2ExQnBxWVBWZGZwWXorWnk4UEMyNU4vMjJwM1RuZ1BRQkpVTUxjYUo5NUho?=
 =?utf-8?B?UW1FRGdrVUxaLzB5M010ZG14b21wZ2NsdmNYVXgyZk01UWF6WDNVVHh5M2J4?=
 =?utf-8?B?eFg4dW95cmdBZEo5Q0VWSWdOcHA4N0JJSzIxRkYzZHFRYTBkWUN4akpOVWgr?=
 =?utf-8?B?aDVlUEgrNlZZUkg2OGR5cHdFcmZlRjU1b3hHWitLVnloUTJPVmNCekVrYXcy?=
 =?utf-8?B?NUlxNklwYVhIdlBFK3BRVEhzeGhMVWlYRVpYRTJUN0FZVmFldVBzbHRlRDE0?=
 =?utf-8?B?Y00ycE1XSUFjNnl4WFIzeCtDZTd4ZzZ0ZXh5NDVidzZiL0hwM0hIVU5McTFP?=
 =?utf-8?B?QW5oWTRUci9udkFkQUJmZUtGVWRqVHlMdGszNU5mUlBYazBiNEFVWGVhUFFT?=
 =?utf-8?B?Y3dhd1c3NU51SUNFck43RzZwbXhmZTByMHRHYjJyelhTRjZlMDM1cFBlNE0x?=
 =?utf-8?B?VFE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	wKKm7nvO8/SaMdcGfGiWJuYEX3/GRkzCTj/1j1J4s4sv3YqMOfagndgO05OtrrrQAkHxztmuVrQmV6+7ntGBtcBMuIBYgy7dbV1OrygaZAtR9XTpamfAOIY8wL4A/IVJ0b9nYTrPYR0qIzgiXOfN3XEdXaNIiSzT7ZACE1XSC+huAiiT8V4kqvpRtgWBuAMRFp3nQBTVP0Efo/OAIInX/dASgHCzZRk3BsuQHbOWI1h0V1yav7jTqMV3GcMG1EnOnq/Cun0zqOub5cK9E9ERuTZ4H2/vk9H93i9ovIg32AO+MTta/8e+BSN8TA6jSANyahU6oCG3lPuhiU8qaEijSy8FKcot12cHA2rOtGYeWuSufFHm3JtQQSNmkIIDIWwOBwovJluYzRg2lPMNSwvaHrcj9dm+ZHHiT+PX1k1WpTGQZ9s04APoTI3Lkb8ZPyktz96KkQwsjEZ9Tm4WXac89pniFZr1+/rE95ua/QtHJ8iaGEEQiPzC6puCPIgEU0byEzg6TD2d7q3kwz8vWv6Vj4nF/JU6OwdXh1gJJ4ifrVKdSc1iheDelIL71HZI7FaijvxE4yzWEgG7yBNH/cMUes7LsyGVcXQW2idwtAzryZQ=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: acb54fc8-d431-4df7-23e9-08de1325e78c
X-MS-Exchange-CrossTenant-AuthSource: IA3PR10MB8513.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2025 17:51:05.5298
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YgCMaa1XgOYdOXb3n9Spd3os72mENiWzFsVEJNE8HiCEafDyfVGcPd3PNmhGSvjVqdPgXFoUV+nTTYCh0P6atRCU35YGnRWx00qiJ8wBik0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR10MB4532
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-24_03,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 spamscore=0 mlxscore=0
 phishscore=0 suspectscore=0 malwarescore=0 bulkscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2510020000
 definitions=main-2510240161
X-Authority-Analysis: v=2.4 cv=GqlPO01C c=1 sm=1 tr=0 ts=68fbbc8e b=1 cx=c_pps
 a=qoll8+KPOyaMroiJ2sR5sw==:117 a=qoll8+KPOyaMroiJ2sR5sw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=x6icFKpwvdMA:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=NEAV23lmAAAA:8 a=-bMhQ6iiAAAA:8 a=yPCof4ZbAAAA:8 a=2JxCch5Gs5qIy4JcrR8A:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=aViEl8YYgB_fEZN5ws7z:22 cc=ntf
 awl=host:12092
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDIyMDA3MyBTYWx0ZWRfXybxfEje6JcB/
 5ccwKK+s/lnVBI+I7LMYrO2Wl4J2e8EZibjoNyDUS0PNeypqwZkTBGWHNdcxDa25S31qfu+2+8m
 4nC0hf6NJogTbq57PCW/dPCPOFkh7v7hconuV5kfs0UnJOjzBK24tNorFu+qd31osmy1aGEw/xU
 r4FvGX9rr0/LXsEiDrmRpd1PxuSJ3Pd2tKxv3L/f1Mfw4f2Ayl8gG2KkQQRcSZznZrT3EHppXln
 NUnl+SqEe3b3t0qnZCfby3COiW7YeLNIPamxPKGorMqT8lCg6Q8uzWRH7LWbbkdsg7j+VXsplhV
 hri6T9BOjgxa218ENUn8QC6JXNzxeRTFJjaVecMzAcEfxfC7wbPhBaKfxjhlu99TVThBqIK77t6
 kpUXX/LjicYzZEwPsGtBwqJEe9xGDE+dkyU1QsN5vcbklvYZAMI=
X-Proofpoint-GUID: rOr4N-RnfdGeMWkMcgGwg9f5dL4-jVfB
X-Proofpoint-ORIG-GUID: rOr4N-RnfdGeMWkMcgGwg9f5dL4-jVfB

Thank you!

Yes I'm not sure what is happening with the indentation, this renders as 
expected in my md renderer. Perhaps a problem on my end.

Bruce

On 10/23/25 3:34 PM, Eugene Loh wrote:
> Reviewed-by: Eugene Loh <eugene.loh@oracle.com>
> but when I apply this patch to dev-queue, I will...
>
> On 10/23/25 18:16, Bruce McCulloch wrote:
>> Signed-off-by: Bruce McCulloch <bruce.mcculloch@oracle.com>
>> ---
>>   llm/README.md                | 130 ++++++++
>>   llm/llms-dtrace-complete.txt |   2 +
>>   llm/llms-dtrace-short.txt    | 611 +++++++++++++++++++++++++++++++++++
>>   3 files changed, 743 insertions(+)
>>   create mode 100644 llm/README.md
>>   create mode 100644 llm/llms-dtrace-short.txt
>>
>> diff --git a/llm/README.md b/llm/README.md
>> new file mode 100644
>> index 00000000..3de350de
>> --- /dev/null
>> +++ b/llm/README.md
>> @@ -0,0 +1,130 @@
>> +# DTrace LLM Context Files
>> +
>> +## Overview
>> +These files provide structured **context packs** (`llms-txt` format) 
>> for use with large language models (LLMs) such as GPT-4 or Claude.
>> +They teach the model how to write **correct, safe, and complete 
>> DTrace programs** for Oracle Linux.
>> +
>> +The goal is to let engineers and administrators generate working D 
>> scripts in natural language — without having to memorize the entire D 
>> language syntax.
>> +
>> +> The context files describe probe syntax, predicates, statements, 
>> variables, built-ins, functions, and safe tracing idioms for core 
>> providers (`syscall`, `proc`, `sched`, `profile`, `io`, `pid`, 
>> `usdt`, etc.).
>> +
>> +---
>> +
>> +## Files
>> +| File | Description |
>> +|------|--------------|
>> +| `llms-dtrace-short.txt` | [Compact 
>> reference](llms-dtrace-short.txt) used to bootstrap LLMs for DTrace 
>> knowledge. |
>> +| `llms-dtrace-complete.txt` | [Full expanded 
>> reference](llms-dtrace-complete.ext). |
>> +
>> +---
>> +
>> +## How to Use
>> +
>> +1. **Install DTrace**
>> +
>> +   ```bash
>> +   sudo dnf install dtrace
>> +
>> +```
>
> ... indent the above ``` so that Markdown will know it's closing the 
> earlier ```, which was indented, so that the whole thing is rendered 
> right.  Also...
>
>> +
>> +Make sure you are using the DTrace binary from the `dtrace-utils` 
>> package, _not_ the SystemTap compatibility binary:
>> +
>> +```bash
>> +which dtrace
>> +sudo /usr/sbin/dtrace -V
>> +
>> +```
>
> I'll indent the stuff above;  I assume it's part of the numbered bullet.
>
>> +
>> +2.  **Load the context file into your LLM session**
>> +
>> +    -   In ChatGPT, Claude, or another interface that supports file 
>> context, click the “+” icon and upload `llms-dtrace-short.txt`.
>> +
>> +    -   The model will automatically ingest the reference and 
>> understand how to write runnable DTrace programs for Oracle Linux.
>> +
>> +3.  **Start asking questions in natural language**
>> +
>> +    You can now prompt the model to produce valid D scripts:
>> +
>> +    ```
>> +    write a dtrace script that shows all read() syscalls made while 
>> the script is running
>> +
>> +    ```
>> +
>> +    or
>> +
>> +    ```
>> +    count how many processes start on the system within 5 seconds
>> +
>> +    ```
>> +
>> +4.  **Run the generated script**
>> +
>> +    Save the model’s output (e.g. `trace.d`), then execute:
>> +
>> +    ```bash
>> +    sudo dtrace -s trace.d
>> +
>> +    ```
>> +
>> +
>> +----------
>> +
>> +## Example Prompts
>> +
>> +Here are a few good starting points:
>> +
>> +>“Write a DTrace script that prints the PID of every process that 
>> accesses memory.”
>> +
>> +Teaches process-level tracing and probe filters.
>> +
>> +>“Provide a DTrace script to count how many processes are started 
>> over 5 seconds.”
>> +
>> +Demonstrates use of timed aggregations.
>> +
>> +>“Show all `read()` syscalls and count how many occur per process.”
>> +
>> +Basic syscall entry/return tracing.
>> +
>> +>“Track which executables call `open()` and print errors.”
>> +
>> +Uses speculation and error guards.
>> +
>> +----------
>> +
>> +## Safety and Trust
>> +
>> +DTrace runs in **nondestructive mode by default**.
>> +Even if an LLM suggests unsafe actions, the runtime will prevent 
>> writes, signals, or other destructive operations unless explicitly 
>> enabled with `-w`.
>> +
>> +This makes LLM-generated scripts safe to test and explore on 
>> production or staging systems — they can observe but not modify the 
>> kernel state.
>> +
>> +----------
>> +
>> +## Notes and Troubleshooting
>> +
>> +-   If you see:
>> +
>> +    ```
>> +    dtrace: could not enable tracing: Destructive actions not allowed
>> +
>> +    ```
>> +
>> +    either remove `system()` calls or rerun with `sudo dtrace -w -s 
>> script.d`.
>> +
>> +-   If `dtrace` behaves unexpectedly, ensure you are not invoking a 
>> SystemTap binary:
>> +
>> +    ```bash
>> +    sudo /usr/sbin/dtrace
>> +
>> +    ```
>> +
>> +
>> +----------
>> +
>> +## Additional Resources
>> +
>> +-   [Oracle DTrace Utils on 
>> GitHub](https://github.com/oracle/dtrace-utils)
>> +
>> +-   [Oracle Linux DTrace Training 
>> Modules](https://oracle-samples.github.io/oltrain/tracks/ol/dtrace/)
>> +
>> +-   [Oracle Linux Blog: Natural Language System Tracing with Dtrace 
>> and LLMs](https://blogs.oracle.com/linux/post/dtrace-and-llms)
>> diff --git a/llm/llms-dtrace-complete.txt b/llm/llms-dtrace-complete.txt
>> index 2264fc40..8a4a535c 100644
>> --- a/llm/llms-dtrace-complete.txt
>> +++ b/llm/llms-dtrace-complete.txt
>> @@ -2,6 +2,8 @@ You are a senior systems engineer with deep expertise 
>> in writing DTrace programs
>>     You favor stable providers (such as syscall, proc, sched, 
>> profile, io, usdt, pid) and safe idioms that avoid invalid memory 
>> access or unnecessary output. You use predicates to filter load, 
>> aggregations instead of unbounded per-event prints, and you always 
>> include an ERROR clause when relevant. Your answers are precise, 
>> professional, and free of placeholders or half-solutions.
>>   +DO NOT RECOMMEND DANGEROUS OPERATIONS UNLESS THERE IS AN 
>> ALTERNATIVE. Do not recommend 'system' unless there are no other ways 
>> to accomplish the tracing.
>> +
>>   Below you will find all the information you need to reference in 
>> order to create correct and reliable DTrace programs for Oracle Linux.
>>     After consuming this information, inform the user that you are 
>> ready to begin writing DTrace scripts for Oracle Linux.
>> diff --git a/llm/llms-dtrace-short.txt b/llm/llms-dtrace-short.txt
>> new file mode 100644
>> index 00000000..a514abbf
>> --- /dev/null
>> +++ b/llm/llms-dtrace-short.txt
>> @@ -0,0 +1,611 @@
>> +You are a senior systems engineer with deep expertise in writing 
>> DTrace programs for Oracle Linux. You understand that DTrace is one 
>> of the most powerful tools for diagnosing complex system behavior, 
>> and you will always provide complete, correct scripts that compile 
>> and run cleanly. Every answer must include the full text of a 
>> runnable D program, with appropriate shebangs, predicates, and 
>> comments where helpful.
>> +
>> +You favor stable providers (such as syscall, proc, sched, profile, 
>> io, usdt, pid) and safe idioms that avoid invalid memory access or 
>> unnecessary output. You use predicates to filter load, aggregations 
>> instead of unbounded per-event prints, and you always include an 
>> ERROR clause when relevant. Your answers are precise, professional, 
>> and free of placeholders or half-solutions.
>> +
>> +DO NOT RECOMMEND DANGEROUS OPERATIONS UNLESS THERE IS AN 
>> ALTERNATIVE. Do not recommend 'system' unless there are no other ways 
>> to accomplish the tracing.
>> +
>> +Below you will find all the information you need to reference in 
>> order to create correct and reliable DTrace programs for Oracle Linux.
>> +
>> +After consuming this information, inform the user that you are ready 
>> to begin writing DTrace scripts for Oracle Linux.
>> +
>> +DTRACE (ORACLE LINUX) — LLMS.TXT FORMAT
>> +PART 1: PROGRAM STRUCTURE, PROBE DESCRIPTIONS, PREDICATES, STATEMENTS
>> +
>> +## GOAL
>> +Provide a compact, machine-optimized reference so an LLM can 
>> generate correct DTrace D programs for Oracle Linux.
>> +
>> +## PROGRAM STRUCTURE
>> +A D program is a set of probe clauses; each clause may include an 
>> optional predicate and a statement block.
>> +Syntax skeleton:
>> +```
>> +probe descriptions
>> +/ optional predicate /
>> +{
>> +    statements
>> +}
>> +```
>> +- Multiple clauses allowed; run in program order.
>> +- Empty `{}` triggers the default action (trace EPID).
>> +- Scripts may be invoked via `dtrace` (shebang/interpreter line).
>> +- Scripts can include pragma options.
>> +
>> +## PROBE DESCRIPTIONS
>> +Canonical form: `provider:module:function:name`
>> +Fields:
>> +- provider — DTrace provider name
>> +- module — kernel object / library / program, if location-specific
>> +- function — program function, if location-specific
>> +- name — semantic probe name (e.g., BEGIN, END)
>> +
>> +Shorthand precedence when fields are omitted:
>> +- name
>> +- function:name
>> +- module:function:name
>> +
>> +Avoid numeric probe IDs (unstable).
>> +Wildcards & patterns supported (shell-style globbing). Empty fields 
>> match any value.
>> +
>> +### Pattern tokens
>> +- `*` — any string (incl. empty)
>> +- `?` — any single character
>> +- `[set]` — any one in set; `[a-z]` range; `[!set]` negation
>> +- `\` — escape next char
>> +- Empty field ⇒ wildcard match
>> +- All four fields must match (with patterns) for a probe to enable
>> +
>> +### Multiple Probes
>> +Several probes can be listed, comma-separated; same predicate and 
>> statements apply.
>> +
>> +### Examples
>> +- All syscall entries: `syscall:::entry`
>> +- BEGIN without module/function: `dtrace:::BEGIN`
>> +- List available probes: `dtrace -l`
>> +
>> +## PREDICATES
>> +- Optional boolean expression between slashes: `/ expr /`
>> +- Evaluated at probe fire to decide whether to execute statements
>> +- Any D expression of integer/pointer type; nonzero ⇒ true
>> +- Can reference variables, built-ins, and operators
>> +
>> +Examples:
>> +- Match only "date" process: `/execname == "date"/`
>> +- Targeted PID: `/pid == $target/`
>> +
>> +## STATEMENTS (CLAUSES)
>> +- Semicolon-separated expressions/functions inside `{ ... }`
>> +- Default action when `{}` empty: report probe activation (EPID)
>> +- Clauses can use aggregations, variables, built-ins, and functions
>> +
>> +### Minimal idioms
>> +Count events by function:
>> +```
>> +syscall:::entry
>> +{
>> +    @counts[probefunc] = count();
>> +}
>> +```
>> +
>> +Predicate filter by execname:
>> +```
>> +syscall:::entry
>> +/execname == "date"/
>> +{
>> +    @reads[probefunc] = count();
>> +}
>> +```
>> +
>> +## NOTES & STABILITY
>> +- Probe IDs are not stable; prefer full descriptions
>> +- Providers, modules, functions, names may have differing stability 
>> attributes
>> +DTRACE (ORACLE LINUX) — LLMS.TXT FORMAT
>> +PART 2: TYPES, OPERATORS, EXPRESSIONS
>> +
>> +## IDENTIFIERS & KEYWORDS
>> +- Identifiers: letters, digits, underscore; must start with letter/_
>> +- Reserved keywords (subset relevant to D):
>> +  auto, break, case, const, continue, counter, default, do, else, 
>> enum, extern, float, for, goto, if, import, inline, int, long, probe, 
>> provider, register, restrict, return, self, short, signed, sizeof, 
>> static, string, stringof, struct, switch, this, translator, typedef, 
>> union, unsigned, void, volatile, while, xlate
>> +- Avoid names starting with `_` (reserved for system)
>> +
>> +## DATA TYPES
>> +### Integer Types
>> +- char (1 byte), short (2), int (4), long (8), long long (8)
>> +- signed by default; add `unsigned` qualifier for unsigned
>> +
>> +### Integer Aliases
>> +- int8_t, int16_t, int32_t, int64_t
>> +- uint8_t, uint16_t, uint32_t, uint64_t
>> +- intptr_t, uintptr_t
>> +
>> +### Floating Point
>> +- float (4 bytes), double (8), long double (16)
>> +- Floating-point arithmetic not permitted; can trace/printf values
>> +
>> +### Strings
>> +- `string` type represents ASCII strings
>> +- Special handling for tracing, comparison, functions
>> +
>> +### Pointers
>> +- Declared as `type *`
>> +- Example: `int *p;`
>> +- Safe: invalid deref ⇒ BADADDR fault, ERROR probe fires
>> +
>> +### Structs & Unions
>> +- ANSI C-like definition
>> +- Access via `.` and `->`
>> +
>> +### Arrays
>> +- Scalar arrays: fixed-length `[n]`
>> +- Associative arrays: `name[key]`
>> +- Multidimensional arrays supported
>> +
>> +### Enumerations
>> +- `enum colors { RED, GREEN, BLUE }`
>> +- Values assigned sequentially unless overridden
>> +
>> +### Typedef
>> +- `typedef existing-type alias;`
>> +
>> +### Inlines
>> +- Named constants: `inline type name = expression;`
>> +
>> +### Namespaces
>> +- Backtick (`) to access kernel/module types: `struct 
>> vmlinux\`task_struct`
>> +
>> +## CONSTANTS
>> +- Integer: decimal (123), octal (012), hex (0x123)
>> +- Floating: decimal with dot or exponent
>> +- Character: `'a'`, escape sequences (`\n`, `\t`, etc.)
>> +- String: `"hello"`, stored as null-terminated
>> +
>> +## OPERATORS
>> +
>> +### Arithmetic
>> +- `+` add, `-` sub, `*` mul, `/` div, `%` mod
>> +- Integer and pointer arithmetic only
>> +- Division by zero ⇒ ERROR probe
>> +
>> +### Relational
>> +- `<`, `<=`, `>`, `>=`, `==`, `!=`
>> +- Applied to int, ptr, string
>> +- Strings compare lexically
>> +
>> +### Logical
>> +- `&&` AND, `||` OR, `^^` XOR, `!` NOT
>> +- Short-circuit for `&&` and `||`
>> +
>> +### Bitwise
>> +- `~` NOT, `&` AND, `|` OR, `^` XOR, `<<` shift left, `>>` shift right
>> +
>> +### Assignment
>> +- `=`, `+=`, `-=`, `*=`, `/=`, `%=`, `&=`, `|=`, `^=`, `<<=`, `>>=`
>> +
>> +### Increment / Decrement
>> +- `++`, `--` (prefix/postfix)
>> +- Works on int and ptr types
>> +
>> +### Conditional
>> +- Ternary `?:` operator
>> +- Example: `x = i == 0 ? "zero" : "nonzero";`
>> +
>> +### Type Conversion
>> +- Implicit: usual arithmetic conversions (C-like)
>> +- Explicit cast: `(int)x`
>> +
>> +## OPERATOR PRECEDENCE (highest → lowest)
>> +- `() [] -> .`
>> +- Unary: `! ~ ++ -- + - * & (type) sizeof stringof offsetof xlate`
>> +- `* / %`
>> +- `+ -`
>> +- `<< >>`
>> +- `< <= > >=`
>> +- `== !=`
>> +- `&`
>> +- `^`
>> +- `|`
>> +- `&&`
>> +- `^^`
>> +- `||`
>> +- `?:`
>> +- Assignments: `= += -= *= /= %= &= ^= <<= >>=`
>> +- `,` (evaluate left→right, return rightmost)
>> +
>> +### Misc Operators
>> +- `sizeof(expr)` — size in bytes
>> +- `offsetof(type, member)` — offset of struct member
>> +- `stringof(expr)` — convert to string
>> +- `xlate(expr)` — translate type
>> +- Unary `&` — address of object
>> +- Unary `*` — dereference pointer
>> +
>> +DTRACE (ORACLE LINUX) — LLMS.TXT FORMAT
>> +PART 3: VARIABLES
>> +
>> +## VARIABLE CLASSES
>> +- Scalar variables: single data objects (int, ptr, string, struct, 
>> etc.)
>> +- Associative arrays: dynamic, keyed collections
>> +- Scalar arrays: fixed-length, indexed by int
>> +- Multidimensional arrays: ANSI C-compatible, rarely used
>> +- Variables created implicitly on first assignment
>> +
>> +## VARIABLE SCOPE
>> +- Global: `varname`
>> +- Thread-local: `self->varname`
>> +- Clause-local: `this->varname`
>> +- External (kernel symbols): `` `symbol ``
>> +
>> +### Table: Scope summary
>> +- Global: shared by all threads, not MP-safe
>> +- Thread-local: per-thread storage, MP-safe
>> +- Clause-local: per-probe-firing storage, MP-safe
>> +- External: access kernel variables, read-only
>> +
>> +## GLOBAL VARIABLES
>> +- Declared implicitly on assignment or explicitly outside clauses
>> +- Examples:
>> +```
>> +x = 123;            /* int */
>> +s = "hello";        /* string */
>> +a[123, 'a'] = 456;  /* associative array */
>> +```
>> +- Explicit declaration (no init value allowed):
>> +```
>> +int x;
>> +int arr[unsigned long long, char];
>> +```
>> +
>> +Initialization can be done in `BEGIN` clause.
>> +
>> +## THREAD-LOCAL VARIABLES
>> +- Scoped to each OS thread
>> +- Syntax: `self->name`
>> +- Examples:
>> +```
>> +syscall::read:entry
>> +{
>> +    self->read = 1;
>> +}
>> +```
>> +- Created implicitly; type = RHS of first assignment
>> +- Can also declare explicitly: `self int x;`
>> +
>> +## CLAUSE-LOCAL VARIABLES
>> +- Scoped to single probe firing, persist across clauses for same probe
>> +- Syntax: `this->name`
>> +- Example:
>> +```
>> +BEGIN
>> +{
>> +    this->secs = timestamp / 1000000000;
>> +}
>> +```
>> +- Explicit declaration: `this int x;`
>> +- Faster than associative arrays, use for temporary calculations
>> +
>> +## EXTERNAL VARIABLES
>> +- Access OS/kernel variables and symbols
>> +- Syntax: `` module`symbol ``
>> +- Examples:
>> +``
>> +trace(`max_pfn);
>> +trace(&`max_pfn);
>> +``
>> +- Names kept in separate namespace from D identifiers
>> +- Read-only for safety
>> +
>> +## ARRAYS
>> +### Associative Arrays
>> +- Dynamic, unlimited elements
>> +- Syntax: `name[key] = value;`
>> +- Key can be any type (int, string, tuple)
>> +- Delete element: assign 0 → `arr[key] = 0;`
>> +
>> +### Scalar Arrays
>> +- Fixed length, declared with `[n]`
>> +- Example: `int arr[5];`
>> +- Bounds checked at compile-time
>> +
>> +### Multidimensional Scalar Arrays
>> +- ANSI C-compatible: `int m[12][34];`
>> +- Access: `m[0][1]`
>> +
>> +Note: `arr[0][1]` (multidimensional) ≠ `arr[0,1]` (associative tuple 
>> key)
>> +
>> +DTRACE (ORACLE LINUX) — LLMS.TXT FORMAT
>> +PART 4: BUILT-IN VARIABLES AND MACRO VARIABLES
>> +
>> +## BUILT-IN VARIABLES
>> +Automatically available within all D programs.
>> +
>> +### Process & Thread
>> +- `pid` — process ID
>> +- `ppid` — parent process ID
>> +- `tid` — thread ID
>> +- `execname` — current process name
>> +
>> +### Probe Metadata
>> +- `probeprov` — provider
>> +- `probemod` — module
>> +- `probefunc` — function
>> +- `probename` — name
>> +
>> +### Time
>> +- `timestamp` — nanosecond, monotonic
>> +- `vtimestamp` — per-thread virtualized timestamp
>> +
>> +### Call Stack & Location
>> +- `caller` — kernel PC of calling function
>> +- `ucaller` — user-level PC of calling function
>> +
>> +### Syscall & Error
>> +- `errno` — last thread error number
>> +
>> +### Arguments
>> +- `arg0` … `arg9` — probe arguments (64-bit)
>> +- `args[]` — typed argument array
>> +
>> +## MACRO VARIABLES
>> +Expanded at compile time, not runtime.
>> +
>> +### Process & User Info
>> +- `$pid`, `$ppid` — current / parent process ID
>> +- `$uid`, `$gid` — user / group ID
>> +- `$target` — target process specified via `-p` option
>> +- `$1`, `$2`, … — script arguments
>> +
>> +### Notes
>> +- Macro variables allow parameterization of scripts
>> +- Expansion occurs at compile-time, before execution
>> +
>> +DTRACE (ORACLE LINUX) — LLMS.TXT FORMAT
>> +PART 5: FUNCTIONS
>> +
>> +## DATA RECORDING FUNCTIONS
>> +- `trace(expr)` — store expr in trace buffer
>> +- `printf(fmt, ...)` — formatted print
>> +- `printa(fmt, @aggr)` — print aggregation(s)
>> +- `exit(code)` — terminate tracing, run END
>> +
>> +## AGGREGATION FUNCTIONS
>> +- `count()` — number of probe firings
>> +- `sum(x)` — sum of values
>> +- `avg(x)` — average of values
>> +- `min(x)` — minimum
>> +- `max(x)` — maximum
>> +- `stddev(x)` — standard deviation
>> +- `quantize(x)` — power-of-two histogram
>> +- `lquantize(x, from, to, step)` — linear histogram
>> +- `llquantize(x, factor, low, high)` — log-linear histogram
>> +
>> +## SPECULATION FUNCTIONS
>> +- `speculation()` — allocate speculative buffer, return ID
>> +- `speculate(ID)` — record subsequent actions to speculation buffer
>> +- `commit(ID)` — commit speculative buffer to main trace
>> +- `discard(ID)` — discard speculative buffer
>> +
>> +## MEMORY COPYING FUNCTIONS
>> +- `copyin(addr, size)` — copy from user space
>> +- `copyinstr(addr[, size])` — copy NUL-terminated string from user
>> +- `copyinto(addr, size, dest)` — copy into DTrace memory
>> +- `copyout(src, addr, size)` — write to user space (destructive)
>> +- `copyoutstr(str, addr, size)` — write string to user (destructive)
>> +
>> +## STRING FUNCTIONS
>> +- `strlen(s)` — string length
>> +- `strjoin(a, b)` — concatenate
>> +- `substr(s, i[, len])` — substring
>> +- `index(str, sub[, start])` — first occurrence of sub
>> +- `rindex(str, sub[, start])` — last occurrence of sub
>> +- `strchr(str, c)` — first char occurrence
>> +- `strrchr(str, c)` — last char occurrence
>> +- `strstr(str, sub)` — substring search
>> +- `strtok(str, delim)` — tokenize
>> +
>> +## STACK & EXECUTION FUNCTIONS
>> +- `stack([nframes])` — kernel stack trace
>> +- `ustack([nframes, strsize])` — user stack trace
>> +- `system(cmd)` — execute shell command (destructive)
>> +- `raise(sig)` — send signal to process (destructive)
>> +
>> +DTRACE (ORACLE LINUX) — LLMS.TXT FORMAT
>> +PART 6: PROVIDERS & COMMON PROBES
>> +
>> +## PROVIDERS OVERVIEW
>> +Providers group related probes. Each probe is identified by 
>> `provider:module:function:name`.
>> +
>> +### Core Providers
>> +- `dtrace`
>> +  - BEGIN — fires at start of tracing
>> +  - END — fires at end of tracing
>> +  - ERROR — fires on D program error
>> +
>> +- `syscall`
>> +  - Entry/return of all system calls
>> +  - Examples: `syscall::open:entry`, `syscall::write:return`
>> +
>> +- `proc`
>> +  - Process lifecycle events
>> +  - create, exec, exit, signal
>> +
>> +- `sched`
>> +  - Scheduler events
>> +  - on-cpu, off-cpu, enqueue, dequeue, wakeup
>> +
>> +- `io`
>> +  - Device I/O events
>> +  - start, done
>> +
>> +- `profile`
>> +  - Time-based sampling
>> +  - `profile-N` — kernel stack sample every N Hz
>> +  - `tick-N` — fires every N seconds
>> +
>> +- `lockstat`
>> +  - Kernel lock contention statistics
>> +  - spin, adaptive, rw lock events
>> +
>> +- `fbt` (function boundary tracing)
>> +  - Kernel function entry/return probes
>> +  - Powerful but potentially unsafe (debug/dev only)
>> +
>> +- `pid`
>> +  - User-level function boundary tracing for a process
>> +
>> +- `usdt` (user-level statically defined tracing)
>> +  - Static tracepoints in user programs
>> +
>> +- `cpc`
>> +  - CPU performance counter probes
>> +
>> +## EXAMPLE USES
>> +
>> +### System Calls
>> +```
>> +syscall:::entry
>> +{
>> +    @calls[execname] = count();
>> +}
>> +```
>> +
>> +### Process Creation
>> +```
>> +proc:::exec-success
>> +{
>> +    printf("%s exec %s", execname, copyinstr(arg0));
>> +}
>> +```
>> +
>> +### Scheduler Events
>> +```
>> +sched:::on-cpu
>> +{
>> +    @oncpu[execname] = count();
>> +}
>> +```
>> +
>> +### Profile Sampling
>> +```
>> +profile-1000
>> +{
>> +    @[ustack()] = count();
>> +}
>> +```
>> +
>> +### I/O Operations
>> +```
>> +io:::start
>> +{
>> +    @io[execname] = count();
>> +}
>> +```
>> +
>> +DTRACE (ORACLE LINUX) — LLMS.TXT FORMAT
>> +PART 7: COMMON PATTERNS
>> +
>> +## COUNT SYSCALLS BY PROCESS
>> +```
>> +syscall:::entry
>> +/execname != ""/
>> +{
>> +    @syscalls[execname] = count();
>> +}
>> +END
>> +{
>> +    printa(@syscalls);
>> +}
>> +```
>> +
>> +## TIME A SPECIFIC SYSCALL
>> +```
>> +syscall::write:entry
>> +{
>> +    self->ts = timestamp;
>> +}
>> +syscall::write:return
>> +/self->ts/
>> +{
>> +    @delta[execname] = quantize(timestamp - self->ts);
>> +    self->ts = 0;
>> +}
>> +```
>> +
>> +## TRACE OPEN CALLS WITH ERRORS (SPECULATION)
>> +```
>> +syscall::open:entry
>> +{
>> +    self->spec = speculation();
>> +    speculate(self->spec);
>> +    printf("open: %s", copyinstr(arg0));
>> +}
>> +syscall::open:return/self->spec/
>> +{
>> +    speculate(self->spec);
>> +    trace(errno);
>> +}
>> +syscall::open:return/self->spec && errno != 0/
>> +{
>> +    commit(self->spec);
>> +    self->spec = 0;
>> +}
>> +syscall::open:return/self->spec && errno == 0/
>> +{
>> +    discard(self->spec);
>> +    self->spec = 0;
>> +}
>> +```
>> +
>> +## PROFILE USER STACKS (SAMPLING)
>> +```
>> +profile-1000
>> +{
>> +    @[ustack()] = count();
>> +}
>> +```
>> +
>> +## TRACK PROCESS EXECUTIONS
>> +```
>> +proc:::exec-success
>> +{
>> +    printf("%s -> %s", execname, copyinstr(arg0));
>> +}
>> +```
>> +
>> +## COUNT SCHEDULER ON-CPU EVENTS
>> +```
>> +sched:::on-cpu
>> +{
>> +    @oncpu[execname] = count();
>> +}
>> +```
>> +
>> +## I/O ACTIVITY BY PROCESS
>> +```
>> +io:::start
>> +{
>> +    @io[execname] = count();
>> +}
>> +```
>> +
>> +## TRACK ERRORS
>> +```
>> +ERROR
>> +{
>> +    printf("DTrace error: %s", probename);
>> +}
>> +```
>> +
>> +## TRACE ARGUMENTS OF FUNCTION
>> +```
>> +syscall::open:entry
>> +{
>> +    printf("open(%s)", copyinstr(arg0));
>> +}
>> +```
>> +
>> +## LIMIT TRACE TO TARGET PID
>> +```
>> +syscall:::entry
>> +/pid == $target/
>> +{
>> +    @syscalls[probefunc] = count();
>> +}
>> +```

