Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99705145B18
	for <dtrace@lists.linux.dev>; Wed, 20 Nov 2024 20:28:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732134529; cv=fail; b=WmzSktnTaTzFUboFFDKMjKqHzI3dmfbIvQwMRMgmDQ4gk9WZOZnruf34IpdvtWYVj3Pd2H+MtQWRsWtLYUASX9h5aGdZhTIZDbONeb3CkveFKG3BmNkI5V05TXoLI+iQXdlfmKm528y7QjurBb/5gg/BB1zdqtcXucdH+S4r8t0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732134529; c=relaxed/simple;
	bh=N4/PnZFBNVJXrxNZGYIdgws7uPM81dZH+PdO+CNl85k=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=SscDK3qfpjNylndHSYpMvJ4n4IkGRY5DHNO48iiViNz0v2YsR/aYiUVLruMm1NHaZ4XE+DQZLgK386aNB00YASmNJMSXRhQAGDBQVFRFSbKTiTO1flDV2fG0gDpIe3KQYI+RIm7n1KJezxkQAn2KQDbp04r/83nS8GPZqqY6A1k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=gTxSGE/5; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=gXfpaYUb; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="gTxSGE/5";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="gXfpaYUb"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AKKMaIN006330
	for <dtrace@lists.linux.dev>; Wed, 20 Nov 2024 20:28:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=vISsy8OQMTmEq0f7JcsW5TAiP4s6cEXb5Au+q/HHjPk=; b=
	gTxSGE/5vN/LVayV46LPHvCBjBca3EkXFeU5TEkFqs/IlRIQik116LZs9RcfiRrV
	UgpEP++GBfOBhdtmmuklD9j+qd1xFDx0ArZ0Dnq90sJ6V+Hm4dpHOsEx5OkVyjOI
	WEuHBFw+uhKI9360WbnwtWJbYvm+3Y9Yp1kF93T4UZIyQ2vy8Uj5GTASOZtx2ASd
	HiO6DvnRGXdf9MlRhjSNv472qic7Sbz789eKPE0mIDTacFJZ9Z8nf6sYEeoSdfGt
	YwGKW09KwWrWNJWY/cm2vL3yWfkvpuX4G6z9dCMGScx4NOOsqjVqx/uLuaDYzSx/
	ZKNjWtY7wLm/cXagsIP9MQ==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 42xhtc8aqy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 20 Nov 2024 20:28:46 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 4AKJPVSM037310
	for <dtrace@lists.linux.dev>; Wed, 20 Nov 2024 20:28:45 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2042.outbound.protection.outlook.com [104.47.55.42])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 42xhuatwp1-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 20 Nov 2024 20:28:45 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=M+mGKtklqNN4UQuZ95YnX6B8ChoLYBWUd/fCXS1n8oxR/7eULqHr1ZCFhbnodz1nTFtkApzTWi1kN9Uw+Vf4dBqFGGqdX1CNS4uu/MAksaeUyPVuTnVFm1l1La+vPaLaVaCFAuIFLdPOXgYssIJGIAw9Lco/9iFRzpFHGkMCixMh8Y8jp6dW0qo8le0+RxXRAKC6X8lJv9Py11va4DSRQ5GmD9UJ2O9rq4ThvicstTww8j3RBTviOLKeRisYBQ+fMHeeVSXrOoHT4VieumqtSaByDpBajUGnnX5qdzSO9ZEmZOQY5ow/qd56n+kqfmAh52o23qacHIOMNAV0VuCuXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vISsy8OQMTmEq0f7JcsW5TAiP4s6cEXb5Au+q/HHjPk=;
 b=Qx6EyWNAeAYV36GIZ7qGCIhBPbEV8Ob6CtDJthIIwNo886N4/m5DC1Fm0iH83jkJd7G5OB+/htiJyLe5xlCmK9L3KCTnWgCO5xGrY8KdzaaVWbCi8kU2YDICaSXZ/UEeVWc4V3pT3D6+KEtTpNYQjXW/xS4PGBpndMqikvVdBAqsMIKeI8PX4PPV2bH4NkkhTRQ2Onn+VNVqsCLyCOm54GUs3S3DSZ6RePlixnnxLjiXwE/Ec95FlUewFUOX/jirifXc0f3/wc4DM6F1BVmPXH5/NFU8HGaQxklpng5qdpcLgv0pJNTFq2mfsWzt+5l+lo7/s6TKuX8WSJf8F2BJIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vISsy8OQMTmEq0f7JcsW5TAiP4s6cEXb5Au+q/HHjPk=;
 b=gXfpaYUbujEdUonbuxKlTfpgcassHdOYd2dYTX6lDn8tNYET9IpihucsHWA4eJC2QHCUHs+Qk0b+cLk6UBGKhXuG5pc4+dxkO4+u8kJKSE+3Stp1/v59hHaVnFEyg3vjeC9v1YPELV9yzwcDBXSJek9a+S7vZ3hshpJLl6KiKZE=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by BY5PR10MB4148.namprd10.prod.outlook.com (2603:10b6:a03:211::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.24; Wed, 20 Nov
 2024 20:28:42 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%3]) with mapi id 15.20.8182.014; Wed, 20 Nov 2024
 20:28:42 +0000
Message-ID: <2aed49d4-d529-de2c-87ba-42873b3ecfda@oracle.com>
Date: Wed, 20 Nov 2024 15:28:40 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [DTrace-devel] [PATCH v2] test: stack_fbt
Content-Language: en-US
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
References: <20241107232841.28752-1-eugene.loh@oracle.com>
 <Zz43EAAB87FOttWG@oracle.com>
From: Eugene Loh <eugene.loh@oracle.com>
In-Reply-To: <Zz43EAAB87FOttWG@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR05CA0121.namprd05.prod.outlook.com
 (2603:10b6:a03:33d::6) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|BY5PR10MB4148:EE_
X-MS-Office365-Filtering-Correlation-Id: fc905ba2-6e07-4588-9c68-08dd09a1eca2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Uys2WTNHWnJhcHpmY3lUUG41V1dGMldjWGo4RGZWcXlTSSt3TEhVbEhCeDZI?=
 =?utf-8?B?dFdIMTJ4b3VpWGpjdTloUXhuVVU1cWo4ZjlNVnNSZkZaM3BYNUVJc0FUNGxK?=
 =?utf-8?B?VlpETGNnYnNiYTArenNuREExVzdhTllNZEVhRUdYZll0b2tvQUtNekJqU0Rq?=
 =?utf-8?B?UWFjN1VzVTRubkF1a2pRZzRBMi9jdTh4aDZCNEVzRmN4b1ZCRUR5YnVMeXpl?=
 =?utf-8?B?bG4zMmdRci82ZFJoQjFiM294Zm5nem9rc0Q4MUtPaFNMc1pQdTNkUmJYaXR0?=
 =?utf-8?B?KzArMkdnYU5zZHJIdERLQkJ6SjBmM3BzWkVSTU1DMDVMdTZvR0tzOG9sa0hB?=
 =?utf-8?B?N1B0M1BZcENPbktiTHo5SUdnOGVmcWxwTzlMSXhycWY3ckJaY05BbmpSSEpO?=
 =?utf-8?B?WjB3ZzZRZllvTml0QXhaZ2h5Y3NoN3dFb1graU1IM1hKY0hLeEdxSGdwQ2Y0?=
 =?utf-8?B?VkdJdTlway9YYXF0bm9GV0ZvVlpHa0xQQXExaTJGZzRZZkYzK09UWEJFd3hv?=
 =?utf-8?B?S1dSakhhdVo1UlJpS2ZiQ3o2bmxVK1lxb1ZBNjlSeUMvcEJSNUM0NDNMdFhQ?=
 =?utf-8?B?NnlVRzV1SnVEOFFNckJyV0VrdWozdUt6UjBrN2xJZXhrVFFtN01JeFVFUUFh?=
 =?utf-8?B?dGllcFVEaThxKzBjKzFQTUdIbFdUeXFLSTAyQTExRFZrRVBWYXFjUnI1VGMv?=
 =?utf-8?B?UXk2ek5qVGZFM3I0dSs0NkdwKzVraElGVERRcVVLMWJwM09HTXNwWDFORk1M?=
 =?utf-8?B?Sk9LaWRsTytwUW50cys0WmVTNHNsd3ZsZEMvNTNHNXF0b3A0cDhCQUgxSGxQ?=
 =?utf-8?B?Y1hJVGtoeVd1d0hsQlgyUHl2cnc0cDU1bnVrcUJtdWJVNS9pYXBWMTZhVzd6?=
 =?utf-8?B?dTlXT08yeG9uLzNhR25aNExOYlFFSjZrT1hDbjZQajRsaG1Td0t5SGR5b21s?=
 =?utf-8?B?bDBENzkxWHJrSDlSWVFkMUZ1VXdRL1JyMnUvMGpoVUJsSFhtNjNPTEJHbzFW?=
 =?utf-8?B?aW5RUGpta0ZIbGpDdGUvRzZ2aFNValRvbkppZERXS25Rd3BNQ3d3Y3p0SVQx?=
 =?utf-8?B?M285dFRDenhERElCWWtDQitSTm5oYkdKYnBqMXdFcW9uZ2ViS3FxNjJLd1py?=
 =?utf-8?B?KzhyU3djd0kzZnRzemNTdVRNOFBwMzIwTGdqQkliTWZWZkpYNEk3cnVMbWlY?=
 =?utf-8?B?L1I0SjJUdjlZTnRpSHROZjBhUS9EVnVTVkRoSG16MVp4SDdWVWhNMFdPc1ZI?=
 =?utf-8?B?cWxFRy90U0Vzb2N4bHdPellSTXNPamk1aHRKRi9MVVczbEsyeFl6K0l4Z2hu?=
 =?utf-8?B?Ym9sdExsTUpESGhRRlpDQVFyTnJOMU1pY2VvczZla08rSTdicHJMY0IrbGQy?=
 =?utf-8?B?RVhHYmFOeDZKanIrcnM0S1R4RVZLaTBScnlpWkVPeVZmTVIySXJ0TVlBSnpB?=
 =?utf-8?B?dEVKZkRMK0FwTWMvMG0vZTNrVmRUblBHUEJLQ3QzOHlCNlZYeW1ZOEU4b0Fp?=
 =?utf-8?B?WEsyYm5jZnRKVEdSR0poMUxITExTM2tLdmV6NmdSTnpaanBTeEdrQ0tHQkdD?=
 =?utf-8?B?MjFidUFHNkNEbjUrWWc3Wm9hMUVub2hLR1dleDIrOXBEVW1HajVkR0NTNFBL?=
 =?utf-8?B?b05TdUIwTHgraW5FZjlId1pLa21tamZYYlB0d1JKdEpNcmQ2V0daZnM1TTJM?=
 =?utf-8?B?OVkydkZ1R2k5bEorVkk0SFZvL2NrT0t6TWlEdEdQUTdxcXJGTzB6MWVBa3dO?=
 =?utf-8?Q?GXu9VZy9oIwkuAPvZ3k5kdrlJr9If/ER/cymmm7?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Q2pjcGRmTmMyUmRYOEpZclJlaW1CMkFISlpQTHRkbGV1OU9Ic2Zjcit2Njc4?=
 =?utf-8?B?RlFsWEkvQzJxUkRNaUpvYUFvM3Q1cmRONFJSTW1USGExUW8rTyswSmFDYXk4?=
 =?utf-8?B?TXZpVDJHYzNubFhzaGZnVXZ1Y3VLWERrVm9nWTBWZTJCQkR1R0xsenlWUFhM?=
 =?utf-8?B?NWN4UWpOV1JkOVpwcnFNc05PNWtSQTdOcXZObkN0Mjl6aktWdm1DQUtPR2dG?=
 =?utf-8?B?M1VhL3FjSVR4WGIzSkcrZnFMZ0FSWXUwV2RuNVV4bnZJc0drdGp2MDlkdUh6?=
 =?utf-8?B?UkgxLzY0R1F5NWtqNjNmbWJ5MkFkVWo1cTIwSmVFVVQxV2pxQUNIWmZPbEpV?=
 =?utf-8?B?RTRPMzN2TmM5QWwxVXZ2Tk5BeGIvaFYrTVlGejFQbTV0b2dFbTFFTFNyd0RD?=
 =?utf-8?B?SFQrVW1oSGdydUp5b0RNL1BudDNlaWhTVi9hY1JLN3FjNjUyVk5SUkdTeTFJ?=
 =?utf-8?B?Zm9CSUtYajlYVUpRYTdRQzJhMW1IVUc1Uk9iOUU2Y01heW5ZQzFoeE1xdUJw?=
 =?utf-8?B?eUI2UzFld3FOMjBUVFg0cFNnNzc3b2NEUkJQaC96VTZKMVFLZkRnM1FVeml1?=
 =?utf-8?B?ZEJOL042bGZRQ1ZVenhSeFh1RThEOHFkbmJMNTJXcFhBVHpyQkNUa0QvbXZS?=
 =?utf-8?B?MWlEcURtSElNRm9vU1pweEM0dzlZWm1VZGJpWEVRbkdUSXE5VGFRSFFFQTdJ?=
 =?utf-8?B?VVV3U2pBa1B6VHVVbHhtcTFnd0kvL2ZRYnA5czNxZnEwamNPVFpteWlNYjRw?=
 =?utf-8?B?MW0veSs4TFJoTHE2UGpkS0JCQlZWY1QrT0tiVE9nc3FoQzdlQU1OR2UwRkhQ?=
 =?utf-8?B?UVplcEFXZnA2VlJjRXN5NFVzcTRvOGp2eDVvNGY5Ty9YVEcwYjBLQ1duM0VM?=
 =?utf-8?B?Yk93SFlMSDAxTUZFZU9HRDVtQmpocW55MGFRWEZXVElKc0pNTHRuR2crWWVC?=
 =?utf-8?B?MlIyTXNQbVphQWowV3RjV1lncDdORFZyYjE2ZU5pMWZWd2tCLzl1Uy81cUp4?=
 =?utf-8?B?S2tFQ2FqdjQ1MHYvOW5MZFE4RFVpblROcmVzY3h4MGdPOU5DTkxTSkRMczMr?=
 =?utf-8?B?U2Y2eGZlSE1iM2pNNSthek8yMzZJWDJMVW1Hb1RGMU5DKzB3U0lCZmxkWUNH?=
 =?utf-8?B?ZWlUeGJDcUY1dzFxM0NpeVBNUXpjYkcrZXRxSEcxL1RneFZSNFk0VUVQQ0dp?=
 =?utf-8?B?ZDZtQ25lQk9STzAzK3A3MDZjK0YxVmJmQnBheTZvb3lHRUhXK0FhUkQ0eHBx?=
 =?utf-8?B?emM1WnNCNWQxYktXZWRqa2E0ZlQrRUlMTjhxTC9wV3NnUExhdjJlL0FVWUls?=
 =?utf-8?B?SnEvMno2eVZJdXd1R0xyOW9jTENyby9ta0l1SHpzS240RHdyR1BEbHFHMFJr?=
 =?utf-8?B?S3Y1TmIyNnQ3cHJmMkJUVlBQeXAvRE5YbTN0Z3dLRzlBdGRCMUE4bnJZekQ0?=
 =?utf-8?B?NDUxR0FvQ0E0REJZMmxHbi9YTEoySm5laThuWXVtZ3M2V1JMUkZSZGtOZmVh?=
 =?utf-8?B?K3krRld5YmhvbVlxRXVGZHlpdUNCTDJxSG03eUxaQ2RoMWhoSnNaam5Na0lq?=
 =?utf-8?B?b0gwS2pBV1Nobk1mS2JxeVFkc1hLVGNyQ0kvQVFmYXM2VkNsSGEzTy9wZlo0?=
 =?utf-8?B?azd0TEI5cWppNE5uUnNrQWMrbEQrbTFoS1RiYmxQbmU4YnZwT3NkdDdCWHl1?=
 =?utf-8?B?cDNNY3A3dVI5NitHbHdMa1Fla3FheVhtcTB1dmhYa2djcmd3cDIybFcwNXVn?=
 =?utf-8?B?L0dValIyakR1bElRODdZNTY4cVczbTlTSUdVZlNrNXk2d2FNZmRBSE1KejRr?=
 =?utf-8?B?amdkTCtrdG1DRFJlZDRZU1dFbjI1dW9DVndXNGRyZVNZUk1pcFBBVlhGVjVU?=
 =?utf-8?B?by9FS2lDSXVJWjZvSG01RTV2QSthaW5TbTc0UEhvT0FhRjlabHZKckdmbmNk?=
 =?utf-8?B?QzR5UVMrS1h0SjZRRGtNQzcwQk5CQklzanNrekxWdllLRmpia1EyS3laRDBp?=
 =?utf-8?B?QWkzZDFlS0xpT3o0RlhhVFlZd3hCME9taDg3eVB0dDJMT0xhZ3FqT1NuVSsv?=
 =?utf-8?B?U3lyaEJXZVBGSGJkN1RjeXNJTnd3VDR3NCthSTVGRVlNdmFqc0pFNFF2OFVJ?=
 =?utf-8?Q?RgkkKPUr7moja2KAnUfoxbWy3?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	I45fAi7fj8/DICKHuQr6ce7hhkN7CTvJN8oeno0pYm2D+XDOz1yjzpp5Zny1dzSiXRKlfrTTItytNpd0DSBPNg4f5mXyhisuuyQPozMA5KFE7uI9YENKk3ZYf6J5Juh5wuvBdi5U6Vzq4PEKtNskzXi/hlnIepoNgBy73QrSe1ell4LvEPzbI7siA1KxzrvvSa4Si7zTg3EasCAXXaB33iykF3etlXwJSdBoaKD/iPTNh8ynux1THnn8UnJJPleL1kuacboiWo2GUMFhofftGID8iifILpllOuR6jZSBOvUIasLK3pDQ+70XgnGBN+gh/uiFYdk+noLPfv2yzSLJurQxdDp63mKDUqLlZDLc8f9nGdI/G0rwJ/o1dceuSaLo+JqmFE16TcxTz6LOzxOkfYv2QvxnfbQUlxvLBI/lKo6FBE90UEqo0yKjWpkCEsHSSDOsp1Y6SHoDUtA6RYj8IDRr7rdrGbCIQagTul21GHy/GjvlfeOsO7c52eIfsMz76iUaQ3Wl9K7zYjXkFD7CNxVHwo2YAS0kWG/8zfz6rMQKqhq/U5Z5CDnlcJm7F30HwGrP7LwYxBnW5IMebblZin255PuSQVXlCKbtZVnpqVc=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fc905ba2-6e07-4588-9c68-08dd09a1eca2
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2024 20:28:42.2359
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: b0cxaAwHHMDGhV2/p127ondgP0KPPvLiS1Psjpi2YTrZI4rEpggddQt569ESUqlbj+wa8P9DKlf4mibT4Wtyuw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR10MB4148
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-11-20_17,2024-11-20_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 spamscore=0 adultscore=0
 suspectscore=0 mlxlogscore=999 phishscore=0 malwarescore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2409260000
 definitions=main-2411200143
X-Proofpoint-GUID: ZnvALsZtdWMmbwPPwdvoHrdy8bO8tPK1
X-Proofpoint-ORIG-GUID: ZnvALsZtdWMmbwPPwdvoHrdy8bO8tPK1

On 11/20/24 14:22, Kris Van Hees wrote:

> On Thu, Nov 07, 2024 at 06:28:41PM -0500, eugene.loh--- via DTrace-devel wrote:
>> From: Eugene Loh <eugene.loh@oracle.com>
>>
>> Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
> Reviewed-by: Kris Van Hees <kris.van.hees@oracle.com>
>
> ... with small changes as shown below.
>
>> diff --git a/test/unittest/stack/tst.stack_fbt.sh b/test/unittest/stack/tst.stack_fbt.sh
>> new file mode 100755
>> @@ -0,0 +1,122 @@
>> +#!/bin/bash
>> +#
>> +# This test verifies the nusdtprobes option.
> Surely this is a copy'n'paste error and should be removed?

Goodness.  Yes.  Good thing that at least one of us is reading this 
stuff!  Oops.

> Or rather, it
> should be replaced with a message that actually states what this test
> exercises/verifies?
>
> Shall I make it:
>
> 	Test the stack action with default stack depth and depth 3.


Thanks.  Well put.

>> +
>> +dtrace=$1
>> +
>> +# Set up test directory.
>> +
>> +DIRNAME=$tmpdir/stack_fbt.$$.$RANDOM
>> +mkdir -p $DIRNAME
>> +cd $DIRNAME
>> +
>> +# Use DTrace to capture stack() at vfs_write:entry.
>> +
>> +$dtrace $dt_flags $nusdt -wqn '
> I assume $nusdt should not be used here.

Sigh.  Right.
