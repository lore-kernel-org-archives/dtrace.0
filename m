Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26094221F0A
	for <dtrace@lists.linux.dev>; Thu, 23 Oct 2025 23:16:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761261381; cv=fail; b=mK23T1YsVHvV9PhNjpB30G/fceGOdWLlX/NVwtXsaORJJ/XB8aml2NZHNMJvacnBYACkpE1pdY+pEdrsZ2vkS+m028EbVzZt5vv2eQnudH2amR3TgthZYvbJzdGrsueO2kPBmjZYjfVHf6zxxiun4wrofn8Wf2ChP2HJPkV2s1c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761261381; c=relaxed/simple;
	bh=f8Hge//ypi9m9Nbj8M9DVDaJphgrzgRGGNYYBQIyhL0=;
	h=From:To:Subject:Date:Message-Id:Content-Type:MIME-Version; b=Tfd/OWPFylmc3coPEIrxqnTL345LY18RdIKlvq25wx7cuGy3TeEqkjoj+YTLhZp2+mJhwyB9Jsqr4BiR0ttj10lOczwxOndGt8q+A+7RzQWP4flmYvskiGeWceu437I2RLSC20lW552xfhKGorGT1TGe1y3W+V8FLGAE1HihIgU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=V3yq3B0S; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=buqx+uTD; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="V3yq3B0S";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="buqx+uTD"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59NLNNCI023963
	for <dtrace@lists.linux.dev>; Thu, 23 Oct 2025 23:16:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=corp-2025-04-25; bh=P50TYb3EewuSUDWY
	sh8Xbp5ml4v9njBmSOm6ZjIVUpU=; b=V3yq3B0S6NP9cFwhiNrdl9Z9ueQhJu0h
	jFXN2XbfhbL5mPEiF2MJkc3L61mEMwZ5KaYH8YAyN1Ity7lDrGyJPSjfYV8Q+qQ5
	BPD3YcXKGfYLYqlcvdrlw3st8+J+Dynrl7g+KLsFTcZvvh+5hl4w7ACEIZYr0t/b
	zungPAla7vBTB7Md1vB2yHm+Q+/bEntBOQui14ENrj2/amxA6U6BuTFwgxisii0R
	D0rxe/i9jVsReuzODmOVP8O32ssykIszBFjvUu1axzicSnIP35hsUAujhmQSHvEG
	D/mX4aVLttZ/l0NuM75ZUPned7KvbW8EHcoxTbdXqJeSBv2V9DOg/g==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 49xvd0unb9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 23 Oct 2025 23:16:18 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 59NLpGXI000850
	for <dtrace@lists.linux.dev>; Thu, 23 Oct 2025 23:16:17 GMT
Received: from ch1pr05cu001.outbound.protection.outlook.com (mail-northcentralusazon11010042.outbound.protection.outlook.com [52.101.193.42])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 49v1bf61tx-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 23 Oct 2025 23:16:17 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=f2r4eewqjea0ljkMX8Bq5SHLxV3Du7mDLpbk3BLHAzQ/jceh44shxilb0muQb3qhPNQNw56RVX800rYwQAq1Tu0Z7y0SDqXJEkx0tyxCkw1wo0YEGeSR0tXjZquO8OURf6hEK/i33Lk4pKu66KtbkXel6DvJD2rRvttKTY0dVhoDJwoFCzUlTZQdSdyPpaY/ZAQnLT9Y2BfWftILj6Nm0RLF2SbDh+xUuhrx1ipFGGOXAtcXVFCc2oGS6BS8WWlqDeR4TVI4DeUuoWjPsoGWOADBb5yS8k+sOzRp+lEz2H3/28Uz6F/82h0awx4LfDWUa9FZ+vUyaGGmAsMMCnUa0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P50TYb3EewuSUDWYsh8Xbp5ml4v9njBmSOm6ZjIVUpU=;
 b=b/KJ2DpJEq4G+drstrcD9aTrsDLQRbbSQDUHFJxtbXCMhQixwam+fuWhMyQ2pu4eKm01t/M2M8+ikdm/xPaSl+cYTX/9OLukXRf39l1POn1vqj7XPYHSkDpDkobPbDqo+uRcI/KGQdGzftpiNu038lwdwnH8C5I5Au4UXsTeftbEXYW+ntwSN4Y9IuTGPQ+LmVXLLyGktQ1F11l5PvZ5Iw/c+E8oOBjfVWFllZqsTXIKW9CGJ/3kBKu8H+D+cTAL3/BbGsfXdyn/Bd210dD7ibc4wixzns3ofnZRfLCQ+MS8rY8ku2M6d2bZnrzU9LqTf19C+o6ofNkPnugPmv8awQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P50TYb3EewuSUDWYsh8Xbp5ml4v9njBmSOm6ZjIVUpU=;
 b=buqx+uTDlAzpPsRwfSCeTvx+w1ApkXZebeWGGURn7kNCP/QcRYUD/5hnl5PsWBPbFN/eWJsRJU8c4o9jMtc/5rgkZPI84aV80tK+FZ7bbrKi5o1Q1kKlG7I2Gr4twVxApKJLiMRZfdOwP4PTwA+c4kt36VnRsbqQGALHhE+BFC0=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by SA2PR10MB4716.namprd10.prod.outlook.com (2603:10b6:806:11b::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.13; Thu, 23 Oct
 2025 23:16:13 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::c47b:6cdc:87b1:aa6b]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::c47b:6cdc:87b1:aa6b%6]) with mapi id 15.20.9253.011; Thu, 23 Oct 2025
 23:16:12 +0000
From: eugene.loh@oracle.com
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH] doc: Add blank line before bold text so it is rendered correctly
Date: Thu, 23 Oct 2025 19:16:11 -0400
Message-Id: <20251023231611.25338-1-eugene.loh@oracle.com>
X-Mailer: git-send-email 2.18.4
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PH7P220CA0139.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:327::30) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|SA2PR10MB4716:EE_
X-MS-Office365-Filtering-Correlation-Id: a9d2d67a-ada5-42e2-ffda-08de128a2886
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?L2I2dFFjSEZMR1hWYThYVXduM2VYWCtBNlBYM3I0THJpZGNiamZpTTNVRzMw?=
 =?utf-8?B?OGdjZHNGNGtBWUR4K3lCTmthKzZ5eTJlaXRBOE9ONEhUVS9NMllWU0hrcm1m?=
 =?utf-8?B?TnMwWlhnOVJxUEtCSGM1VVYzZTVybmNOUk5rQWluekY5WWFPSDJodXlyeTZC?=
 =?utf-8?B?WDhQU1JlVVdzU0h5N29TQ0M5VW53eHlpQmdldi83bno2Unlqakl6TXdHRkd1?=
 =?utf-8?B?TWR5bC9YY3duMTlVS1o0MU4yRndFQzNnQTdBZGl6ZmxWMkROaUhHR0hqaVAv?=
 =?utf-8?B?Q3VtN2FVMHVhWlpRWHlzck1GZUFWRzNEQlF2SWZCRnBJMk0zTVdpaVNmTGx1?=
 =?utf-8?B?VWJHeXUxWHczM252RkRKVXBZRG44am5hRWJsZSszMktvZ1R0ajFrWGViNnZo?=
 =?utf-8?B?NjdWVkh6Y1FZUmtJRE91MzVQemdyaDRzdE12aHQ1dzAvSDJObDBIUkUxTlJ3?=
 =?utf-8?B?Qkt3ZzZjVTY5K2NxYjVuRWkvTTN3bGJGWUZDaU8xcWsxMEVvU3d6b3pwNldn?=
 =?utf-8?B?clo1eUo0UUUwUVVXU2hTa0g3UnhMYktCVDVaMkdibytWVE9YWHBWc3ZxRWwr?=
 =?utf-8?B?T0RRVmtsdnFyVHNveXh4c1hqU2Jkbm9ETGw3ZE5ScWNnUldSOVRoRWVPeW1L?=
 =?utf-8?B?NFZuOWxKTDhyd3ErQ0dkVTJOVXhRMkxyb1Y0U3hLMnlxVWZUUnpibGZQWXU2?=
 =?utf-8?B?R0JoSDdDRFZuT2dWRmJUV1V6R0FkUVlzK2dNeDFhOTlCYlFDT0RQa2FkeUty?=
 =?utf-8?B?Qkd5R3Byd1VoeUxMb1UwUzlqckhuSGc3cG5XYmdyZTNOaWVIMzBvaW1Ib2lw?=
 =?utf-8?B?eEg2RjFWMyt6TXBPV2d0RGRiOHhnUkY2SkFHV2lzNVFPdDcvTVRubmhjVVJo?=
 =?utf-8?B?dFljTGlVbko3SXVrUEgxd0NOWEdVbFNCaEo4bnFabmc1R2xEenVmdE1Dd0lH?=
 =?utf-8?B?OVFxWHpmdmwzWWVXZmNRRTJzZXdoblMzbzN6MXVtM2VpUDVHaDlYKzRsaHZz?=
 =?utf-8?B?dzg4ZllGN3VnNW5WbC9xMitrZlY2Y2pobWEvUzNNL1phb1p0VFFKNXJIbkhn?=
 =?utf-8?B?SCsycllLRk1sZUhqY1ZNcXViVFhDYzNEM3BPY1RybjJlZVJkaEdtVmFWa09H?=
 =?utf-8?B?akxDTTltNXgwWjdtZTc5Rm5MVUdlZWZiNXhGSWtOSDhTaC8yN2Rka2pST0Fi?=
 =?utf-8?B?K0Y1ZVk3aXI1Q05mSkttZEVKL1FNTXNLdU1vV1lCaUFXU3Fud1RuMmZZRjRu?=
 =?utf-8?B?UW93N0t4THZGYVhYbkZhZUJJRnlwUnV4aHc5NDVCb21jNTUwY1hvU2NLeTlS?=
 =?utf-8?B?TjcrdTlZWXRBaXJlKzFQd3NsMUhJRHFTUUVHclVDRG5ockdOVnVrZklwcFg3?=
 =?utf-8?B?b3JzM0RGLzJvNkFpVTBuUWlzdEQ2RkI2MVpMSWhpUk5XZ3A3ZE5XdkFLV1R5?=
 =?utf-8?B?MEdjR09hMUFSbXRZZmRzMUl3a0hBcDZtdG5sOFhqMXZOOFZZNEJ1ci9IUkc4?=
 =?utf-8?B?R2hvNnd1aVZGNmxaVEZTeHZDQTIxVnl3Mk4vOE56T3ZWQmE1VVdNMnUyUjgz?=
 =?utf-8?B?T0xmL1FUNUxtNWNCQy83elQ3QThjOGNxZVkyaVdCSUZCMU43dGVEV0xndURh?=
 =?utf-8?B?VWN3eXhxcndRTFlvem1sNGorK1NaWkhTOWlLMzYwU1cvaG0vQ2VHeENuZitE?=
 =?utf-8?B?azgwZlRVTkxNeGRPQXhCOXo1YzVkbXRnVTN0aVdISUp6Z1RFZHExNVpzNHhB?=
 =?utf-8?B?MHl2UmpiVWtGUkI4ZU9BU2pzcDVacVlYOVcyQlozemVmWGxOT1pNZzZ5RXZj?=
 =?utf-8?B?TW9TWHBXcDRVV1E3aGxOMjVDT051c3kyVVBmUXEwb0U1MklaelFDaE5NaEZ5?=
 =?utf-8?B?NVY1RWg0dXVlODRka1ZhcXZXaXVWdUxjcFZCdXBLUGVUL2EyMkxLeWhCZ3Ir?=
 =?utf-8?Q?J3NA9tNEc1jrPLSEoVvVWWyIAjQr0IeJ?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RkhsTEJTanNxdHB6Mm5tK0JUTG10Vk9aeWRxaG1naE1rMkNoS05zejdZSDJ4?=
 =?utf-8?B?Mng0WDVyWlpLUjRXWnE2ZjRramxqYjRWWTZPSG4wYjE4TUIzbEJZYzBDUnBS?=
 =?utf-8?B?SGpiQWw3V1UxelY1ZFNGNG5kUys3SVQxeVNWNDVGT3hOQkdwV1pMVWJYajQx?=
 =?utf-8?B?dDdpR0cyelE1TzMrbzc5RDBIdnhrS3pTYXdvTytyRWFNZ0dPMzJndERsd08y?=
 =?utf-8?B?ZzZ6SHNZd1hHNW5xOTRIeFJRdDZTbGQxdnpFNVVteVg4KzZKanlmQXQxbXBu?=
 =?utf-8?B?SVF6MDVjUXFVeDhnZUgvWjBNTGU0eTdPQmtOQXlBWHMxK0RwY2VFY1dOeXpx?=
 =?utf-8?B?VjhXaTJoWkN3WlN1dUREWjNTU3IvMXJ4UVAySEdEMWFPeWJlYmdTNmlieWhr?=
 =?utf-8?B?d2dXTDJlbUdtY0tybWE3UnRGcnRncFlOcXhWcFBFaEtDaXFpL2pkRmJ3RVdS?=
 =?utf-8?B?b1phaGtFREpoMFo1NS9sYzlUOHV1WWhvOG5EVXBIemEwa3BvblEzQ3o4NXUy?=
 =?utf-8?B?ZlZkaGMvK0Z6QUZUdTVmRDgyVWJJY0VVYlJBM1l0VGhVZkYvZWtkb3hHRzZS?=
 =?utf-8?B?SXYyOEZoQmFWMDRld0hTY212VjBvUm9DVlZDNVRCME9YWUNuSDdMdlJpR1cr?=
 =?utf-8?B?SEJGVzB3ajR6b1lJbHpnTWUvb2hGQXRxeFIvOE41OGtadFF2WndRbU5yWnZD?=
 =?utf-8?B?VjE3SERTMXN1Zmk5MURrbXBnUVlpZ1Vuemo2UlZTQmd6QzZIQUQ3dGZNdXYy?=
 =?utf-8?B?NHZKNktKYkhVaHJZK3ZZLzdGMGp2Q2N4Nm5pZnM0bEdHRDZxTkthLy92SEto?=
 =?utf-8?B?anF1SU1lSTVUUkdCTGxyaTZKVzF1TUNOOGJPWWJNOW9RMjRvZUoyWEk2UzBE?=
 =?utf-8?B?NDNiODlPQ3BOTXRPc0RteUdGdXpNOTJKVmhoYjBDUzBralorL3VWSlJXcmFz?=
 =?utf-8?B?L2FvTU45NUlPeEVXZ3hiRlhUajZwdVA5MWY1UE5iQWNwRThtUVFiOVFpaWlZ?=
 =?utf-8?B?NlJzeDBUajUwUGdZS0NqQlpJSzBHY2xmZWRwZjVZQXJqKzRkYjZ2OUxTSkNr?=
 =?utf-8?B?dUliQWRESEZ0ZGlOQjNEZGRwa05EdG5NaW5HOVozMUJCeHV6TTlrbTBXTlpZ?=
 =?utf-8?B?SUJsS3Uybno5a3dtUDlkYm5rdm5PMStDc01qUXluZG94VmRDdWxJQnZCM016?=
 =?utf-8?B?QnRYdXZYUXdPdFQvdEhTeTFMTnhUV08rZ20ySUM0cWlGMWswVWlJWXA5R3dq?=
 =?utf-8?B?Z3RUMnViWXlEQ0U0VWRrZDhGVEJOOU10eWtwYithWUh6VW1tSk0wckhzUjJN?=
 =?utf-8?B?bEtBaWtsdGVXUHlXSU0xSFh6aGJ2UVVoMTBncnVPMjNBNnJ0ZzRmT3RtWmkv?=
 =?utf-8?B?TzdSZjU1SVBRNTBkc0VQMkJuak9VTFlRY0JkWjNzbUtjZUFzS1NKejFkN0FO?=
 =?utf-8?B?eEpidzczU0NyYmpyTjN0MGVIR05Iek9jeFovSlRKZXljU2R2UDhZY1IxUnlk?=
 =?utf-8?B?dnUzejd5cFJPbmNiVnNYY2pmY0hWbzl0anBtT1BUUGF6VTZmeERSbHc0elV4?=
 =?utf-8?B?Z2t4SnlxcE92NW5DS25WZGFLOEErVFFnczR4NHlmWmlCTHl2NWVqek8vZVlm?=
 =?utf-8?B?Nnd4YXFGQVV3a1VwNmdmalFKb3RnV2I4T2theHN1RThqWkRMZllrOXMwN2pa?=
 =?utf-8?B?Tkd6OTJESzl0MERIaW1rL01weFBLUDJEMnlkUCtsZWsvd0pWcktObndHUGxB?=
 =?utf-8?B?WFNWNlhyV0hJTkNPdGZOeG02aVpucHhYKzdSRm5DR2NqRzJwYUhvYlZUdVl5?=
 =?utf-8?B?b1BqM0pBZmtQakZyVUIxTmdrZ2tjZWQ4OTQvbUFOT1dyTmpPVXRnUWhoUUhN?=
 =?utf-8?B?N0Irdmw3Ylh6d2tPeDNHTWlCSVpKR2FXd1M1a1lFK2xHTDQ4WHROOUJpeFpZ?=
 =?utf-8?B?UWsveFFnbDNhN1FXc3plcnE3YXhlNk5KM3hzbWRIMEh4WlNBQzNha0dqQ0d5?=
 =?utf-8?B?ZTJHZlZxYmxBZU1aTk5taUpuQmQvUTZTbDZ3MzFoYmk0NHBnVktiM3dSaERP?=
 =?utf-8?B?a0M5Mk1pcGR5eXNoTmErZjRFS3VUUE9WTUxWTXlEKzBOUE15R0xrcWNITnlh?=
 =?utf-8?Q?A6FXWBZpKtzZqt2kR8kc23CKe?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	zYmuWCRoSAKLedmBYNtSInNbKY8uHIy91XcQDrdjTqbHjN/f8vaG3aE3jLqs3+K2OUVtliT6ht2S7G7yeKSWdSSWErJ3VUzh0Dhg8K6r4ezKhcNpq80ThQ1+250rWzJLbtku8DmXBmAgRWfHP+lAE9vYN7MkLpHO5RwKxozhshhIlu0+nIiy6mqtImCnDF6RKn/JpDwm2TbN1X3ePBLmf+SKwYv5Fifu5AwxcUGNmtyAELrZRYbXm8KewME2mx6elSd9baLiRO+9g/3H85FsTrynSZnlxONhA7NwroJDSHNkHC019Jtmw03S01PA70Z7YUtYIwJhgGGiZdjUlelghe9peIySGYzTGkayo1g4NDZcvfaAZ1pP5dLxUpnWXvGPnQviZk1Oqx2wPMZoC15moXljvDcPv+s6afQNFsch/t9Wu6lN4+DQCegk9dGYkEDHblqhHI9+/YSDL4BKHTYD9cm7rxGSp0CrhaD/YWzCfYfPLdtNaHD4KX59IHo+m+cDxOvzpFM7U/3tXcJvCB2iE920tXyr5KJpXHHYe6C2nlWeemH4wY4ctIjoir34gIo20//FSg5TcdONeBqZmMiM56XyomznBAAlMw4ig5RcS6E=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a9d2d67a-ada5-42e2-ffda-08de128a2886
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2025 23:16:12.9195
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HPQ97A2vlA/Ar8MC4Vdctr0YLXdmuOACMQ9p/RUDNvmxNv4lme0npfZCXxBX/s8GecAffKpopeyg42B4bibFLw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR10MB4716
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-23_03,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 malwarescore=0
 suspectscore=0 spamscore=0 adultscore=0 bulkscore=0 phishscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2510020000 definitions=main-2510230212
X-Proofpoint-ORIG-GUID: DQ-zyGJjeltyUDVN0p6h9rGzKRWsQBMY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDIyMDA3MyBTYWx0ZWRfXzGHpf0LODwnP
 DsoY2MFG5fniyKggzoOijyXFyAgW0PO6Yx+R9GMgnRQrcwMfH+rpOqIl1GAV/np11x3iXtQXjqU
 Tu6ceWanrAKQs9riNaoO89gGVQUNEWGI0I8Y0wBLxxfJvk6KxIo/UsGLvVHpysD20BkHMzwW7gx
 vOPBWkdD558A1fPayVPwviQKk/PISWY0WUhuqlHrFyd+Tly/8xqoIaZSeNWGML6/ki0aR/ps8NX
 9vAMpU4Zcx5sHhjnZH50nNKsnqdQxs98tUlxMEJJFbm0MHrCFJ6u/oui4C5Ld/zJdFAV8YwsdCb
 uTL45aj2eXX2wMp8N4JeKntxggHdcPqXoptLaqLQriZNpZlwy/AgOBGwLV7B01N4riPbE+7wFir
 Gh/yoA3hT0nKQyDpdidhMJD0Eet2og==
X-Proofpoint-GUID: DQ-zyGJjeltyUDVN0p6h9rGzKRWsQBMY
X-Authority-Analysis: v=2.4 cv=D9RK6/Rj c=1 sm=1 tr=0 ts=68fab742 b=1 cx=c_pps
 a=WeWmnZmh0fydH62SvGsd2A==:117 a=WeWmnZmh0fydH62SvGsd2A==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=x6icFKpwvdMA:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=yPCof4ZbAAAA:8 a=jG6MlBh39zVTqKH4wXAA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10

From: Eugene Loh <eugene.loh@oracle.com>

Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
---
 doc/userguide/reference/dtrace-ref-DTraceSupportforStrings.md | 1 +
 doc/userguide/reference/dtrace-ref-Variables.md               | 1 +
 doc/userguide/reference/dtrace_providers_io.md                | 1 +
 doc/userguide/reference/dtrace_providers_lockstat.md          | 1 +
 doc/userguide/reference/dtrace_providers_proc.md              | 1 +
 5 files changed, 5 insertions(+)

diff --git a/doc/userguide/reference/dtrace-ref-DTraceSupportforStrings.md b/doc/userguide/reference/dtrace-ref-DTraceSupportforStrings.md
index e9239026f..641f666d9 100644
--- a/doc/userguide/reference/dtrace-ref-DTraceSupportforStrings.md
+++ b/doc/userguide/reference/dtrace-ref-DTraceSupportforStrings.md
@@ -132,6 +132,7 @@ Returns 1 \(true\)
 Returns 0 \(false\)
 
 </td></tr><tbody></table>
+
 **Note:**
 
 Identical Unicode strings might compare as being different if one or the other of the strings isn't normalized.
diff --git a/doc/userguide/reference/dtrace-ref-Variables.md b/doc/userguide/reference/dtrace-ref-Variables.md
index d3afa3833..70e214c14 100644
--- a/doc/userguide/reference/dtrace-ref-Variables.md
+++ b/doc/userguide/reference/dtrace-ref-Variables.md
@@ -167,6 +167,7 @@ Yes
 Any probe that fires accesses an instance of the variable specific to that particular firing of the probe.
 
 </td></tr><tbody></table>
+
 **Note:**
 
 Note the following information:
diff --git a/doc/userguide/reference/dtrace_providers_io.md b/doc/userguide/reference/dtrace_providers_io.md
index 40851042c..67c5c7d34 100644
--- a/doc/userguide/reference/dtrace_providers_io.md
+++ b/doc/userguide/reference/dtrace_providers_io.md
@@ -139,6 +139,7 @@ Probe
 `fileinfo_t *`
 
 </td></tr><tbody></table>
+
 **Note:**
 
 DTrace doesn't provide the option to use `fileinfo_t` with `io` probes. In Linux, no information is accessible at the level where the `io` probes fire about the file where an I/O request originated.
diff --git a/doc/userguide/reference/dtrace_providers_lockstat.md b/doc/userguide/reference/dtrace_providers_lockstat.md
index c1d3eb4de..d21c526d2 100644
--- a/doc/userguide/reference/dtrace_providers_lockstat.md
+++ b/doc/userguide/reference/dtrace_providers_lockstat.md
@@ -241,6 +241,7 @@ Probe
 —
 
 </td></tr><tbody></table>
+
 **Note:**
 
 `args[0]` has a pointer to the lock in question. The probes that fire in case of contention report a `uint64_t` `args[1]`, which is the wait time in nanoseconds. The `rw` probes also report an `int` that's either `RW_READER` or `RW_WRITER`. Finally, `adaptive-acquire-error` reports an `int` with a non zero error.
diff --git a/doc/userguide/reference/dtrace_providers_proc.md b/doc/userguide/reference/dtrace_providers_proc.md
index d799efd72..3ac8b706a 100644
--- a/doc/userguide/reference/dtrace_providers_proc.md
+++ b/doc/userguide/reference/dtrace_providers_proc.md
@@ -124,6 +124,7 @@ Fires when a signal is sent to a process or to a thread created by a process. Th
 Fires in the context of a newly created process. The `start` probe fires before any user-level instructions are executed in the process.
 
 </td></tr><tbody></table>
+
 **Note:**
 
 No fundamental difference between a process and a thread that a process creates, exists in Linux. The threads of a process are set up so that they can share resources, but each thread has its own entry in the process table with its own process ID.
-- 
2.47.3

