Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4F4924A06A
	for <dtrace@lists.linux.dev>; Tue, 15 Jul 2025 23:34:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752622456; cv=fail; b=MxXr9uXAIVpU096hn5jNFNN+BvltHWH1SuO4aZL0LNPM9Duku1eIzvX/hUAM4Z+nIr+3ZCOUEguclyYKHL/VtJXfl/dHYl6lkUmH32V6r607xha1tuFf2pkaj/2QMjnlKg0nRzphnof21HlGWI/j/Lr1Mw28j2kUaODTsQK6tXk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752622456; c=relaxed/simple;
	bh=gBUSimVEmIitx9Hwi2OGplFCV12uKtmjQh8Fv7IMwqs=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=N6yXzoP4VPQeckttCAN3pnrRz13hCNKpQxyPNicamf4bm12B2vUSHMWKw154vD1Uq8HxM9XhRxk9IuqOGdH5PoVrAX+g5a2uZXKq+iXqlTjzPXyHnY82qNZuuVCuqTKfc6xHV4Ro0wheMSQTNJWywAqmTqP15qB8lUpTuXQfxP4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=gWwdnIUG; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=ZeZseEfz; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="gWwdnIUG";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="ZeZseEfz"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56FKXjl1012357
	for <dtrace@lists.linux.dev>; Tue, 15 Jul 2025 23:34:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=3irWyFJNBbDbE94Vzteh3OWLg2s9xOFUYh1wBuU30LM=; b=
	gWwdnIUGJJWaInzS3Trtwxcg3lpaYToy1sABgpop6nUbf6djSeKjsRzrl6tLIz71
	c4RVpEXgXNOodAAKtx6CgFYFLCWKsWb+p496HI+2qxQLz+rGjgPhE2+PeqYCCk2U
	LeDNYrKGj1CakLcXOMP6gM526rsvKJUKKOTHoGRSaiCUMH4Oxtc3zkDOUpHLkzFX
	1OXnqzRnRrvDKoK5IJIvmLY4Lk0gqWk3HF8/6wVYnjwJXKjMeGxZD1/zj2ukWvwj
	RvL77Sp1VxmaX/QuKtpRg4Fn1pLZEKgMsQ/wV0pvK5jzwiKN4Vd4BxY+Cm1bahBi
	gkn6ud8t4TMcwlaGXiUqjg==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 47uk1ayucp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 15 Jul 2025 23:34:13 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 56FLB1R0013753
	for <dtrace@lists.linux.dev>; Tue, 15 Jul 2025 23:34:12 GMT
Received: from nam02-dm3-obe.outbound.protection.outlook.com (mail-dm3nam02on2072.outbound.protection.outlook.com [40.107.95.72])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 47ue5a5bcu-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 15 Jul 2025 23:34:12 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oAiYo4gOtmjiDPEsa3iudo1U+RjrRzMWkCLZVMoPm3glG4lvspIpAJ+wZvawcXZ0XSzsFW7o7fCaAk0DjBe/cG+rqTbgmdFBuB3fIOd4bDa23I8QlRgpqsLqfx+s18kUc1KEBt2xqdW6uFVbJ8VOz2PGZ2NBKAMkpA258b8/jrk5Wzi3XvrFIJLIl3J07rXpGeWo2aCASc+vqr5lXGAwyEfwhcwW8Ee2UWEpZ+WlpJ0N2Thk9zkCHTUldxMWWw9qETKuGVQJpNVVLoguZ6d2+BlIO7A2IBTs43FUj7NzQklscPFRvoWZ+LeRUYfXcg0xsN/FFU7DJyiaB8r04tqRkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3irWyFJNBbDbE94Vzteh3OWLg2s9xOFUYh1wBuU30LM=;
 b=xv+8jEYvqelX//ePfmVn46dTiGTY9fkenc963OWPYIW8CpBIBdEpZrUZavMA1ptJqOvF5NRa8b2yvm2Bv7d7IRLtilhKvWuUDmVFIWHQu+ofkj8fSKCfckyeow/yvlWaBe5lIlu16bERmAe3uN5XVAhWgsAZ4nULOHlXtGVYXwz1OoweoSjPMsm+JJgtTfSB/iqsbRUu/XXdhlIKRZbsmhSQ28zFfeflWwzMzc4F/XKxQPOVOrdiMJvn60KOslOr3SDpkI1cU7o8IrYCZo1yC2FRTPKfJ81OZqJvx6rTEU14yJjI79qYncs6X1ggFeV9J9zA5m7eqfcNWBcAw1KWdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3irWyFJNBbDbE94Vzteh3OWLg2s9xOFUYh1wBuU30LM=;
 b=ZeZseEfzwNmf8pucbGuLrXPLg+L6818HWuvdBw7mfnusCXPkSiWfwphfsobjBV69ViPE0qnjthTOPqu0qPckDvXiBdaD5Nr0xbrql9tWX3i/pUR9/Z3GIdcQSZqAiTlBmIFa0hz7ejnQpbhXUT7Nr0yardtTr+hG5AkB3V8kZnc=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by SJ0PR10MB5568.namprd10.prod.outlook.com (2603:10b6:a03:3d3::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.32; Tue, 15 Jul
 2025 23:34:09 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%6]) with mapi id 15.20.8922.028; Tue, 15 Jul 2025
 23:34:09 +0000
Message-ID: <fb080bee-9165-9b47-fec2-fa73a332b86d@oracle.com>
Date: Tue, 15 Jul 2025 19:34:05 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v2] libproc: make Psystem_daemon() detect modern systemd
 properly
Content-Language: en-US
To: Nick Alcock <nick.alcock@oracle.com>, dtrace@lists.linux.dev,
        dtrace-devel@oss.oracle.com
References: <87ms986rrm.fsf@esperi.org.uk>
 <20250715190955.346459-1-nick.alcock@oracle.com>
From: Eugene Loh <eugene.loh@oracle.com>
In-Reply-To: <20250715190955.346459-1-nick.alcock@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PH7PR17CA0051.namprd17.prod.outlook.com
 (2603:10b6:510:325::14) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|SJ0PR10MB5568:EE_
X-MS-Office365-Filtering-Correlation-Id: 0cf81cc7-a6c7-40ce-33a2-08ddc3f818fc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?SllOK1BCL2NMUmRyVU51N09FclF3QmRYZmhyQU5MZ1dhQVpMVWRSdnZTU1V1?=
 =?utf-8?B?T0RjdzlBOHlrV2dZdWRTSk9xbEUvcFk5TFRINUorUUgxd05jRkhLOFU3Umdr?=
 =?utf-8?B?VU9rUitrWlIrUUFxdytrSlQ2T0xDNXZ5dGVBSVdqbEc3T05pbXc1K3VTRDlv?=
 =?utf-8?B?ZDl1cFp5azduc0lqSlZwcTk3TnhrR3ZxL3NmM09sQkVqMUdkMG9DdEc3bDZZ?=
 =?utf-8?B?QW1Ba29ZWU5hT21JWmgvZCtuUUEzbXdMTkRINDJoWHV2V3AxMGpLdi9TR090?=
 =?utf-8?B?S2VIM0hHbDNnYmh6SGlML1FZQVJkczI5clNMTlMzNDBRaTJsNDZmdWZWUVJD?=
 =?utf-8?B?eUdkQTJxWkpPUnJmeTdVSE10aTk5blhidWI3RUEzR3YwaUtWOWIxWEVuZFRa?=
 =?utf-8?B?T1ErOGRZRmZNV1Faa05YdnJ2SFVaeFhnOHFCVk9YYkFBK1pMSUhaVDFETGxp?=
 =?utf-8?B?ZUhWQXpsdGI1QXJKY3RqTnF5UU8vQUpmUEJEaUl2SWdQcnBub3kxcFZobFg3?=
 =?utf-8?B?eW14YXhxRDg0S2JlbDVKelhXSG5UNFRJRm5MaWtMZHdHZTZBRExPTDNCcStN?=
 =?utf-8?B?NVgvdnBrN3BSMjhmdWpvWVJONUZ3N1pQYUZadm93cGJSeElkYjJwVDd6amEz?=
 =?utf-8?B?TXYzb3VFOUhwK3NFQnNaVFl6eTkwRVY5Ujc4MDNESXRQTm5PTVhvQmxPWHpV?=
 =?utf-8?B?WUFHck51UGlMS1c3ZFJ0VGxndlE2NmRQa3NnaGVOU0tzYXdsNGpKUkRQeHk2?=
 =?utf-8?B?SVNUcEhnUTlGdk9qSU1pQjc0T2tZM2h1OEFFWDdwbTBGWktmbFJmcTJ5V3h6?=
 =?utf-8?B?cU0wRUlKTjdqUGpwNjVTT21LK1VuaUkvZUlleEFsRy9pclpORU9aNEUyeFNz?=
 =?utf-8?B?OCs5ZjkyeXR6V0NaME16NW1IVmxCNGZRem16QnhtK2dqTnlXRk1uWXhFNjRz?=
 =?utf-8?B?Q0dnVlIvVno5ZjRrQzFDTGZZZUJUbFRXTjBqaXRxNHJ1aEx5RVllV2FlbFBp?=
 =?utf-8?B?L3ZGUThsVUhMWlFKdHI5enRPWUttRHZTTERnWHp0NVNVRjBYT1F3MHF2STFZ?=
 =?utf-8?B?eTYxenlnZUdmbno1Ky96TmRuZVBWNmZqc3dLNzdUV3cwUlJybFJPTzNRR2Rr?=
 =?utf-8?B?OThBbXJpQ2YvYnllVXhSMXpCblVZdUg5and6dGl1c0xEU3hSdUcwOTZ3eW1S?=
 =?utf-8?B?cjZXMUNxcHlMbmRpSEpQZVYxWitMNFVMR3ExNW8yZ0duR1VFQUh2V0V4NlBY?=
 =?utf-8?B?WlhvVXlMM3BsT0hIUWYyZm1EZDFNYjE2OVFBZThyU0NyNHpPUlRvMWlhbUhS?=
 =?utf-8?B?MnpLWGJpZGxQNWpOaW5RQVdDa2NDbDlOYjFUZEJjR2JCbC9EZG1hOGw5U0M0?=
 =?utf-8?B?ZVpyMEUxTDErMEVNMzc5WVJadEp6SkprMnArc2habGgxQWNhVlA4T1ZwZ1FI?=
 =?utf-8?B?V2oyRWV1TmVRK28vZG4waFIra2RCeERLRUc3WDV6OW5pdmZIdkE5SFVBYzlH?=
 =?utf-8?B?WWpHQ25zK3pybUhNejlLNVhZVXRJdWhJODB5VGxlZ2dCSlFDUFZKNENxa0Vy?=
 =?utf-8?B?NnNQeTlXWlN3elJnTzVPaHdqZVJjYXVQbG9hRWIvUWk3azdaNUgrM2pxc1Ev?=
 =?utf-8?B?Vk1SOXlNbTRrR1REWDlDSTB5UDdoclBrQzhNMEFyNWdES1lrV2VNelFvaWxT?=
 =?utf-8?B?azhrRGl1UHFHK21jSDREN3I1QXZHYUordTJNK0VjcEs2VzZ6VFcvTTVXejhx?=
 =?utf-8?B?ZGFnTHNHdW5pMnZOeXJuNndsKzNhdW16MXBpc0pNa3lXSlVuNFpSYmFjNHlD?=
 =?utf-8?B?b1NFVGhXVkhDZXNTNnR5OXI5SzZPTWxpM3d4eDUyTk1wM2dIT1pyT3YzZVRK?=
 =?utf-8?B?c1hZSlI0bUIrUnNJaFh4N0VNa3hzSlJBU1Y5YXVMMHg5cVFLNUJxUzNnbWpD?=
 =?utf-8?Q?e7PTTLAAdQs=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TXpGQWFMbWRWNkg2V3pYa2NmZWJHQkpYL3FJMGdwcjdFUDhsbG1zMEs2UkZ6?=
 =?utf-8?B?RmtocTdGUysrMENKSVdLQjRRVytya1NRSlM4b2YwZFVUSTY2KzdFZHgvd3Iw?=
 =?utf-8?B?VHVYK2RHUVRnUE1oblZpaG82V0VjeGVaT0FJYTl5eXphak1uU3B2WEhva1RT?=
 =?utf-8?B?b2tIc0FuR0hLOFNvZlpsazE5WFBDdW56UXJpTE9waysydi9Ha3BZNEUxNU9Q?=
 =?utf-8?B?VVBFNzlxVW03WGlreGlaUHV4U2pUMzArNHFZU1BUMWJ1Z3llNVplalA3YVFR?=
 =?utf-8?B?dUtROVM5V2pOMEtEMDQxeVFYcU1JMnVid3VHMWJrNGJyNzljaytyZUVwQ0FW?=
 =?utf-8?B?VjMyVHNua2t5Q3E4RUpGeTV6MnZqaXVuK3NzZGltdWluNFlDNUVUMERod0s4?=
 =?utf-8?B?ZldVaW9QVk9LN21zZnM0ZWhVZEQ1S2Z4Wm9jMENqT1dlNTVHaWNNWGlPMWRJ?=
 =?utf-8?B?VEZIOVhSdGpyam9NUUsxbC9wQ0t1L294ZURkL3BBWXNmd2JvNGd4Z096OTZN?=
 =?utf-8?B?RXBRd05KeTc0MlhCZmhKS0lueUxlZ2g3dUo0dWRhdTM2ZHJQeERGNU5YTE9L?=
 =?utf-8?B?OFVJYzgxK2cwTzYzY1JWcWplTkw0UUs5eDJDVFVaRktpSzdYZ042Y3dhaXJ5?=
 =?utf-8?B?eDdnZWpEbnFqQ1BwWXBnNkgyWWxTUVlLRG52Z0I0OW94TkF0WHFEaW02dWln?=
 =?utf-8?B?b2FRVTJmVXQ4UzNwalBDUk9mNVJON1doSjVZZUE5dXBpeUpWSVp1YnlLOHpj?=
 =?utf-8?B?bnNXS0dpTWVmMnNTeWtqQko1Y1oyZFN3bVA1aTMyWmJjUTBoUTlsOVRtZDJW?=
 =?utf-8?B?TkZZTVVXZnE2Rm9YMWdjM1pNdkFHenZuOXpySEdTaUhZOFIwem9wY2xHUDZM?=
 =?utf-8?B?Qyt3amVIYXdjN2NDZXUrRHdTM1JaR29kNjhrRzFVNVhtL25sVEtSZHJLV1h4?=
 =?utf-8?B?Z3lrQmRRS0p3aUFGaVR5WjcxcVA3N2hwWkVwZ2Z2elhVUk9vdnY3QUF6WHFx?=
 =?utf-8?B?K3JxV3NTci9MUENIbmJ6aTZWNGh1SUdwVFpSejJKTitWdzBLUUFjNFFleUNG?=
 =?utf-8?B?K3UyMDNZam1EdWZ4MHVoVVZ0dlNNbit4RzBDdndIdEJ3b0Zqb1Y0MlRkcW1s?=
 =?utf-8?B?TzdiVUxUTzduVUFWbUJ1TjdkY3lKM05LbkxESng5cHM0ZkNRdCtXOXY4VEhT?=
 =?utf-8?B?OW1ndDRVQlE1eXdGWU5SR1lYdUxvVms5aEg3cGF6d1BVZmJlaTA1Q0pmYXUw?=
 =?utf-8?B?NVV0M0x2SXRGVktURlcrQ2drM2ROTzZhUjRjSXhoSXczMUFpd2pPTUJGdjRE?=
 =?utf-8?B?SzFEM2FxVTBkc2ExSU1zVDRLVVB1Wjcwd2Y1ejF0TnlVSmJrbGpoNXdkTWl3?=
 =?utf-8?B?eHZoazI0Vlk4ai82VFVCc1VxMU1GVTVoTHpZN0VObEtvWElXMnM4SnBvTzI1?=
 =?utf-8?B?VGZnNlZ1L29LNmhDZVg0MTVwQnR6MlZtbGhZdmNZOGVyWloyL2t2bE1LTFFs?=
 =?utf-8?B?eGZyVUJoSFlGa0ZZWWR1L2FJanJ6cVJrVXV6ZUtoZDQ4ZXEzTTJDclBQd0g2?=
 =?utf-8?B?dm9ua2plRnVqMWh5N3NNeERsbFRzWlNSSnc1cmZWbUY0TThocDUxbCtqcE9v?=
 =?utf-8?B?NnUvcFBVVk92emZ0ZjZNV0pKVzNHczFqSDV5UG9UNVdBTU4yNWRIZ1E4UTBM?=
 =?utf-8?B?aXVKaFJDODk3ZDRxcnFUZE5aVEd5d1BWdWlmRmxDTjJVaHhTMGMwZGVKQ09Z?=
 =?utf-8?B?UmxwT1VNTHl1b1lQeHozRm1yNk1leXJoVFhWb1RRWjNWaVhCMWNuYlFRNEht?=
 =?utf-8?B?ZElTMlhFNWtIMzRIR1dGQWszU0YvVTNsTFg2cTcwdSs2cTRjcUhMV2NtdHBy?=
 =?utf-8?B?V01VOUNPSlllTllONnZKWkF1ZzdjTmxIR2RZeGV2S3dGNFJlSStkaERuYUs2?=
 =?utf-8?B?Qk1obU5XU29sUytiak1EaHJLU29sOE5lMTI2MHJwbHVqQzFEOG1hRU5iZzZY?=
 =?utf-8?B?dDJkdG9LcVdYUFdqaUJtNDgrdldhU3VydHNIUTY4QlRlYVVtcGEvY01zdFor?=
 =?utf-8?B?eWNiQytoNUhXRldQOERVL3JJc0VDSXNVV2hiSWZzdUFIMXV6T0crN2FLNXpW?=
 =?utf-8?Q?rv6Tb/z9BcGFn21Cvu0dQxyqp?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	CDsyFoO901Ji5u9g3W0skj9OAYQZRC+/IAOb043gEBRY0rVCmsDkRQC5YIfuZUmq136wSTThL/AYrywnrAFMoIQHM8PxDrKhK4BXNVrjw7RA4Ocjo2WyVxsTU2ozJ8b3KY/wPKMCoHkb34gXZl3Jh0atmzFQmWgL9ST5Z1SJhrrWH3Kswm/SxI6Z2h6gPCU6McHa1CECnFK/Q4zKdDjq4Z4ufFcECBX7uG1Tm0e7FBxF9CMVby1mqmmO7lzYIpOWOeha9OAW9OE+O0SSr+3mVSLIxwUjQOQhDTrgi/p1VqnRpv/sso+vqKLD0CWJwXYrjw1aABHPVEoOtWxKDjbkE0ZKgGVd4P29znyrj8hHhbPVh/tmhRE2oWWL1kk2L6yeJ9V0ev5xsfWpOriOp627XVshj25CDR3Yg8Q6COVIOQ+xHWmp0LkHh3mVOu03FQee5TAiIhAjrI2A61OQm0XadScm0Ci98FzLOuEojdrRKKLWuk7CfpmPi4mjkZDD2589VRZk44TeHm5uMtk2wD/f0xtPUEnP1OOtB+iaG6svMKYxJN2Sukiz/UEWr7do0RgtSQquJeJwrq+hkLXWTbao3+V0Kfvk14d8bO6pYjfMHWE=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0cf81cc7-a6c7-40ce-33a2-08ddc3f818fc
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2025 23:34:09.6576
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lIYmOX1QRY6juoguv5T4vSyNr9h+jVgGsmrMe2nbf18WnJAakgWok5FhId34yNn6Mub4xMC3ydyHzZRfi0845Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB5568
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-15_05,2025-07-15_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 mlxscore=0 malwarescore=0
 phishscore=0 spamscore=0 mlxlogscore=999 bulkscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2507150218
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE1MDIxOCBTYWx0ZWRfX6yos/MOw+p9B hrcpQZbEkq+z4fXdNRWombzLsLtTj2sIyfaLL3HiO/FpgnJKgfz10hqZUTyUV/zHqGrKSp2C5AG WQB5kheakOjlxsWVz4YirEIbfXPt8JsAs7M29yhzJuih3FQ44yWoO12nZNoyQslsIzAc0VKaCjr
 uWQ56NUug4JXYgnoancILI++E32S4AJnI6yqgPKuDT1UCdASC7wACBrw7FA+0bd4deg0Dw00/IB 6R4SMwxzclII3ddT6vtbZRaGC7f0TTzkL8kShy+0XgKNGcbO3gDOh3BKwTqCyugLFwy3E+8LpAu Ou6VC7GHASyh1BVp0NoomHETNQssvL+LMOXfWIVbdNeZ02blgC108nEwIvsqwfHFvK4PZ8wwtIT
 u1MDUflshafP/y9p2ISEdRwd7+M7aueuKIRDQLQkWuXWWZhANwriaH8PzBEC/Z75ByZO0G7X
X-Proofpoint-GUID: opu87l-qcbaYx8104KxXbZtSf8WIBkni
X-Proofpoint-ORIG-GUID: opu87l-qcbaYx8104KxXbZtSf8WIBkni
X-Authority-Analysis: v=2.4 cv=J8mq7BnS c=1 sm=1 tr=0 ts=6876e575 b=1 cx=c_pps a=zPCbziy225d3KhSqZt3L1A==:117 a=zPCbziy225d3KhSqZt3L1A==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=l1LsryH0ufDg68j7PZsA:9 a=QEXdDO2ut3YA:10 cc=ntf awl=host:12061

Reviewed-by: Eugene Loh <eugene.loh@oracle.com>
I didn't check every detail, but read through and it tests fine.

On 7/15/25 15:09, Nick Alcock wrote:
> Psystem_daemon() is used when carrying out shortlived grabs to detect
> whether a process is too risky to carry out invasive grabs of (you wouldn't
> usually want to stop syslogd or, God forbid, try to ptrace PID 1, unless
> explicitly requested via -p: the process just coming up in routine probe
> firing is not enough).
>
> This has two code paths: a reliable one for systemd systems (which checks to
> see if the process is in the system slice, which contains precisely and only
> system daemons), and an unreliable one for other systems (which does the old
> Unix approach of consdering anything in the user uid range or with a TTY or
> with open standard FDs to TTYs to be not system daemons, and everything else
> to possibly be one).
>
> We were checking to see if a system was systemd by looking for the systemd
> cgroup hierarchy name in any of the victim process's cgroups.  This was
> reliable back in the days of cgroups v1, but alas in v2 where systemd runs
> all the cgroups if it runs any and there are no longer multiple hierarchies,
> systemd no longer names its cgroups this way and the test fails, causing us
> to fall back to the unreliable pre-systemd approach.
>
> Use a more reliable approach to detect systemd, the same approach used by
> sd_booted() in libsystemd; check for the existence of the
> /run/systemd/system directory.  Fix slice detection to work in the absence
> of a systemd hierarchy name (but keep it working when a hierarchy name
> *is* present, for older systems), and everything else works unchanged.
>
> We also arrange to fall back to the old code for any processes that are
> entirely outside of systemd management: this covers kernel threads,
> the occasional process that is part of systemd itself, and also processes
> running using Delegate= to give over their subtree's cgroup management to
> something else.
>
> Signed-off-by: Nick Alcock <nick.alcock@oracle.com>
> ---
>   libproc/Pcontrol.c | 101 +++++++++++++++++++++++++++++++--------------
>   1 file changed, 70 insertions(+), 31 deletions(-)
>
> OK, this doesn't regress with stdin coming from /dev/null on any systemd
> platform I've tried it on, old (cgroups v1) or new.  (Non-systemd, we will
> of course mistake most of the tests for system daemons and fail.  Don't
> run the testsuite noninteractively on such systems.)
>
> diff --git a/libproc/Pcontrol.c b/libproc/Pcontrol.c
> index 7d9b5055f8201..b5c4e27ef9d29 100644
> --- a/libproc/Pcontrol.c
> +++ b/libproc/Pcontrol.c
> @@ -2927,10 +2927,26 @@ Psystem_daemon(pid_t pid, uid_t useruid, const char *sysslice)
>   	int fd;
>   
>   	/*
> -	 * If this is a system running systemd, or we don't know yet, dig out
> -	 * the systemd cgroup line from /proc/$pid/cgroup.
> +	 * If we don't know if this systemd is running systemd, find out.
>   	 */
> -	if (systemd_system != 0) {
> +	if (systemd_system < 0) {
> +		struct stat st;
> +
> +		if (stat("/run/systemd/system", &st) < 0 ||
> +		    !S_ISDIR(st.st_mode))
> +			systemd_system = 0;
> +		else
> +			systemd_system = 1;
> +		_dprintf("systemd system.\n");
> +	}
> +
> +	/*
> +	 * If this is a system running systemd, dig out the systemd cgroup line
> +	 * from /proc/$pid/cgroup.
> +	 */
> +	if (systemd_system) {
> +		int found = 0;
> +
>   		snprintf(procname, sizeof(procname), "%s/%d/cgroup",
>   		    procfs_path, pid);
>   
> @@ -2941,47 +2957,70 @@ Psystem_daemon(pid_t pid, uid_t useruid, const char *sysslice)
>   		}
>   
>   		while (getline(&buf, &n, fp) >= 0) {
> +			/*
> +			 * cgroups v2: only one line, 0::-prepended, slice
> +			 * name always on that line.
> +			 */
> +
> +			if (strncmp(buf, "0::", strlen ("0::")) == 0 &&
> +			    strstr(buf, ".slice/") != NULL) {
> +				found = 1;
> +				break;
> +			}
> +
> +			/*
> +			 * cgroups v1: find the line with the name=systemd
> +			 * controller notation.
> +			 */
>   			if (strstr(buf, ":name=systemd:") != NULL) {
> -				systemd_system = 1;
> +				found = 1;
>   				break;
>   			}
>   		}
>   		fclose(fp);
> -		if (systemd_system < 0)
> -			systemd_system = 0;
> -	}
>   
> -	/*
> -	 * We have the systemd cgroup line in buf.  Look at our slice name.
> -	 */
> -	if (systemd_system) {
> -		char *colon = strchr(buf, ':');
> -		if (colon)
> -			colon = strchr(colon + 1, ':');
> +		/*
> +		 * We have our slice's cgroup line in buf.  Extract the slice
> +		 * name, skipping over the hierarchy number and controller
> +		 * fields.
> +		 */
> +		if (found) {
> +			char *colon = strchr(buf, ':');
> +			if (colon)
> +				colon = strchr(colon + 1, ':');
>   
> -		_dprintf("systemd system: sysslice: %s; colon: %s\n",
> -		    sysslice, colon ? colon : "(not found)");
> -		if (colon &&
> -		    (strncmp(colon, sysslice, strlen(sysslice)) == 0)) {
> +			_dprintf("systemd system: sysslice: %s; colon: %s\n",
> +				 sysslice, colon ? colon : "(not found)");
> +			if (colon &&
> +			    (strncmp(colon, sysslice, strlen(sysslice)) == 0)) {
> +				free(buf);
> +				_dprintf("%i is a system daemon process.\n", pid);
> +				return 1;
> +			}
>   			free(buf);
> -			_dprintf("%i is a system daemon process.\n", pid);
> -			return 1;
> +			return 0;
>   		}
> -		free(buf);
> -		return 0;
> +		/*
> +		 * No idea: this is probably a kernel thread or something
> +		 * else entirely outside of systemd management or delegated
> +		 * via Delegate=: at any rate, a system daemon.  We can fall
> +		 * back to the old mechanism in this situation.
> +		 */
> +		_dprintf("%i: probably non-systemd: delegated?\n", pid);
>   	}
>   	free(buf);
>   
>   	/*
> -	 * This is not a systemd system -- we have to guess by looking at the
> -	 * process's UID, controlling terminal, and the TTYness and/or location
> -	 * of the files pointed to by its stdin/out/err.  (i.e. we first
> -	 * consider whether something may be a system daemon by consulting its
> -	 * uid range and controlling TTY, then try to rule it out by looking for
> -	 * open fds to TTYs and regular files outside particular subtrees.)  (As
> -	 * a consequence of these rules, a process with no standard streams at
> -	 * all is considered a system daemon -- this is a cheap way of catching
> -	 * kernel threads.)
> +	 * This is not a systemd system, or we can't extract the relevant
> +	 * slice info from it -- we have to guess by looking at the
> +	 * process's UID, controlling terminal, and the TTYness and/or
> +	 * location of the files pointed to by its stdin/out/err.  (i.e. we
> +	 * first consider whether something may be a system daemon by
> +	 * consulting its uid range and controlling TTY, then try to rule it
> +	 * out by looking for open fds to TTYs and regular files outside
> +	 * particular subtrees.)  (As a consequence of these rules, a
> +	 * process with no standard streams at all is considered a system
> +	 * daemon -- this is a cheap way of catching kernel threads.)
>   	 */
>   	if ((Puid(pid) > useruid) || Phastty(pid))
>   		return 0;
