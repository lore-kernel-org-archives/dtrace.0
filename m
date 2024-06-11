Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3A635FB9C
	for <dtrace@lists.linux.dev>; Tue, 11 Jun 2024 17:34:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718127275; cv=fail; b=R6vtqVlIHSFMtIos0o7QlwgX20ZIFCbmTT1uI7rv1NE69M0/e97WnjP7ca3UzXnlxGTiiUQrqp4pF1wMbsbiKg1Q/qZcNPw0RJzRoDCMk27u3jGQ/gNWdCF9aJwwFsQ/cwa8D6aeRO+SDKs5yMhOGLs6K1Va1MgKTfNaY4g4dAM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718127275; c=relaxed/simple;
	bh=3DasMTyEbNIUObpIwZQIPt9nV4HWxbNTYdbg++u/Sfw=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=N5mJWGuxV4sqdJ2AAPnWbiQ1i59qjN0arjFWBinEYrNSXm3Zp3mxvTiwV7q36DSKGvGN4cCAMS4AYpv0NXOGBoVOQG7z1W4bXubY3sojzurqS9XdGjuP0WYonANcQKNovqxZhho6KFp9/6yIFGvWojt5DxW79KCqMnQfDvtKNNk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=DDtufAlg; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=sMBmqHYl; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="DDtufAlg";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="sMBmqHYl"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45BFeTTs004119
	for <dtrace@lists.linux.dev>; Tue, 11 Jun 2024 17:34:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	message-id:date:subject:to:cc:references:from:in-reply-to
	:content-type:content-transfer-encoding:mime-version; s=
	corp-2023-11-20; bh=G+W2W8jiUTdGrl8pUIuFeluoAYYMAnIRYuTz4KWdkQ4=; b=
	DDtufAlgudBN6gwbpk1uovfjJ5mR2N8Ej8O7mOsyO19Z6h2994Xw1qrqeJVcQfhV
	RcawX8qT9MdjMRLqUhmlVgN+NlJSW3eRPwtY9BRY5VdusAjbLSFz1Lv3Scx2P0qm
	/YYcUXTGpoXrNUV/5von3BE8KV1ktSxJhUiKtyjbOJQNZFoO4pj0YFWcVI9UiH3V
	bWpkwSA7fwEnMzBKMKHza/nQMQdNjN2t8Ke6EUcWv+vVZSB2n7Vn4nGc6a4vn+dH
	bY289NA2rjhQhFTA09CiRUt8xnYGWJARJKMNrnFCORw1MxLlCR/yjsXvNjTkmXFD
	vYfB6np+afF2F9KFnwuPCQ==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3ymh7dnd6w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 11 Jun 2024 17:34:31 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 45BH9F1W012525
	for <dtrace@lists.linux.dev>; Tue, 11 Jun 2024 17:34:30 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2168.outbound.protection.outlook.com [104.47.57.168])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 3ync9x748j-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 11 Jun 2024 17:34:30 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ynltubj+/iw95/fkXgkkuNq/1GGRDcNtgCNxcsAsK7QS9duczkWQ7voG139/pq+MiNmcLbZ7SjLR/rNyLIiBIf5S3qXloZPREXZC2B4GOoJP9Oh1MORybG03MrVhKzfo3I3ij/9Lh++SVyVjYdjfmD3ru3/tjYhsxxiDwp/UnRTWDsFsdVlGS0tNEgd9cSmQqLVNxPx8fP69qPZNJI52GKlt1R6u292Jy1xT9FlUl5hFkB7AZxaAFX5LdVzBLw8RyQzcGwcMtzzerrjywPey+8cWuDeZW034fM4LkyOw842XG8RM/T8bSO0CjpjOqXSlVMewuUnr7IQ44d9gBwJuww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G+W2W8jiUTdGrl8pUIuFeluoAYYMAnIRYuTz4KWdkQ4=;
 b=FwjmzbQjYKooICOE47jdvXEN0SH5oeXZ0dP4RF8wjKNRqcRnEn4YhWQqnz+AY8zKacGSLMjEg7aQCrTuINGZ3/ak78LYSgi55SrNfRjS9iyUu0zEigAOru3IWoxDpc+dYgm5SXE1NaDiArKqCzcoUePGB1aeLMDzo8Au/mN3F1o5jLRJ4udTUQX2oeLXk9qFqbGrj57+Y6rMDs9iGGc3wE4cwgOf2bYkMt1TB5/67CDQ385zfmDFX0ny6RtQYNjx7X+YBUEPBS6DU+erLUj0LDOzYD9+Gyve6V9skzAJ7t/6/rpcFdfgcLgSvVpR/174CSyzAdMWZhzrQEolGsCnow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G+W2W8jiUTdGrl8pUIuFeluoAYYMAnIRYuTz4KWdkQ4=;
 b=sMBmqHYlfi37WsUbJlA9Uf5WI2kBzwohepqmxd8ZgSR5bkeup+5gTTrMy2l9KzP8qKF3vl2SfV3ewX0/uuzEYYTISx4I6r67U73Gy9WgaEpbKKZSymn9EByOBvnswFYEPs6oRax35SdJk9nzx2mbuf0xQ31livLIv56IoVTiwjQ=
Received: from BLAPR10MB5267.namprd10.prod.outlook.com (2603:10b6:208:30e::22)
 by CO1PR10MB4450.namprd10.prod.outlook.com (2603:10b6:303:93::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.36; Tue, 11 Jun
 2024 17:34:28 +0000
Received: from BLAPR10MB5267.namprd10.prod.outlook.com
 ([fe80::682b:c879:9f97:a34f]) by BLAPR10MB5267.namprd10.prod.outlook.com
 ([fe80::682b:c879:9f97:a34f%7]) with mapi id 15.20.7633.037; Tue, 11 Jun 2024
 17:34:27 +0000
Message-ID: <7c11a10e-3966-4ee5-90cb-bff1c10a0145@oracle.com>
Date: Tue, 11 Jun 2024 18:33:55 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] print() action: identify ctf object used for print
To: dtrace@lists.linux.dev
Cc: dtrace-devel@oss.oracle.com
References: <20240426133327.578092-1-alan.maguire@oracle.com>
Content-Language: en-GB
From: Alan Maguire <alan.maguire@oracle.com>
In-Reply-To: <20240426133327.578092-1-alan.maguire@oracle.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM9P195CA0014.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:20b:21f::19) To BLAPR10MB5267.namprd10.prod.outlook.com
 (2603:10b6:208:30e::22)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BLAPR10MB5267:EE_|CO1PR10MB4450:EE_
X-MS-Office365-Filtering-Correlation-Id: ab2b4dd9-efd2-454c-c495-08dc8a3cbe7c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230032|1800799016|366008|376006;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?Y1BHdnpqQUpKd2hkQ1dNZjI1WDBCSGNkSWJtZ1U4TCtDUnc4VDNiZXc2RXI4?=
 =?utf-8?B?NzEzZE1vNUZLNzVrdSszM3FZUTNsYnEvdnloRzRoQzZZMFBodGtES3V2RWhn?=
 =?utf-8?B?Mjl5UU1zVjZnVUdDbm4wTElvVTRyRGtOb2tOMXRiUHpkbmhVUVlVSC9IRUI5?=
 =?utf-8?B?Qmp1NHRTeG5rMy9Ra2E0Sy9KaWE1SFZSeVNBbUJFQ1pnNG9XbzFhY3FKOVp3?=
 =?utf-8?B?MVRmK25KR0hwVXpyYnM0NURNRzFwRS9tTmQ4MEZVbHZkVFFNVGNtOVBHUk9O?=
 =?utf-8?B?K21MRzd4ZzF0M1FaaGRJbHRQTFMyOHpmYVAzRzFwM1N3a3ZrZnhLWHc1ZlM4?=
 =?utf-8?B?czdCdjU3Q0J1MWx3dTFDSmhzN21HZ1JxUmRjWFU4SVlrMHcrMXlyclRYTkYz?=
 =?utf-8?B?Y0p4UkVNZEk0OXlCTzlMSHFhdS9ZLzQxd20xOC9rUnBBZ2ZoQjNCOUM1eTFT?=
 =?utf-8?B?WGF4NkNJY2NJVHErVGNpRFJOUUtVd056RmxLQitXZkZwUXhNZVZIZGNnSmJT?=
 =?utf-8?B?bXFqOFNCU1NVeUVCZTIvaTByeVlaRFlkMVJici80ZWlOZ2tDazFDZGtFaTUz?=
 =?utf-8?B?YVVVb0hUamp3dFpPZlM0RTRWVVVxR1QxYXpWNmV1WG5GaFRRY2tqVXZxNlFx?=
 =?utf-8?B?K2RpbS9JSDBxZUpFRzVaMG8wTWp4dCtxWjJNTHltRUxzRm5rZmhmdjNDMXJF?=
 =?utf-8?B?WGt4cWg2UElnSS9jYmZjNDFxTTlIS2RFZEtpekxiNUhZWE4yRytBR2VhbG5Z?=
 =?utf-8?B?dUxCeG42bTF4LzRzUndSZExpaUtLZ0NUWE02V3dHWERtUDhxL1l1WkdXUWhD?=
 =?utf-8?B?VityUXpzTC9lRUNWbWk4aTBOTXFsUDJXck1ETDNBbUdXOFo1MHZ4bUJYWmw4?=
 =?utf-8?B?bjNCZXRkMG5PZmltanJCU1hoR1JOajRaUlJ4SlFVTEtDRWFLUzBLNjFRY0Q2?=
 =?utf-8?B?VTF5MkJ0TkM0K3Q4bjd4K2xPcmNJeXNmbTNKU1VMd1cxRzBJRHBRTVE1elhq?=
 =?utf-8?B?VmI4YXo3RXRMa3FJTmhzaTVUNzJZL1VjQzllTGk1RUFBNGZiZTIrckdUZk5L?=
 =?utf-8?B?RmZPT3NDa2R6VDBOWE0vM1MrQjNFUFJVaHloQndoTUFuT0Rpa3BYdXQ4Qm1K?=
 =?utf-8?B?djlQc3NrWG1EZnpBbURGM0J5SlFoRUdrdW54MitBY1hrTHk4TVUyYXNIeDRS?=
 =?utf-8?B?WnF2b3c4UkJsUHNzdm5abG1YdkpzN254VGQ5ZnRMQUFvS0JUNjZUYW5SUkpm?=
 =?utf-8?B?cDBJb201NVJtdEFBQnRZVU5CK2krZGg1WFl0MStpM1pwVE1YVHVkeGFRUnhl?=
 =?utf-8?B?bWJ5UGp1cnF4bmwzaHBFY0tGUGVmaWh5RmU3TEE0V0wwak4xKzFMak9rOTdt?=
 =?utf-8?B?R00vem8zK1MxNzZoanBIK1RQRlhXZ0hLWlpJb01Pd0FOZ3BJQSsvanVrN3pt?=
 =?utf-8?B?RENKQys4RVZjYnZsNUxncGtXdXN6a3RHdmJiOUdHK0JqWGdjWEdGYm5Eazlh?=
 =?utf-8?B?WTdnajB3bGZaN3dMTTB4OEwwK1hjN0FOZDhidnlTbWZablRWRUVZcUlMV3F2?=
 =?utf-8?B?SDJudDBoY2ZrWkdiMUN6L0JlcGlRWlJXWkVHMC9YRlRwZjR4c3N2WWM3eWdk?=
 =?utf-8?B?M3UwYVZOWGQvTElzUnNQWUpmejl5ME0rZHJGd1lXTDd3eWVrR2ErSGtVMXNF?=
 =?utf-8?B?Z3VlcEVRNFJEOW5ES2pGRS9pakJTL3cvcFplTFRhS1k4alUxRTdIcnJoV1Zo?=
 =?utf-8?Q?C6a3jq5Cu1pQfYSsiGbpilO5ptw0mESNF0//69Z?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BLAPR10MB5267.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230032)(1800799016)(366008)(376006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?aDlaSUtTYjNRbGxac2J3NitnY0pTWDVuYlFOQnMzRmxOczhFY1BYYTBMOFo1?=
 =?utf-8?B?WCtGa3NZNnZkS3pDY29nUmJzcFFLNE5ZaTNFYlpVbXJjNVQ4YmQ2WG5nMU03?=
 =?utf-8?B?STZSMjBXTjI3dm1PNDJBNFBpblo2NmdoWm15R0lOQ3djQ2FPaFBTSFJSMUNK?=
 =?utf-8?B?ZzlCRTlaK3I0NkdXaWZaL2p2c3VMOHdyemo5UlhZeHdHUVpWL3lBUjFNWElh?=
 =?utf-8?B?V3JEbmo3UUdDeG01MENrK2x1b3dYUnI0WmxTR2FjRDZnV21NNFIwRElSbmhB?=
 =?utf-8?B?RENRRTk2dWNHREQ4NE93YjNBdTFDNWVUbkcyN1luYnpjOElFTnE4aHNPUWx1?=
 =?utf-8?B?K0tuYUlld05GeFUxQW9IK255enZPanhjL0k3QzZsRFdmemlqWmlNNENpVDc5?=
 =?utf-8?B?OWZPbmdTNktIVDdUSDlyK0pFeit6RlJnWEJDU3hZTUtCVGhMYml5Vm5Tblh2?=
 =?utf-8?B?YjFHMFdyZXMxS2IrQnJmNFlWRm9MUWRZQ2JSdXNJR2hDQzlhd3o3Y09VeDl6?=
 =?utf-8?B?NGxuNitXT2l2M1RvWkFBSVQwMXZibDVZRHkxZXF5d1hkSHBXMWxhbFQzcXBT?=
 =?utf-8?B?d0RHUGc5TmZ3ZkJMcXhHaXJuUkl3dkNTcHdXMGRjU3VaR05SWVl6TEFtM1Jv?=
 =?utf-8?B?R0w0endGTUNxNG83NzdKM1RUdzVrWStGS2RnSzNqVVdOd2s2Q2xIRFNRWFpu?=
 =?utf-8?B?djZSRXpqMGNpUEd5WnpnYTVXRC9hcURjOFB0cytGaWdITmphenh0b0NYa01t?=
 =?utf-8?B?NlY2VStvbzF5a2pQQ3R4UU5HSFpiQWxwSFFuK1h4QXU0RytOOVRiZTdTaGhW?=
 =?utf-8?B?TkFKc00wUktoYmFwOWtSSnhqdTlMRXlYa01PT21BaW8vWC9JWUNueXNuZmZY?=
 =?utf-8?B?TmZlYlF6YVVSWGZxRjJWQmlPTUR5eGNzbWdyNm0vRERHbjVWMURsQ1JFcldp?=
 =?utf-8?B?QkVQbHlYTFV6Y3Y3R094UVFGVTBvSloycFlEUElSbHZhZFlZb2szU2d2VW5m?=
 =?utf-8?B?amxIOWFmRitpSUpHcXhPdVM1VjBKbGRCb2RtUGVxcHcweDVoUUJlOTYrc3p1?=
 =?utf-8?B?dnRVZHFHNXRRRHJHZzViQzNjVUNoUTE2NnNCQjYyQnI0YW00V05kekJzYjlv?=
 =?utf-8?B?NWJwOUlmNWg5MlAzckhxVkNTWTFXck9HVU90YmxDb2k4QTA3VlRjOUJJVnZv?=
 =?utf-8?B?dUQ2YnQxbkRTZjFQQUVJdFVvTFlDbWhnK012bmc2QVIvTFluNUFUR1ZPM3Jy?=
 =?utf-8?B?UXQzZ2h2WXVURzlwTU5DOXo3aUs3QW4zdHlLT0ZYUXJDVXFJWnB6SW5tcFdr?=
 =?utf-8?B?WG9ucGE4T0J4cTIweGNLVzJ2NHZMQ1JYSGlUSzdIWTVXVnBzTWlEK2dZektP?=
 =?utf-8?B?ckYySytiOC93Y0QvZzc3MU1GYU84S1hoRmlRM3BWYjl3WjVtZ0dUWEdxMS9P?=
 =?utf-8?B?YU9ZUDcyMlVlZHRWRXpxNHhMdGpqTHFGWktDWmJxM1QrYlpGeE1ra2xtQ29r?=
 =?utf-8?B?SzJSU3oxUG1IMEpBTjdoSlVQcTJyZDI3VGExVm5ma0x6Y0YydUVJYmRaLzkr?=
 =?utf-8?B?TVI4UnpuZEJtd2lnTEI0Uk9yN3o4K01Kd1NnbVBHR1VpQjYxcXBjSDdBWTAr?=
 =?utf-8?B?cFhibnVvc3VJNkFCaHN5RU8wUVAxdTJBZWNuVnozbkN3WkMwVU9Wazltdk1o?=
 =?utf-8?B?d3ZkYVJOMzhFMUJBNEZGcXg0RnRzV2NXVjJOblV3R2FrZUVqNncrb0w2Q2xD?=
 =?utf-8?B?UHVFVzB6cW9LcHVjb3BFOThRdDZZdlRpNmFHVEczNmZVdFhabDNEakZlYzdv?=
 =?utf-8?B?bys5M2oyUk5Uc3VzVlJ6NEZQU1dwTG5FeEV2Nks1VEY3Q2NCbTgxZ0JhL2Mx?=
 =?utf-8?B?cVJid3UrNnhuQnVsQ2FMZUFqT0ZiY2crWU5rdGVOQmQ5cUtoNi96Yi9OWkdv?=
 =?utf-8?B?S1JjM3BjaUd5eU80cldjNEg1cTdGTTEyUnl5NEVwbUlRK1lOOXdNcDNjcEsw?=
 =?utf-8?B?WUJLSDRhaVN4N1BMWEdzQlhVdXg1Z0lLSmpPTjhKR0ZrWUZaZU9MeFQzZGRR?=
 =?utf-8?B?MEpRWTA1UzB1NWtVak14MnlwSmlqNDhBOElkWG04TUtia0tnTHZJUTdrNzlD?=
 =?utf-8?B?elpPbHczVEhlZzA2V095Qk5JWVVEYUZaSXN0Njk3Mi9YQS83bWRUVnEzaHBu?=
 =?utf-8?Q?lbwObmWRAuLHfig6NTR1jrM=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	7Hjfp1V1WzY3DKxDAF4gyj2bcuI3p6RwwErLWDtmrMgOD1jksbDKLyKnouwY2ZKFMPXnuubn1kWyEMi0kmHyX5XP/W6HeDTS/6/QBlsIfVORrk75dD3ozG7qViZ6hma9LGzZxtha3hDgG74Rc2PzHW1ELa8EO1pKGRiyMjIMUVfcAtwXtfEyZ4lb4TZ7BYmtQ5azCwML1gp6Dfn0v3a5xIRK/NwkKCAF2TmMYxvgv+vkVjNkfd20MA4oXwFjGllh7A0tk5mBkAtb0+cL9ozZrLJY6/WtomlajzfKbnWa/QGJSSuyYRKjOAHEiLvXCIsfVIchkyLmIdgvU4Gj4cBkMJyQOjTs/I3jvjYcPRr7D+D2PszlGLVtnjzUwSaAE7Q7hTL6kLLFpZzlyJ+a1Iy/L1jwXu7K5p6bJBGHK2woaEVCgmJ1Oz7WLkRL9qO6dbrM1sjFkqqoMYPbF5jt8du4KPFBkn5gQ5BtuJjt0o7aK+c/KVu3dw9OCVHBLxUT8XcbnInozeLA0TyFNxdjVt2zuBelCEALZPojn6VeK5N4b8HNQpRiwK8ZY4TCx2zUmUZ4/sggd7FN4xlYHI25MtBQy7sExYCKNw+nr+ZIwFt6h0I=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ab2b4dd9-efd2-454c-c495-08dc8a3cbe7c
X-MS-Exchange-CrossTenant-AuthSource: BLAPR10MB5267.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2024 17:34:27.9520
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8cLGbxxSn9/kmC5gNGZ1sSDmbcgeOlkWBEKJxeZfLamJ7hCjG7rMRmhFt42QCQwHbH4VZQ2O1AZTjB9klMjWyw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR10MB4450
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-11_09,2024-06-11_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 adultscore=0
 phishscore=0 suspectscore=0 malwarescore=0 mlxscore=0 spamscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2405010000 definitions=main-2406110121
X-Proofpoint-GUID: QX8sYAnIfNu9heCbSq-YQ7is96XmkNGL
X-Proofpoint-ORIG-GUID: QX8sYAnIfNu9heCbSq-YQ7is96XmkNGL

On 26/04/2024 14:33, Alan Maguire wrote:
> when generating code for print() action we need to identify source
> of CTF; is it shared CTF, cdefs or ddefs or another module?
> Introduce a module id scheme where the module id can be stored
> at cg time for later retrieval at print time; this allows us
> to later look up the module and its associated CTF without relying
> on possibly freed pointers.
> 
> Under the hood, the id scheme uses a monotonic counter coupled
> with the hash of the modules name; the latter allows us to quickly
> look up the right bucket via dt_htab_find_hval().
> 
> This fixes an issue encountered when using a shared kernel type
> with alloca()ed memory; DTrace assumed the type was in ddefs
> and it wasn't so it wasn't displayed.  This change fixes that and
> all tests continue to pass.  Also tested that it works with
> kernel module-defined types now:
> 
> dtrace: description 'fbt::ieee80211_rx_napi:entry ' matched 1 probe
> CPU     ID                    FUNCTION:NAME
>   7 123161          ieee80211_rx_napi:entry 0xffff9f8980fa08e0 = *
>                                             (struct ieee80211_hw) {
>                                              .conf = (struct ieee80211_conf) {
>                                               .listen_interval = (u16)10,
>                                               .long_frame_max_tx_count = (u8)4,
>                                               .short_frame_max_tx_count = (u8)7,
>                                              },
> 
> Signed-off-by: Alan Maguire <alan.maguire@oracle.com>

ping on this one; I know things are busy with USDT right now but would
be good to land a fix for this issue if someone has the cycles to take a
look. If the BTF identification scheme doesn't work we can try something
else of course but above id scheme seems to be a reasonable compromise
between robustness+speed. Thanks!

Alan

> ---
>  libdtrace/dt_cg.c      |  7 ++++++-
>  libdtrace/dt_consume.c |  7 +++++--
>  libdtrace/dt_htab.c    | 17 +++++++++++++++++
>  libdtrace/dt_htab.h    |  2 ++
>  libdtrace/dt_impl.h    |  1 +
>  libdtrace/dt_module.c  | 30 ++++++++++++++++++++++++++++++
>  libdtrace/dt_module.h  |  1 +
>  libdtrace/dt_printf.c  | 12 +++++++++---
>  libdtrace/dt_printf.h  |  2 +-
>  9 files changed, 72 insertions(+), 7 deletions(-)
> 
> diff --git a/libdtrace/dt_cg.c b/libdtrace/dt_cg.c
> index 27246a40..30cccdaf 100644
> --- a/libdtrace/dt_cg.c
> +++ b/libdtrace/dt_cg.c
> @@ -20,6 +20,7 @@
>  #include <dt_dctx.h>
>  #include <dt_cg.h>
>  #include <dt_grammar.h>
> +#include <dt_module.h>
>  #include <dt_parser.h>
>  #include <dt_printf.h>
>  #include <dt_provider.h>
> @@ -2832,7 +2833,9 @@ dt_cg_act_print(dt_pcb_t *pcb, dt_node_t *dnp, dtrace_actkind_t kind)
>  	ctf_id_t	type = addr->dn_type;
>  	char		n[DT_TYPE_NAMELEN];
>  	size_t		size;
> +	dt_module_t	*dmp;
>  
> +	dmp = dt_module_lookup_by_ctf(dtp, fp);
>  	type = ctf_type_reference(fp, type);
>  	if (type == CTF_ERR)
>  		longjmp(yypcb->pcb_jmpbuf, EDT_CTF);
> @@ -2842,9 +2845,11 @@ dt_cg_act_print(dt_pcb_t *pcb, dt_node_t *dnp, dtrace_actkind_t kind)
>  			"print( ) argument #1 reference has type '%s' with size 0; cannot print( ) it.\n",
>  			ctf_type_name(fp, type, n, sizeof(n)));
>  
> -	/* reserve space for addr/type, data/size */
> +	/* reserve space for addr/type, module identification, data/size */
>  	addr_off = dt_rec_add(dtp, dt_cg_fill_gap, DTRACEACT_PRINT,
>  			      sizeof(uint64_t), 8, NULL, type);
> +	dt_rec_add(dtp, dt_cg_fill_gap, DTRACEACT_PRINT,
> +		   sizeof(uint64_t), 8, NULL, (uint64_t)dmp->dm_id);
>  	data_off = dt_rec_add(dtp, dt_cg_fill_gap, DTRACEACT_PRINT,
>  			      size, 8, NULL, size);
>  
> diff --git a/libdtrace/dt_consume.c b/libdtrace/dt_consume.c
> index dec2314b..432b4e12 100644
> --- a/libdtrace/dt_consume.c
> +++ b/libdtrace/dt_consume.c
> @@ -1987,9 +1987,11 @@ static int
>  dt_print_print(dtrace_hdl_t *dtp, FILE *fp, dtrace_recdesc_t *rec,
>  	       const caddr_t buf)
>  {
> -	dtrace_recdesc_t *data_rec = rec + 1;
> +	dtrace_recdesc_t *ctf_rec = rec + 1;
> +	dtrace_recdesc_t *data_rec = rec + 2;
>  	size_t max_size = dtp->dt_options[DTRACEOPT_PRINTSIZE];
>  	size_t size = (size_t)data_rec->dtrd_arg;
> +	unsigned long dm_id = (unsigned long)ctf_rec->dtrd_arg;
>  	uint64_t printaddr;
>  
>  	if (size > max_size)
> @@ -1998,7 +2000,8 @@ dt_print_print(dtrace_hdl_t *dtp, FILE *fp, dtrace_recdesc_t *rec,
>  	if (dt_read_scalar(buf, rec, &printaddr) < 0)
>  		return dt_set_errno(dtp, EDT_PRINT);
>  
> -	return dt_print_type(dtp, fp, printaddr, (ctf_id_t)rec->dtrd_arg,
> +	return dt_print_type(dtp, fp, printaddr, dm_id,
> +			     (ctf_id_t)rec->dtrd_arg,
>  			     (caddr_t)buf + data_rec->dtrd_offset, size);
>  }
>  
> diff --git a/libdtrace/dt_htab.c b/libdtrace/dt_htab.c
> index 478c728a..3c167cb5 100644
> --- a/libdtrace/dt_htab.c
> +++ b/libdtrace/dt_htab.c
> @@ -229,6 +229,23 @@ void *dt_htab_find(const dt_htab_t *htab, const void *entry,
>  	return ent;
>  }
>  
> +/* Find an entry in the hashtable, using the provided callback function as a
> + * secondary comparison function to differentiate between entries in a bucket.
> + * A pre-computed hash value is passed in.
> + */
> +void *dt_htab_find_hval(const dt_htab_t *htab, uint32_t hval,
> +			dt_htab_ecmp_fn *cmpf, void *arg)
> +{
> +	int		idx = hval & htab->mask;
> +	dt_hbucket_t	*bucket;
> +
> +	for (bucket = htab->tab[idx]; bucket; bucket = bucket->next) {
> +		if (cmpf(bucket->head, arg))
> +			return bucket->head;
> +	}
> +	return NULL;
> +}
> +
>  /*
>   * Remove an entry from the hashtable.  If we are deleting the last entry in a
>   * bucket, get rid of the bucket.
> diff --git a/libdtrace/dt_htab.h b/libdtrace/dt_htab.h
> index d39ae65e..1ce5a80d 100644
> --- a/libdtrace/dt_htab.h
> +++ b/libdtrace/dt_htab.h
> @@ -100,6 +100,8 @@ extern void *dt_htab_lookup(const dt_htab_t *htab, const void *entry);
>  typedef int dt_htab_ecmp_fn(const void *entry, void *arg);
>  extern void *dt_htab_find(const dt_htab_t *htab, const void *entry,
>  			  dt_htab_ecmp_fn *cmpf, void *arg);
> +extern void *dt_htab_find_hval(const dt_htab_t *htab, uint32_t hval,
> +			       dt_htab_ecmp_fn *cmpf, void *arg);
>  extern size_t dt_htab_entries(const dt_htab_t *htab);
>  extern int dt_htab_delete(dt_htab_t *htab, void *entry);
>  extern void *dt_htab_next(const dt_htab_t *htab, dt_htab_next_t **it);
> diff --git a/libdtrace/dt_impl.h b/libdtrace/dt_impl.h
> index 2dfb64d6..2bd1dafe 100644
> --- a/libdtrace/dt_impl.h
> +++ b/libdtrace/dt_impl.h
> @@ -136,6 +136,7 @@ typedef struct dt_module {
>  	dt_list_t dm_list;	/* list forward/back pointers */
>  	char dm_name[DTRACE_MODNAMELEN]; /* string name of module */
>  	char dm_file[PATH_MAX]; /* file path of module */
> +	unsigned long dm_id;	/* id of module */
>  	uint_t dm_flags;	/* module flags (see below) */
>  	struct dt_hentry dm_he;	/* htab links */
>  	dtrace_hdl_t *dm_dtp;	/* backpointer to the dtrace instance */
> diff --git a/libdtrace/dt_module.c b/libdtrace/dt_module.c
> index 1e730426..7697f73b 100644
> --- a/libdtrace/dt_module.c
> +++ b/libdtrace/dt_module.c
> @@ -35,6 +35,8 @@
>  #define KSYM_NAME_MAX 128		    /* from kernel/scripts/kallsyms.c */
>  #define GZCHUNKSIZE (1024*512)		    /* gzip uncompression chunk size */
>  
> +unsigned int module_idx = 0;
> +
>  static void
>  dt_module_unload(dtrace_hdl_t *dtp, dt_module_t *dmp);
>  
> @@ -50,6 +52,12 @@ dt_module_hval(const dt_module_t *mod)
>  	return str2hval(mod->dm_name, 0);
>  }
>  
> +/* id is combination of hash and index */
> +static void dt_module_init_id(dt_module_t *dmp)
> +{
> +	dmp->dm_id = ((unsigned long)dt_module_hval(dmp)) << 32 | module_idx++;
> +}
> +
>  static int
>  dt_module_cmp(const dt_module_t *p, const dt_module_t *q)
>  {
> @@ -150,6 +158,7 @@ dt_module_create(dtrace_hdl_t *dtp, const char *name)
>  
>  	memset(dmp, 0, sizeof(dt_module_t));
>  	strlcpy(dmp->dm_name, name, sizeof(dmp->dm_name));
> +	dt_module_init_id(dmp);
>  	if (dt_htab_insert(dtp->dt_mods, dmp) < 0) {
>  		free(dmp);
>  		return NULL;
> @@ -193,6 +202,27 @@ dt_module_lookup_by_ctf(dtrace_hdl_t *dtp, ctf_file_t *ctfp)
>  	return ctfp ? ctf_getspecific(ctfp) : NULL;
>  }
>  
> +static int
> +dt_module_idmatch(const dt_module_t *m1, dt_module_t *m2)
> +{
> +	return m1->dm_id == m2->dm_id;
> +}
> +
> +/* High-order 32 bits of id are hash value, low order the module index.
> + * This allows us to limit cost of search based on bucket size.
> + */
> +dt_module_t *
> +dt_module_lookup_by_id(dtrace_hdl_t *dtp, unsigned long id)
> +{
> +	uint32_t hval = id >> 32;
> +	dt_module_t tmpl;
> +
> +	tmpl.dm_id = id;
> +
> +	return dt_htab_find_hval(dtp->dt_mods, hval, (dt_htab_ecmp_fn *)dt_module_idmatch,
> +				 &tmpl);
> +}
> +
>  static int
>  dt_module_init_elf(dtrace_hdl_t *dtp, dt_module_t *dmp)
>  {
> diff --git a/libdtrace/dt_module.h b/libdtrace/dt_module.h
> index 56df17a6..68dadfc6 100644
> --- a/libdtrace/dt_module.h
> +++ b/libdtrace/dt_module.h
> @@ -18,6 +18,7 @@ extern dt_module_t *dt_module_create(dtrace_hdl_t *, const char *);
>  
>  extern dt_module_t *dt_module_lookup_by_name(dtrace_hdl_t *, const char *);
>  extern dt_module_t *dt_module_lookup_by_ctf(dtrace_hdl_t *, ctf_file_t *);
> +extern dt_module_t *dt_module_lookup_by_id(dtrace_hdl_t *, unsigned long);
>  
>  extern ctf_file_t *dt_module_getctf(dtrace_hdl_t *, dt_module_t *);
>  extern dt_ident_t *dt_module_extern(dtrace_hdl_t *, dt_module_t *,
> diff --git a/libdtrace/dt_printf.c b/libdtrace/dt_printf.c
> index 50842216..108adc23 100644
> --- a/libdtrace/dt_printf.c
> +++ b/libdtrace/dt_printf.c
> @@ -14,6 +14,7 @@
>  #include <limits.h>
>  #include <port.h>
>  
> +#include <dt_module.h>
>  #include <dt_printf.h>
>  #include <dt_string.h>
>  #include <dt_impl.h>
> @@ -2236,13 +2237,18 @@ err:
>  
>  int
>  dt_print_type(dtrace_hdl_t *dtp, FILE *fp, uint64_t printaddr,
> -	      ctf_id_t type, caddr_t data, size_t size)
> +	      unsigned long dm_id, ctf_id_t type, caddr_t data, size_t size)
>  {
>  	struct dt_visit_arg dva;
> +	dt_module_t *dmp = dt_module_lookup_by_id(dtp, dm_id);
>  
> +	if (!dmp) {
> +		dt_dprintf("error retrieving CTF for print() action\n");
> +		return dt_set_errno(dtp, EDT_CTF);
> +	}
> +	dva.dv_ctfp = dt_module_getctf(dtp, dmp);
>  	dva.dv_dtp = dtp;
>  	dva.dv_fp = fp;
> -	dva.dv_ctfp = dtp->dt_ddefs->dm_ctfp;
>  	dva.dv_data = data;
>  	dva.dv_size = size;
>  	dva.dv_last_depth = 0;
> @@ -2260,5 +2266,5 @@ dt_print_type(dtrace_hdl_t *dtp, FILE *fp, uint64_t printaddr,
>  	if (dt_print_close_parens(&dva, 0) < 0)
>  		return -1;
>  
> -	return 2;
> +	return 3;
>  }
> diff --git a/libdtrace/dt_printf.h b/libdtrace/dt_printf.h
> index 9771c4a8..8d55d82b 100644
> --- a/libdtrace/dt_printf.h
> +++ b/libdtrace/dt_printf.h
> @@ -108,7 +108,7 @@ extern int dt_print_ustack(dtrace_hdl_t *, FILE *,
>      const char *, caddr_t, uint64_t);
>  extern int dt_print_mod(dtrace_hdl_t *, FILE *, const char *, caddr_t);
>  extern int dt_print_umod(dtrace_hdl_t *, FILE *, const char *, caddr_t);
> -extern int dt_print_type(dtrace_hdl_t *, FILE *, uint64_t, ctf_id_t,
> +extern int dt_print_type(dtrace_hdl_t *, FILE *, uint64_t, unsigned long, ctf_id_t,
>  			 caddr_t, size_t);
>  
>  #ifdef	__cplusplus
